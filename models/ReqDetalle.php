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
    public $temp = null;

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
            [[ 'temp'] , 'safe' ],
            [['det_fkrequisicion'], 'required'],
            [['det_fkrequisicion'], 'integer'],
            [['det_cantidad', 'det_costo'], 'number'],
            [['det_clave'], 'string', 'max' => 30],
            [['det_partida'], 'string', 'max' => 6],
            [['det_unidad'], 'string', 'max' => 20],
            [['det_descripcion'], 'string', 'max' => 500],
            [['det_fkrequisicion'], 'exist', 'skipOnError' => true, 'targetClass' => ReqRequisicion::className(), 'targetAttribute' => ['det_fkrequisicion' => 'req_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'det_id' => 'Id',
            'det_fkrequisicion' => 'Requisición',
            'det_clave' => 'Clave presupuestal',
            'det_partida' => 'Partida',
            'det_cantidad' => 'Cantidad',
            'det_unidad' => 'Unidad',
            'det_descripcion' => 'Descripción',
            'det_costo' => 'Costo estimado (Total + IVA)',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDetFkrequisicion()
    {
        return $this->hasOne(ReqRequisicion::className(), ['req_id' => 'det_fkrequisicion']);
    }

    public function getTemp()
    {
        return $temp;
    }


}
