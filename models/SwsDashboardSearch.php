<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\SwsDashboard;

/**
 * SwsDashboardSearch represents the model behind the search form about `app\models\SwsDashboard`.
 */
class SwsDashboardSearch extends SwsDashboard
{
    /**
     * @inheritdoc
     */
    public $gruponombre;
    public function rules()
    {
        return [
            [['id', 'fkgrupo', 'orden'], 'integer'],
            [['nombre', 'url', 'clase', 'status', 'rol', 'gruponombre'], 'safe'],
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
        $query = SwsDashboard::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 50,
            ]
        ]);

        $dataProvider->setSort([
            'attributes' => array_merge(
                $dataProvider->getSort()->attributes,
                [  'gpo_orden' => [
                      'asc'  => ['gpo_orden' => SORT_ASC],
                      'desc' => ['gpo_orden' => SORT_DESC],
                   ],
                   'gruponombre' => [
                      'asc'  => ['gpo_nombre' => SORT_ASC],
                      'desc' => ['gpo_nombre' => SORT_DESC],
                   ]
                ]
            ),
        ]);

        $dataProvider->sort->defaultOrder = ['gpo_orden' => SORT_ASC, 'fkgrupo' => SORT_ASC, 'orden' => SORT_ASC];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->joinWith('dashboardgrupos');


        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'fkgrupo' => $this->fkgrupo,
            'orden' => $this->orden,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'url', $this->url])
            ->andFilterWhere(['like', 'clase', $this->clase])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'gpo_nombre', $this->gruponombre])
            ->andFilterWhere(['like', 'rol', $this->rol]);

        return $dataProvider;
    }
}
