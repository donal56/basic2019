<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "req_personal".
 *
 * @property integer $per_id
 * @property string $per_nombre
 * @property string $per_paterno
 * @property string $per_materno
 * @property integer $per_fkuser
 *
 * @property ReqArea[] $reqAreas
 * @property ReqArea[] $reqAreas0
 * @property User $perFkuser
 * @property ReqRequisicion[] $reqRequisicions
 * @property ReqRequisicion[] $reqRequisicions0
 * @property ReqRequisicion[] $reqRequisicions1
 * @property ReqRequisicion[] $reqRequisicions2
 */
class ReqPersonal extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'req_personal';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['per_fkuser'], 'required'],
            [['per_fkuser'], 'integer'],
            [['per_nombre', 'per_paterno', 'per_materno'], 'string', 'max' => 60],
            [['per_fkuser'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['per_fkuser' => 'id']],
        ];
    }

    /**
     * @inheritdoc 
     */
    public function attributeLabels()
    {
        return [
            'per_id' => 'ID',
            'per_nombre' => 'Nombre',
            'per_paterno' => 'Apellido Paterno',
            'per_materno' => 'Apellido Materno',
            'per_fkuser' => 'ID Usuario',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqAreas()
    {
        return $this->hasMany(ReqArea::className(), ['are_fkper_responsable' => 'per_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqAreas0()
    {
        return $this->hasMany(ReqArea::className(), ['are_fkper_superior' => 'per_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPerFkuser()
    {
        return $this->hasOne(User::className(), ['id' => 'per_fkuser']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqRequisicions()
    {
        return $this->hasMany(ReqRequisicion::className(), ['req_fkper_solicitante' => 'per_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqRequisicions0()
    {
        return $this->hasMany(ReqRequisicion::className(), ['req_fkper_subdirector' => 'per_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqRequisicions1()
    {
        return $this->hasMany(ReqRequisicion::className(), ['req_fkper_planeacion' => 'per_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqRequisicions2()
    {
        return $this->hasMany(ReqRequisicion::className(), ['req_fkper_director' => 'per_id']);
    }
    public function sacarNombre($id)
    {
        $query = new Query;
        $query  ->select([
        'req_area.are_id as ID' , 
        'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre ']
        )  
        ->from('req_area')
        ->join('INNER JOIN', 'req_personal',
            'req_area.are_fkper_responsable = req_personal.per_id');

        $query2 = $query ->where(['req_area.are_nivel' => $id]);
        $command = $query->createCommand();
        return $data1 = $command->queryAll();
    }
}
