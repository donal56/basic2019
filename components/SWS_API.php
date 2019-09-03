<?php
    namespace app\components;

    use Yii;
    use app\models\ReqPersonal;

    static $SWS_UserObj;

    class SWS_API
    {
        private static function find()
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
                        if(SWS_API::lazyCompare($object->titnombre, $perName))
                        {
                            $GLOBALS['SWS_UserObj'] = $object;
                            $GLOBALS['SWS_UserObj']->titnombre = mb_strtoupper($GLOBALS['SWS_UserObj']->titnombre);
                            $GLOBALS['SWS_UserObj']->nivel = $i + 1;
                        }
                    }
                }
            }
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

            return (!$verbose) ? $nivel : (nivel == 1 ? 'Dirección' : (nivel == 2 ? 'Subdirección' : 'Oficina'));
        }

        public static function getSubdireccion()
        {
            SWS_API::find();
            
                #http://sws.itvillahermosa.edu.mx/ws/jefes/?nivel=1&subdir=subadm
                 #1 2 3 subadm subpla subaca
            
            return 0;         
        }

        public static function getSuperior()
        {
            SWS_API::find();
            #si es de nivel 3 sale la subdir
            #si es de nivel 2 o 3 sale el mismo
            return 0;
        }

        public static function getJefePlaneacion()
        {
            SWS_API::find();
            return 0;
        }

        public static function getDirector()
        {
            SWS_API::find();
            return 0;
        }

        public static function lazyCompare($p1, $p2)
        {
            #Compara sin importar espacios, acentos y mayúsculas
            #Termina siendo redundante

            $p1 = mb_strtoupper($p1);
            $p2 = mb_strtoupper($p2);
            $p1 = trim($p1, "\t\n\r");
            $p2 = trim($p2, "\t\n\r");
            $p1 = preg_replace('/Á/', 'A', $p1);
            $p2 = preg_replace('/Á/', 'A', $p2);
            $p1 = preg_replace('/É/', 'E', $p1);
            $p2 = preg_replace('/É/', 'E', $p2);
            $p1 = preg_replace('/Í/', 'I', $p1);
            $p2 = preg_replace('/Í/', 'I', $p2);
            $p1 = preg_replace('/Ó/', 'O', $p1);
            $p2 = preg_replace('/Ó/', 'O', $p2);
            $p1 = preg_replace('/Ú/', 'U', $p1);
            $p2 = preg_replace('/Ú/', 'U', $p2);

            return ($p1 == $p2);
        }
    }
?>