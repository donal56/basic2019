<?php

namespace app\models;

use Yii;
use yii\db\Query;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "req_personal".
 *
 * @property integer $per_id
 * @property string $per_nombre
 * @property string $per_paterno
 * @property string $per_materno
 * @property integer $per_fkuser
 *
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
            'per_fkuser' => 'Username',
        ];
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
    public static function fillUserName($id)
    {
        $query = new Query;
        $query  ->select('user.username')
        ->from('user')
        ->where(['user.id' => $id]);

        $command = $query->createCommand();
        $data1 = $command->queryAll();

        $result = ArrayHelper::getColumn($data1,'username');
        return $result[0];
    }

    public function fullName()
    {
        return $this->per_nombre . " " . $this->per_paterno . " " . $this->per_materno;
    }
}