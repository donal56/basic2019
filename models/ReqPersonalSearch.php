<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ReqPersonal;

/**
 * PersonalSearch represents the model behind the search form about `app\models\ReqPersonal`.
 */
class ReqPersonalSearch extends ReqPersonal
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['per_id', 'per_fkuser'], 'integer'],
            [['per_nombre', 'per_paterno', 'per_materno'], 'safe'],
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
        $query = ReqPersonal::find();

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
            'per_id' => $this->per_id,
            'per_fkuser' => $this->per_fkuser,
        ]);

        $query->andFilterWhere(['like', 'per_nombre', $this->per_nombre])
            ->andFilterWhere(['like', 'per_paterno', $this->per_paterno])
            ->andFilterWhere(['like', 'per_materno', $this->per_materno]);

        return $dataProvider;
    }
}
