<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "req_requisicion".
 *
 * @property integer $req_id
 * @property string $req_fecha
 * @property string $req_folio
 * @property integer $req_fkper_solicitante
 * @property string $req_fechasolicitante
 * @property integer $req_esoperativo
 * @property string $req_justificacion
 * @property integer $req_fkper_subdirector
 * @property integer $req_fkper_planeacion
 * @property integer $req_fkper_director
 * @property integer $req_fkconfiguracion
 *
 * @property ReqDetalle[] $reqDetalles
 * @property ReqPersonal $reqFkperSolicitante
 * @property ReqPersonal $reqFkperSubdirector
 * @property ReqPersonal $reqFkperPlaneacion
 * @property ReqPersonal $reqFkperDirector
 * @property ReqConfiguracion $reqFkconfiguracion
 */
class ReqRequisicion extends \yii\db\ActiveRecord
{
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
            [['req_fecha', 'req_fechasolicitante'], 'safe'],
            [['req_fkper_solicitante', 'req_fkper_subdirector', 'req_fkper_planeacion', 'req_fkper_director', 'req_fkconfiguracion'], 'required'],
            [['req_fkper_solicitante', 'req_esoperativo', 'req_fkper_subdirector', 'req_fkper_planeacion', 'req_fkper_director', 'req_fkconfiguracion'], 'integer'],
            [['req_justificacion'], 'string'],
            [['req_folio'], 'string', 'max' => 45],
            [['req_fkper_solicitante'], 'exist', 'skipOnError' => true, 'targetClass' => ReqPersonal::className(), 'targetAttribute' => ['req_fkper_solicitante' => 'per_id']],
            [['req_fkper_subdirector'], 'exist', 'skipOnError' => true, 'targetClass' => ReqPersonal::className(), 'targetAttribute' => ['req_fkper_subdirector' => 'per_id']],
            [['req_fkper_planeacion'], 'exist', 'skipOnError' => true, 'targetClass' => ReqPersonal::className(), 'targetAttribute' => ['req_fkper_planeacion' => 'per_id']],
            [['req_fkper_director'], 'exist', 'skipOnError' => true, 'targetClass' => ReqPersonal::className(), 'targetAttribute' => ['req_fkper_director' => 'per_id']],
            [['req_fkconfiguracion'], 'exist', 'skipOnError' => true, 'targetClass' => ReqConfiguracion::className(), 'targetAttribute' => ['req_fkconfiguracion' => 'con_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'req_id' => 'Id',
            'req_fecha' => 'Fecha de elaboración',
            'req_folio' => 'Folio',
            'req_fkper_solicitante' => 'Solicitante',
            'req_fechasolicitante' => 'Fecha de solicitud',
            'req_esoperativo' => '¿Esta contemplado en el plan operativo anual?',
            'req_justificacion' => 'Justificación',
            'req_fkper_subdirector' => 'Subdirector',
            'req_fkper_planeacion' => 'Jefe de planeación',
            'req_fkper_director' => 'Director',
            'req_fkconfiguracion' => 'Configuración',
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
    public function getReqFkperSolicitante()
    {
        return $this->hasOne(ReqPersonal::className(), ['per_id' => 'req_fkper_solicitante']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkperSubdirector()
    {
        return $this->hasOne(ReqPersonal::className(), ['per_id' => 'req_fkper_subdirector']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkperPlaneacion()
    {
        return $this->hasOne(ReqPersonal::className(), ['per_id' => 'req_fkper_planeacion']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkperDirector()
    {
        return $this->hasOne(ReqPersonal::className(), ['per_id' => 'req_fkper_director']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqFkconfiguracion()
    {
        return $this->hasOne(ReqConfiguracion::className(), ['con_id' => 'req_fkconfiguracion']);
    }
}
