<?php
    namespace app\components;

    use Yii;
    use webvimark\modules\UserManagement\models\User;

    static $SWS_UserObj;

    class SWS_API
    {
        public static function find(int $userID = null)
        {
            #De forma que no haga búsquedas si ya se hizo una primera vez
            if(!$GLOBALS['SWS_UserObj'])
            {
                #Consumiendo la API del SWS
                #Los usuarios totales se reparten en tres niveles
                #Se guardan en un array ya que es necesario diferenciar su nivel
                $nivel1 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=1');
                $nivel2 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=2');
                $nivel3 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=3');
                $niveles = [json_decode($nivel1, false), json_decode($nivel2, false), json_decode($nivel3, false)];


                #Identificando al usuario actual y sus datos personales
                $userId=  $userID ? $userID : Yii::$app->user->identity->id;
                $usuObj= User::findOne(['id' => $userId]);
                $usuRFC = $usuObj->rfc;
                
                #Busca al jefe dentro del SWS, en caso de no encontrarlo retorna NULL
                #Es necesario revisar los nombres esten bien escritos, incluyendo acentos
                #Por el momento falta gente en el JSON
                for($i= 0; $i < sizeOf($niveles); $i++)
                {
                    foreach($niveles[$i] as $object)
                    {
                        if(Utilidades::lazyCompare($object->titular, $usuRFC))
                        {
                            $GLOBALS['SWS_UserObj'][] = $object->descripcion;
                            $GLOBALS['SWS_UserObj'][] = $object->titular;
                            $GLOBALS['SWS_UserObj'][] = mb_strtoupper($object->titnombre);
                            $GLOBALS['SWS_UserObj'][] = $userId;     //id del usuario
                            $GLOBALS['SWS_UserObj'][] = '';         //aun no se sabe el nivel(int), este orden es el mismo que los otros arreglos de usuarios
                            $GLOBALS['SWS_UserObj'][] = $i + 1;     //nivel en número

                            $GLOBALS['SWS_UserObj'][4] = SWS_API::getNivel(true);;     //nivel en letra

                            return 1;
                        }
                    }
                }
                return 0;
            }
            return 1;
        }

        public static function getDepartamento()
        {
            SWS_API::find();
            return $GLOBALS['SWS_UserObj'][0];
        }

        public static function getRFC()
        {
            SWS_API::find();
            return $GLOBALS['SWS_UserObj'][1];
        }

        public static function getNombre()
        {
            SWS_API::find();
            return $GLOBALS['SWS_UserObj'][2];
        }

        public static function getID()
        {
            //ID de usuario
            SWS_API::find();
            return $GLOBALS['SWS_UserObj'][3];
        }

        public static function getNivel(bool $verbose)
        {
            SWS_API::find();
            $nivel = $GLOBALS['SWS_UserObj'][5];

            return (!$verbose) ? $nivel : ($nivel == 1 ? 'DIRECTOR(A)' : ($nivel == 2 ? 'SUBDIRECTOR(A)' : 'JEFE(A) DE OFICINA'));
        }

        public static function getSubdireccion()
        {
            SWS_API::find();
            
            #solo si es jefe
            if($GLOBALS['SWS_UserObj'][5] == 3)
            {
                $sub1 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?subdir=subadm&nivel=3');
                $sub2 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?subdir=subpla&nivel=3');
                $sub3 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?subdir=subaca&nivel=3');
                $subs = [json_decode($sub1, false), json_decode($sub2, false), json_decode($sub3, false)];

                #se busca en las tres subdirecciones
                for($i= 0; $i < sizeOf($subs); $i++)
                {
                    foreach($subs[$i] as $object)
                    {
                        #se encuntra el nombre dentro de una de ellas
                        if(Utilidades::lazyCompare($object->titular, $GLOBALS['SWS_UserObj'][1]))
                        {
                            #la unica forma de identificarlas es por el nombre
                            $departamento = ($i == 0) ? 'SUBDIRECCION DE SERVICIOS ADMINISTRATIVOS' : (($i == 1) ? 'SUBDIRECCION DE PLANEACION Y VINCULACION' : 'SUBDIRECCION ACADEMICA');

                            #Se recupera el JSON y se guardan solo sus valores
                            $subs = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=2');
                            $subs = json_decode($subs, true);

                            #se busca al subdirector deseado
                            foreach($subs as $sub)
                            {
                                if($sub['descripcion'] == $departamento)
                                {
                                    $subdireccion = array_values($sub);
                                    
                                    #Se pasa a mayúscula
                                    $subdireccion[0]= mb_strtoupper($subdireccion[0]);
                                    $subdireccion[1]= mb_strtoupper($subdireccion[1]);
                                    $subdireccion[2]= mb_strtoupper($subdireccion[2]);
                                    $subdireccion[]= SWS_API::buscarID($subdireccion[1]);
                                    //Se usara en las firmas
                                    $subdireccion[]= 'SUBDIRECTOR(A)';
                                    
                                    return $subdireccion;
                                }
                            }
                            return $departamento;
                        }
                    }
                }
                return 0;


            }
            else if($GLOBALS['SWS_UserObj'][5])
            {
                #es el mismo subdirector
                return $GLOBALS['SWS_UserObj'];
            }
            else
            {
                #es el director
                return 0;
            }       
        }

        public static function getSuperior()
        {
            #Devuelve la firma del lado izquierdo
            SWS_API::find();

            #si es de nivel 3 devuleve la subdireccion a la que pertenece
            #si es de nivel 2, el mismo
            #si es de nivel 1, el jefe de planeacion
     
            if($GLOBALS['SWS_UserObj'][5] == 3)
            {
                return SWS_API::getSubdireccion();
            }
            else if($GLOBALS['SWS_UserObj'][5] == 2)
            {
                return $GLOBALS['SWS_UserObj'];
            }
            else if($GLOBALS['SWS_UserObj'][5] == 1)
            {
                return SWS_API::getJefePlaneacion();
            }
        }

        public static function getJefePlaneacion()
        {            
            #Se recupera el JSON y se guardan solo sus valores
            $jefes = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=3');
            $jefes = json_decode($jefes, true);

            foreach($jefes as $jefe)
            {
                if($jefe['descripcion'] == 'DEPARTAMENTO DE PLANEACION, PROGRAMACION Y PRESUPUESTACION')
                {
                    $pla = array_values($jefe);
                    
                    #Se pasa a mayúscula
                    $pla[0]= mb_strtoupper($pla[0]);
                    $pla[1]= mb_strtoupper($pla[1]);
                    $pla[2]= mb_strtoupper($pla[2]);
                    $pla[]= SWS_API::buscarID($pla[1]);
                    $pla[]= 'JEFE(A) DE DEPTO. DE PLANEACIÓN, PROGRAMACIÓN Y PRESUPUESTACIÓN';

                    return $pla;
                }
            }
        }

        public static function getDirector()
        {
            #Se recupera el JSON y se guardan solo sus valores
            $director = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=1');
            $director = json_decode($director, true);
            $director = array_values($director[0]);

            #Se pasa a mayúscula
            $director[0]= mb_strtoupper($director[0]);
            $director[1]= mb_strtoupper($director[1]);
            $director[2]= mb_strtoupper($director[2]);
            $director[]= SWS_API::buscarID($director[1]);
            $director[]= 'DIRECTOR(A)';

            return $director;
        }

        private static function buscarID(string $rfc)
        {
            $modelos = User::find()->all();

            foreach($modelos as $modelo)
            {
                $modelo_rfc= $modelo->rfc;

                if(Utilidades::lazyCompare($modelo_rfc, $rfc))
                {
                    return $modelo->id;
                }
            }

            return null;
        }

        public static function buscarNombre(string $rfc)
        {
                $nivel1 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=1');
                $nivel2 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=2');
                $nivel3 = file_get_contents('http://sws.itvillahermosa.edu.mx/ws/jefes?nivel=3');
                $niveles = [json_decode($nivel1, false), json_decode($nivel2, false), json_decode($nivel3, false)];

                for($i= 0; $i < sizeOf($niveles); $i++)
                {
                    foreach($niveles[$i] as $object)
                    {
                        if(Utilidades::lazyCompare($object->titular, $rfc))
                            return mb_strtoupper($object->titnombre);
                    }
                }
                return null;
        }
    }
?>