<?php
    namespace app\components;

    use Yii;
    use app\models\ReqPersonal;

    static $SWS_UserObj;

    class SWS_API
    {
        public static function find()
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
                $userId= Yii::$app->user->identity->id;
                $perObj= ReqPersonal::findOne(['per_fkuser' => $userId]);
                $perName = $perObj->fullName();


                #Busca al jefe dentro del SWS, en caso de no encontrarlo retorna NULL
                #Es necesario revisar los nombres esten bien escritos, incluyendo acentos
                #Por el momento falta gente en el JSON
                for($i= 0; $i < sizeOf($niveles); $i++)
                {
                    foreach($niveles[$i] as $object)
                    {
                        if(Utilidades::lazyCompare($object->titnombre, $perName))
                        {
                            $GLOBALS['SWS_UserObj'] = $object;
                            $GLOBALS['SWS_UserObj']->titnombre = mb_strtoupper($GLOBALS['SWS_UserObj']->titnombre);
                            $GLOBALS['SWS_UserObj']->nivel = $i + 1;
                            $GLOBALS['SWS_UserObj']->dataID = ReqPersonal::find();

                            return 1;
                        }
                    }
                }
                return 0;
            }
            return 1;
        }

        public static function getNombre()
        {
            SWS_API::find();
            return $GLOBALS['SWS_UserObj']->titnombre;
        }

        public static function getRFC()
        {
            SWS_API::find();
            return $GLOBALS['SWS_UserObj']->titular;
        }

        public static function getDepartamento()
        {
            SWS_API::find();
            return $GLOBALS['SWS_UserObj']->descripcion;
        }

        public static function getNivel($verbose)
        {
            SWS_API::find();
            $nivel = $GLOBALS['SWS_UserObj']->nivel;

            return (!$verbose) ? $nivel : (nivel == 1 ? 'DIRECCIÓN' : (nivel == 2 ? 'SUBDIRECCIÓN' : 'OFICINA'));
        }

        public static function getSubdireccion()
        {
            SWS_API::find();
            
            #solo si es jefe
            if($GLOBALS['SWS_UserObj']->nivel == 3)
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
                        if(Utilidades::lazyCompare($object->titnombre, $GLOBALS['SWS_UserObj']->titnombre))
                        {
                            #la unica forma de identificarlas es por el nombre
                            $departamento= ($i == 0) ? 'SUBDIRECCION DE SERVICIOS ADMINISTRATIVOS' : (($i == 1) ? 'SUBDIRECCION DE PLANEACION Y VINCULACION' : 'SUBDIRECCION ACADEMICA');

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

                                    return $subdireccion;
                                }
                            }
                            return $departamento;
                        }
                    }
                }
                return 0;


            }
            else if($GLOBALS['SWS_UserObj']->nivel == 2)
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

            
            if($GLOBALS['SWS_UserObj']->nivel == 3)
            {
                return SWS_API::getSubdireccion();
            }
            else if($GLOBALS['SWS_UserObj']->nivel == 2)
            {
                return $GLOBALS['SWS_UserObj'];
            }
            else if($GLOBALS['SWS_UserObj']->nivel == 1)
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

            return $director;
        }
    }
?>