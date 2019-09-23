<?php
namespace app\components;

use Yii;
class Utilidades
{
    public static function minizarString($str,$longitud)
    {
       if(strlen($str)<$longitud){
           return $str;
       }else
       {
          $tmp = str_split($str, $longitud);
          return $tmp[0]."...";
       }

       return null;
    }
    public static function minizarCadena($str,$longitud)
    {
       if(strlen($str)<$longitud){
           return $str;
       }else
       {

          $tmp = substr($str, 0, $longitud);
          return $tmp."...";
       }

       return null;
    }

    public static function eliminarSignos($str)
    {
        return preg_replace('/\W+/', ' ', $str);
    }

    public static function findCodeVideo($link)
    {

        $ps1 = strpos($link, '=');
        $pret = str_split($link, $ps1+1);
        $rs = $pret[1];
        if(!is_bool(strpos($pret[1], '&')))
        {
                $ps2 = strpos($pret[1], '&');
                $tmp = str_split($pret[1], $ps2);
                $rs = $tmp[0];
        }
        return '<iframe src="http://www.youtube.com/embed/'.$rs.'" frameborder="0" width="425" height="350"></iframe>';
    }
    public static function checkStatus($valor)
    {
        switch($valor){
            case 1: $color="warning";break;
            case 2: $color="success";break;
            case 3: $color="danger";break;
            case 4: $color="info";break;
       }
        return $color;
    }

    public static function incrementar($valor,$incremento)
    {
       $valorsiguiente=$valor+$incremento;
        return $valorsiguiente;
    }

    public static function encriptar($password, $llave)
    {
        $password = serialize($password);
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC), MCRYPT_DEV_URANDOM);
        $llave = pack('H*', $llave);

        $mac = hash_hmac('sha256', $password, substr(bin2hex($llave), -32));
        $passcrypt = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $llave, $password . $mac, MCRYPT_MODE_CBC, $iv);
        $codificada = base64_encode($passcrypt) . '|' . base64_encode($iv);
        return $codificada;
    }

    public static function desencriptar($cadena, $llave)
    {
        $cadena = explode('|', $cadena . '|');
        $decodificada = base64_decode($cadena[0]);
        $iv = base64_decode($cadena[1]);
        if (strlen($iv) !== mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC)) {
            return false;
        }
        $llave = pack('H*', $llave);
        $desencrypt = trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $llave, $decodificada, MCRYPT_MODE_CBC, $iv));
        $mac = substr($desencrypt, -64);
        $desencrypt = substr($desencrypt, 0, -64);
        $calcmac = hash_hmac('sha256', $desencrypt, substr(bin2hex($llave), -32));
        if ($calcmac !== $mac) {
            return false;
        }
        $desencrypt = unserialize($desencrypt);
        return $desencrypt;
    }

    public static function validarPassword($passwordEntrante, $passwordBD) {

        $passwordBD = Utilidades::desencriptar($passwordBD, Yii::$app->params['llaveHexadecimal']);

        if ($passwordEntrante == $passwordBD) {
            return true;
        } else {
            return false;
        }
    }

    public static function mEncriptar($password)
    {
        $llave = Yii::$app->params['llaveHexadecimal'];
        $password = serialize($password);
        $iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC), MCRYPT_DEV_URANDOM);
        $llave = pack('H*', $llave);

        $mac = hash_hmac('sha256', $password, substr(bin2hex($llave), -32));
        $passcrypt = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $llave, $password . $mac, MCRYPT_MODE_CBC, $iv);
        $codificada = base64_encode($passcrypt) . '|' . base64_encode($iv);
        return $codificada;
    }

    public static function cadenaAleatoria($longitud)
    {
      // estamos utilizando sólo este caracteres / números en la generación de cadena
      $caracteres ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
      $cadena =''; // definir variable con valor vacío
      // generamos un entero aleatorio en primer lugar, a continuación, nos estamos carácter correspondiente ,
      // tiene que poner el carácter a la variable $ cadena. estamos repitiendo este ciclo hasta que se alcanza
      // la longitud dada
      for($i=0;$i<$longitud; $i++)
      {
          $cadena .= $caracteres[rand(0,strlen($caracteres)-1)];
      }
      return $cadena ; // devolver la cadena final
    }

    public static function obtenerContenido($tipo)
    {
      $ruta = Yii::getAlias('@webroot')."/archivos/formato/";
      $img = '';
      if($tipo == 1)
      {
        $ruta .= 'cabecera.txt';
      }
      else if($tipo == 2)
      {
        $ruta .= 'pie_pagina.txt';
      }

      if (file_exists($ruta))
      {
          $img = file($ruta)[0];
      }
      return $img;
    }

    public static function enviarCorreo($params)
    {
      $correo = Yii::$app->mailer->compose('correos/'.$params['plantilla'], [
        //'logo' => '/plantillas/itvh/logos/logoitvhpie.png',
        'usuario' => $params['dest'],
      ]);
      $correo->setFrom('paginaitvh@itvillahermosa.edu.mx');//Correo de mesa de ayuda
      $correo->setTo($params['dest']);
      $correo->setSubject($params['asunto']);
      if($correo->send()) {
        return true;
      } else {
        return false;
      }
    }

    public static function contarDias($ini, $fin)
    {
      $ini = new \DateTime($ini);
      $fin = new \DateTime($fin);
      $fin->modify('+1 day');
      $interval = $fin->diff($ini);
      // total de dias
      $dias = $interval->days;
      // crear un periodo iterateable de la fecha ( P1D equivale a 1 día)
      $periodo = new \DatePeriod($ini, new \DateInterval('P1D'), $fin);
      // almacenado como matriz, por lo que puede añadir más de una
      $vacaciones = [];
      foreach($periodo as $dt) {
          $hoy = $dt->format('D');
          //
          if (in_array($dt->format('Y-m-d'), $vacaciones)) {
             $dias--;
          }
          // Restar si es sabado o domingo
          if ($hoy == 'Sat' || $hoy == 'Sun') {
              $dias--;
          }
      }
      return $dias;
    }

    public static function actualizarPP($id)
    {
      $hoy = date("Y-m-d");
      $sg = \app\models\Seguimiento::find()->where("fkUsuario = {$id} AND cerrado != 1")->one();
      if($sg !== null) {
        $pr = \app\models\Periodo::findOne(['estatus' => 1]);
        $total = self::contarDias($pr->fechaInicio, $pr->fechaCierre);
        $sys = self::contarDias($hoy, $pr->fechaCierre);
        $real = $total - $sys;
        //$porcent = ($real / $total) * 100;
        $sg->porcentaje = $real;
        $sg->save(false);
      }
    }

    public static function calcularHoras($t1, $t2)
    {
      list($h1, $m1) = sscanf($t1, "%d:%d");
      list($h2, $m2) = sscanf($t2, "%d:%d");

      $hrs = ($h2-$h1) + ($m2-$m1)/60;

      if ($hrs < 0) {
        $hrs = $hrs + 24;
      }

      return $hrs;
    }

    public static function validarHorario($tiempos)
    {
      if(count($tiempos) == 3) {
        list($t1, $t2, $tn) = $tiempos;
        $t1 = +str_replace(":", "", $t1);
        $t2 = +str_replace(":", "", $t2);
        $tn = +str_replace(":", "", $tn);
        if ($t2 > $t1) {//Salida mayor a entrada         
          return $t1 <= $tn && $tn < $t2;//True = Entrada es menor/igual a hora actual Y si hora actual es menor a Salida
        } else {
          return ! ($t2 <= $tn && $tn < $t1);
        }
      } else {
        return false;
      }
    }

    public static function inicializarKCFinder($ruta)
    {
      $kcfOptions = array_merge(\iutbay\yii2kcfinder\KCFinder::$kcfDefaultOptions, [
          'uploadURL' => Yii::getAlias('@web')."/$ruta",
          'uploadDir' => Yii::getAlias('@app')."/web/$ruta",
          'access' => [
              'files' => [
                  'upload' => true,
                  'delete' => true,
                  'copy' => false,
                  'move' => false,
                  'rename' => true,
              ],
              'dirs' => [
                  'create' => false,
                  'delete' => false,
                  'rename' => false,
              ],
          ]
      ]);
      return $kcfOptions;
    }

    public static function contadorVisitas()
    {
      session_start();
      $nombreContador = Yii::getAlias('@webroot/sistema/contadores/visitas_general.txt');
      #Compruebe si existe un archivo de texto. Si no crear uno e inicializarlo a cero.
      if (!file_exists($nombreContador)) {
        $f = fopen($nombreContador, "w");
        fwrite($f,"0");
        fclose($f);
      }
      #Leer el valor actual de nuestro archivo de contador
      $f = fopen($nombreContador,"r");
      $contadorValor = fread($f, filesize($nombreContador));
      fclose($f);
      #¿Se ha contado al visitante en esta sesión?
      #Si no es así, aumente el valor del contador en uno
      if(!isset($_SESSION['visitado'])){
        $_SESSION['visitado'] = "y";
        $contadorValor++;
        $f = fopen($nombreContador, "w");
        fwrite($f, $contadorValor);
        fclose($f); 
      }
      return $contadorValor;
    }
    
   public static function formatoFecha($f) 
   {
      setlocale(LC_ALL, "es_ES.utf8", "es_ES", "esp");
      $diasemana = strftime("%A", strtotime($f));
      $diames = strftime("%e", strtotime($f));
      $mes = strftime("%B", strtotime($f));
      $anio = strftime("%Y", strtotime($f));      
      return "{$diasemana} {$diames} de {$mes} de {$anio}";
   }

   public static function pp($thing)
   {
       echo('<pre>');
       print_r($thing);
       echo('</pre>');
   }

   public static function pd($thing)
   {
       echo('<pre>');
       var_dump($thing);
       echo('</pre>');
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
       $p1 = preg_replace('/\./', '', $p1);
       $p2 = preg_replace('/\./', '', $p2);
       $p1 = preg_replace('/\s/', '', $p1);
       $p2 = preg_replace('/\s/', '', $p2);

       return ($p1 == $p2);
   }
}