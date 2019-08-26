<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sws_dashboard".
 *
 * @property integer $id
 * @property integer $orden
 * @property string $nombre
 * @property string $url
 * @property string $clase
 * @property string $status
 */
class SwsDashboard extends \yii\db\ActiveRecord
{
    public $asignados;
    public $grupo;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sws_dashboard';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['orden', 'nombre', 'clase', 'status', 'rol'], 'required'],
            [['orden','fkgrupo'], 'integer'],
            [['nombre', 'url', 'clase','rol'], 'string', 'max' => 255],
            [['status'], 'string', 'max' => 1],
            [['asignados','grupo'],'safe'],
            [['fkgrupo'], 'exist', 'skipOnError' => true, 'targetClass' => SwsDashboardgrupos::className(), 'targetAttribute' => ['fkgrupo' => 'gpo_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'          => 'ID',
            'orden'       => 'Orden',
            'nombre'      => 'Nombre',
            'url'         => 'Url',
            'clase'       => 'Clase',
            'status'      => 'Status',
            'activo'      => 'Status',
            'fkgrupo'     => 'Categoría',
            'gruponombre' => 'Categoría',
            'rol'         => 'Roles',
            'asignados'   => 'Roles',
            'grupo'       => 'Saltar a...',
        ];
    }

    public function getDashboardgrupos()
    {
        return $this->hasOne(SwsDashboardgrupos::className(), ['gpo_id' => 'fkgrupo']);
    }

    public function getGruponombre()
    {
        return $this->dashboardgrupos->gpo_nombre;
    }

    public function getActivo()
    {
        $arrStatus = ['0'=>'Inactivo','1'=>'Menú Principal','2'=>'Botón en Menú Principal','3'=>'Submenú','4'=>'Botón en Submenú'];
        return $arrStatus[$this->status];
    }
    
    public static function botones($gpo=null,$prv=null)
    {
        $user      = Yii::$app->user->identity->id;
        $roles     = \webvimark\modules\UserManagement\models\User::findOne($user)->rolesarray;
        $botones = [];
        if(isset($gpo)) {
            $dashboard = SwsDashboard::find()->joinWith('dashboardgrupos')->where(['gpo_activo'=>'1', 'fkgrupo'=>$gpo])->andWhere(['between','status','3','4'])->orderBy(['gpo_orden'=>SORT_ASC,'orden'=>SORT_ASC,'id'=>SORT_ASC])->all();
            $botones['1'][]= ['texto' => 'Menú Principal', 'ruta' => [$prv == null || $prv == 0 ? '/site/index' : '/sws-dashboard/submenu/?gpo='.$prv], 'clase' => 'regresar', 'color' => '#fff', 'estado' => 4];
        } else {
            $dashboard = SwsDashboard::find()->joinWith('dashboardgrupos')->where(['gpo_activo'=>'1', 'status'=>'1'])->orWhere(['status'=>'2'])->orderBy(['gpo_orden'=>SORT_ASC,'orden'=>SORT_ASC,'id'=>SORT_ASC])->all();
        }
        foreach($dashboard as $d):
            $encontrado = Yii::$app->user->isSuperAdmin ? true : false;
            foreach($roles as $r):
               $pos = strpos($d->rol,$r);
                if($pos !== false) {
                    //if (!Yii::$app->user->isSuperAdmin){
                        foreach (explode(',',$d->rol) as $key => $value) {
                            if ($value == $r) {
                                $encontrado = true;
                            }
                        }
                    /*} else {
                        $encontrado = true;
                    }*/
                }
            endforeach; 
            if($encontrado || strpos($d->rol,'Todos') !== false){
                $botones[$d->dashboardgrupos->gpo_nombre][]= ['texto' => $d->nombre, 'ruta' => [$d->url], 'clase' => $d->clase, 'color' => $d->dashboardgrupos->gpo_color, 'estado' => $d->status];
            }  
        endforeach;
        return $botones;
    }
}
