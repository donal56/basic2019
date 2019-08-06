<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ReqArea;

/**
 * AreaSearch represents the model behind the search form about `app\models\ReqArea`.
 */
class AreaSearch extends ReqArea
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['are_id', 'are_nivel', 'are_fkper_responsable', 'are_fkper_superior'], 'integer'],
            [['are_nombre'], 'safe'],
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
        $query = ReqArea::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'are_id' => $this->are_id,
            'are_nivel' => $this->are_nivel,
            'are_fkper_responsable' => $this->are_fkper_responsable,
            'are_fkper_superior' => $this->are_fkper_superior,
        ]);

        $query->andFilterWhere(['like', 'are_nombre', $this->are_nombre]);

        return $dataProvider;
    }
}
