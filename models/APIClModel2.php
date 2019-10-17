<?php
namespace app\models;
/*******************************************************************************************************/
/****************************************** CLASE DEL SERVICIO WEB *************************************/
/*******************************************************************************************************/
class APIClModel {
    private $URL;
    private $APP;
   
    public function __construct() {
      $this->URL = APIClModel::SWSURL().'/ws/';
      $this->APP = 'amv7xn42vl';
    }

    public static function SWSURL() {
      return 'http://sws.itvillahermosa.edu.mx';
    }

    public function ACCESO($user, $pass) {
       $url       = $this->URL.'rest-server';
       $resultado = $this->restful($url,['app'=>$this->APP,'user'=>$user,'pass'=>$pass]);
       return $resultado;
    }

    public function AUTO($tk1,$tk2) {
       $url       = $this->URL.'rest-auto';
       $resultado = $this->restful($url,['app'=>$this->APP,'tk1'=>$tk1,'tk2'=>$tk2]);
       return $resultado;
    }
    /*******************************************************************************************************/
    /************************************ FUNCION RESFUL DEL SERVICIO WEB **********************************/
    /*******************************************************************************************************/
    private function restful($url,$data) {
       $data['app'] = $this->encrypt($data['app']);
       if(isset($data['user']))$data['user']=$this->encrypt($data['user']);
       if(isset($data['pass']))$data['pass']=$this->encrypt($data['pass']);
       $data['ip']  = $this->encrypt($_SERVER['REMOTE_ADDR']);
       $ch = curl_init();
       curl_setopt($ch, CURLOPT_URL, $url);
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
       curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
       curl_setopt($ch, CURLOPT_POST, TRUE);
       curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
       curl_setopt($ch, CURLOPT_TIMEOUT, 5);
       curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
       $resultado = curl_exec($ch);
       $array     = json_decode($resultado);
       $resultado = [];
       if(isset($array)) {
           foreach ($array as $key => $value) {
              $resultado[$key] = $this->decrypt($value);
           }
       }
       curl_close($ch);
       if(count($resultado)==0) {
         $resultado['error'] = 'El servidor no está respondiendo.';
       }
       
       return $resultado;
    }

    /*******************************************************************************************************/
    /************************************* FUNCIONES DE ENCRIPTAMIENTO *************************************/
    /*******************************************************************************************************/
    private function encrypt($decrypted, $contrasena='n63S3z4k1sn092ljsDEsaW', $adicional='1kgEQm*Xe1!%Kb_EmfFJd3p') { 
       $key            = hash('sha256', $contrasena);
       $iv             = substr(hash('sha256', $adicional), 0, 16);
       $encrypt_method = 'AES-256-CBC';
       $encrypted      = openssl_encrypt($decrypted, $encrypt_method, $key, 0, $iv);
       $encrypted      = base64_encode($encrypted);
       return $encrypted;
    }

    private function decrypt($encrypted, $contrasena='n63S3z4k1sn092ljsDEsaW', $adicional='1kgEQm*Xe1!%Kb_EmfFJd3p') {
       $key            = hash('sha256', $contrasena);
       $iv             = substr(hash('sha256', $adicional), 0, 16);
       $encrypt_method = 'AES-256-CBC';
       $decrypted      = base64_decode($encrypted);
       $decrypted      = openssl_decrypt($decrypted, $encrypt_method, $key, 0, $iv);
       return $decrypted;
    }
}
?>