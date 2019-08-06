<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "req_configuracion".
 *
 * @property integer $con_id
 * @property string $con_instituto
 * @property string $con_logo
 * @property string $con_revision
 *
 * @property ReqRequisicion[] $reqRequisicions
 */
class ReqConfiguracion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'req_configuracion';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['con_instituto'], 'required'],
            [['con_instituto'], 'string', 'max' => 50],
            [['con_logo'], 'string', 'max' => 250],
            [['con_revision'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'con_id' => 'ID',
            'con_instituto' => 'Instituto',
            'con_logo' => 'Logo',
            'con_revision' => 'Revision',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReqRequisicions()
    {
        return $this->hasMany(ReqRequisicion::className(), ['req_fkconfiguracion' => 'con_id']);
    }
}
