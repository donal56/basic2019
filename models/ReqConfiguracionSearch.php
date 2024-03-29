<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ReqConfiguracion;

/**
 * ConfiguracionSearch represents the model behind the search form about `app\models\ReqConfiguracion`.
 */
class ReqConfiguracionSearch extends ReqConfiguracion
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['con_id'], 'integer'],
            [['con_instituto', 'con_logo', 'con_revision'], 'safe'],
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
        $query = ReqConfiguracion::find();

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
            'con_id' => $this->con_id,
        ]);

        $query->andFilterWhere(['like', 'con_instituto', $this->con_instituto])
            ->andFilterWhere(['like', 'con_logo', $this->con_logo])
            ->andFilterWhere(['like', 'con_revision', $this->con_revision]);

        return $dataProvider;
    }
}
