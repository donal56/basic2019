<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sws_dashboardgrupos".
 *
 * @property integer $gpo_id
 * @property string $gpo_nombre
 * @property integer $gpo_orden
 * @property integer $gpo_activo
 *
 * @property SwsDashboard[] $swsDashboards
 */
class SwsDashboardgrupos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sws_dashboardgrupos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['gpo_nombre', 'gpo_orden'], 'required'],
            [['gpo_orden', 'gpo_activo'], 'integer'],
            [['gpo_nombre'], 'string', 'max' => 255],
            [['gpo_color'], 'string', 'max' => 8],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'gpo_id'     => 'ID',
            'gpo_nombre' => 'Nombre',
            'gpo_orden'  => 'Orden',
            'gpo_activo' => 'Status',
            'gpo_color'  => 'Color',
            'activo'     => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSwsDashboards()
    {
        return $this->hasMany(SwsDashboard::className(), ['fkgrupo' => 'gpo_id']);
    }

    public function getActivo()
    {
        return ($this->gpo_activo == '1') ? 'Activo' : 'Inactivo';
    }
}
