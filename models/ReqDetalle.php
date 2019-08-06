<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "req_detalle".
 *
 * @property integer $det_id
 * @property integer $det_fkrequisicion
 * @property string $det_clave
 * @property string $det_partida
 * @property double $det_cantidad
 * @property string $det_unidad
 * @property string $det_descripcion
 * @property double $det_costo
 *
 * @property ReqRequisicion $detFkrequisicion
 */
class ReqDetalle extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'req_detalle';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['det_fkrequisicion'], 'required'],
            [['det_fkrequisicion'], 'integer'],
            [['det_cantidad', 'det_costo'], 'number'],
            [['det_clave'], 'string', 'max' => 30],
            [['det_partida'], 'string', 'max' => 6],
            [['det_unidad'], 'string', 'max' => 20],
            [['det_descripcion'], 'string', 'max' => 500],
            [['det_fkrequisicion'], 'exist', 'skipOnError' => true, 'targetClass' => Requisicion::className(), 'targetAttribute' => ['det_fkrequisicion' => 'req_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'det_id' => 'Det ID',
            'det_fkrequisicion' => 'Det Fkrequisicion',
            'det_clave' => 'Det Clave',
            'det_partida' => 'Det Partida',
            'det_cantidad' => 'Det Cantidad',
            'det_unidad' => 'Det Unidad',
            'det_descripcion' => 'Det Descripcion',
            'det_costo' => 'Det Costo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDetFkrequisicion()
    {
        return $this->hasOne(ReqRequisicion::className(), ['req_id' => 'det_fkrequisicion']);
    }
}
