<?php

namespace app\models;

use Yii;
/**
 * This is the model class for table "req_area".
 *
 * @property integer $are_id
 * @property integer $are_nivel
 * @property string $are_nombre
 * @property integer $are_fkper_responsable
 * @property integer $are_fkper_superior
 *
 * @property ReqPersonal $areFkperResponsable
 * @property ReqPersonal $areFkperSuperior
 */
class ReqArea extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'req_area';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['are_nivel', 'are_fkper_responsable', 'are_fkper_superior'], 'integer'],
            [['are_fkper_responsable', 'are_fkper_superior'], 'required'],
            [['are_nombre'], 'string', 'max' => 50],
            [['are_fkper_responsable'], 'exist', 'skipOnError' => true, 'targetClass' => ReqPersonal::className(), 'targetAttribute' => ['are_fkper_responsable' => 'per_id']],
            [['are_fkper_superior'], 'exist', 'skipOnError' => true, 'targetClass' => ReqPersonal::className(), 'targetAttribute' => ['are_fkper_superior' => 'per_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'are_id' => 'ID',
            'are_nivel' => 'Nivel',
            'are_nombre' => 'Nombre',
            'are_fkper_responsable' => 'Responsable',
            'are_fkper_superior' => 'Superior',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAreFkperResponsable()
    {
        return $this->hasOne(ReqPersonal::className(), ['per_id' => 'are_fkper_responsable']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAreFkperSuperior()
    {
        return $this->hasOne(ReqPersonal::className(), ['per_id' => 'are_fkper_superior']);
    }
    public static function findPersona($id)
    {
        if (($model = ReqPersonal::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('Error en el registro del personal');
        }
    }
    public static function fullName($id)
    { 
        $per = ReqArea::findPersona($id);
        return  $per->per_nombre." ".
                $per->per_paterno." ".
                $per->per_materno;
    }
    public static function findSuperior($id)
    {
        if (($model = ReqPersonal::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('Error en el registro del personal');
        }
    }
    public static function fullNameS($id,$nivel)
    { 
        $per = ReqArea::findSuperior($id);
        if($nivel!=2)
        {
            return $per->per_nombre." ".
                   $per->per_paterno." ".
                   $per->per_materno;
        }
        else
        {
            return " ";
        }
    }
}
