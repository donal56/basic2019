<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\SwsDashboardgrupos;

/**
 * SwsDashboardgruposSearch represents the model behind the search form about `app\models\SwsDashboardgrupos`.
 */
class SwsDashboardgruposSearch extends SwsDashboardgrupos
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['gpo_id', 'gpo_orden', 'gpo_activo'], 'integer'],
            [['gpo_nombre', 'gpo_color'], 'safe'],
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
    public function search($params)
    {
        $query = SwsDashboardgrupos::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->defaultOrder = ['gpo_orden' => SORT_ASC];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'gpo_id' => $this->gpo_id,
            'gpo_orden' => $this->gpo_orden,
            'gpo_activo' => $this->gpo_activo,
        ]);

        $query->andFilterWhere(['like', 'gpo_nombre', $this->gpo_nombre])
            ->andFilterWhere(['like', 'gpo_color', $this->gpo_color]);

        return $dataProvider;
    }
}
