<?php

namespace app\models;

use Yii;
use app\components\SWS_API;
use webvimark\modules\UserManagement\models\User;

/**
 * This is the model class for table "req_requisicion".
 *
 * @property integer $req_id
 * @property string $req_fecha
 * @property string $req_folio
 * @property integer $req_fkuse_solicitante
 * @property string $req_fechasolicitante
 * @property integer $req_esoperativo
 * @property string $req_justificacion
 * @property integer $req_fkuse_subdirector
 * @property integer $req_fkuse_planeacion
 * @property integer $req_fkuse_director
 * @property integer $req_fkconfiguracion
 *
 * @property ReqDetalle[] $reqDetalles
 * @property User $reqFkuseSubdirector
 * @property User $reqFusePlaneacion
 * @property User $reqFkuseDirector
 * @property User $reqFkuseSolicitante
 * @property ReqConfiguracion $reqFkconfiguracion
 */
class ReqRequisicion extends \yii\db\ActiveRecord
{
    public $req_total = 0;
    public $intervalo;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'req_requisicion';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['req_tipo','req_fecha', 'req_fechasolicitante','req_fechaactualizado'], 'safe'],
            [['req_fkuse_solicitante', 'req_fkuse_subdirector', 'req_fkuse_planeacion', 'req_fkuse_director', 'req_fkconfiguracion'], 'required'],
            [['req_fkuse_solicitante', 'req_esoperativo', 'req_fkuse_subdirector', 'req_fkuse_planeacion', 'req_fkuse_director', 'req_fkconfiguracion'], 'integer'],
            [['req_justificacion'], 'string'],
            [['req_folio'], 'string', 'max' => 45],
            [['req_fkuse_solicitante'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['req_fkuse_solicitante' => 'id']],
            [['req_fkuse_subdirector'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['req_fkuse_subdirector' => 'id']],
            [['req_fkuse_planeacion'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['req_fkuse_planeacion' => 'id']],
            [['req_fkuse_director'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['req_fkuse_director' => 'id']],
            [['req_fkconfiguracion'], 'exist', 'skipOnError' => true, 'targetClass' => ReqConfiguracion::className(), 'targetAttribute' => ['req_fkconfiguracion' => 'con_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'req_id' => 'ID',
            'req_fecha' => 'Fecha de elaboración',
            'req_folio' => 'Folio',
            'req_tipo' => 'Tipo',
            'req_fkuse_solicitante' => 'Solicitante',
            'req_fechasolicitante' => 'Fecha de solicitud',
            'req_fechaactualizado' => 'Fecha de actualización',
            'req_esoperativo' => '¿Los bienes o servicios estan contemplados en el programa operativo anual?',
            'req_justificacion' => 'Justificación',
            'req_fkuse_subdirector' => 'Subdirector',
            'req_fkuse_planeacion' => 'Jefe de planeación',
            'req_fkuse_director' => 'Director',
            'req_fkconfiguracion' => 'Configuración',
            'req_total' => 'Total',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqDetalles()
    {
        return $this->hasMany(ReqDetalle::className(), ['det_fkrequisicion' => 'req_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkuseSolicitante()
    {
        return $this->hasOne(User::className(), ['id' => 'req_fkuse_solicitante']);
    }

    public function getSolicitanteID()
    {
        return $this->getReqFkuseSolicitante() -> asArray() -> one()['id'];
    }


    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkuseSubdirector()
    {
        return $this->hasOne(User::className(), ['id' => 'req_fkuse_subdirector']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkusePlaneacion()
    {
        return $this->hasOne(User::className(), ['id' => 'req_fkuse_planeacion']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkuseDirector()
    {
        return $this->hasOne(User::className(), ['id' => 'req_fkuse_director']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkconfiguracion()
    {
        return $this->hasOne(ReqConfiguracion::className(), ['con_id' => 'req_fkconfiguracion']);
    }



    public function getConfig()
    {
        if (($model = ReqConfiguracion::findOne($this->req_fkconfiguracion)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('Error en la configuracion de la requisición.');
        }
    }


    public static function findUser($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('Error en el registro del personal');
        }
    }

    public function getSolicitante()
    {
        return $this->findUser($this->req_fkuse_solicitante);
    }

    public function getSubdirector()
    {
        return $this->findUser($this->req_fkuse_subdirector);
    }

    public function getPlaneacion()
    {
        return $this->findUser($this->req_fkuse_planeacion);
    }

    public function getDirector()
    {
        return $this->findUser($this->req_fkuse_director);
    }

    public function getTotal()
    {   
        $detalles = $this->getDetalle();
        foreach ($detalles as $detalle)
        {
            $this->req_total += $detalle->det_costo;
        }
        return $this->req_total;
    }


    public function getDetalle()
    {    
        if ( ($model = ReqDetalle::findAll(['det_fkrequisicion' => $this->req_id]) ) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('Error al obtener los detalles.');
        }

    }

    public function checkUpdates()
    {
        $superiorActual = SWS_API::getSuperior()[3];
        $planeacionActual = SWS_API::getJefePlaneacion()[3];
        $directorActual = SWS_API::getDirector()[3];

        if( $this->req_fkuse_subdirector == $superiorActual && $this->req_fkuse_planeacion == $planeacionActual &&  $this->req_fkuse_director == $directorActual)
        {
            return 0;
        }
        else
        {
            return [
                'superior' => $superiorActual,
                'planeacion' => $planeacionActual,
                'director' => $directorActual
            ];
        }   
    }
}