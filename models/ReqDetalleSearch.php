<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ReqDetalle;

/**
 * ReqDetalleSearch represents the model behind the search form about `app\models\ReqDetalle`.
 */
class ReqDetalleSearch extends ReqDetalle
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['det_id', 'det_fkrequisicion'], 'integer'],
            [['det_clave', 'det_partida', 'det_unidad', 'det_descripcion'], 'safe'],
            [['det_cantidad', 'det_costo'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($id)
    {
        $query = ReqDetalle::find()->where(['det_fkrequisicion' => $id]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);


        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'det_id' => $this->det_id,
            'det_fkrequisicion' => $this->det_fkrequisicion,
            'det_cantidad' => $this->det_cantidad,
            'det_costo' => $this->det_costo,
        ]);

        $query->andFilterWhere(['like', 'det_clave', $this->det_clave])
            ->andFilterWhere(['like', 'det_partida', $this->det_partida])
            ->andFilterWhere(['like', 'det_unidad', $this->det_unidad])
            ->andFilterWhere(['like', 'det_descripcion', $this->det_descripcion]);

        return $dataProvider;
    }
}
