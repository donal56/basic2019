<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use yii\db\Query;
use app\models\ReqRequisicion;

/**
 * RequisicionSearch represents the model behind the search form about `app\models\Requisicion`.
 */
class ReqRequisicionSearch extends ReqRequisicion
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['req_id', 'req_fkper_solicitante', 'req_esoperativo', 'req_fkper_subdirector', 'req_fkper_planeacion', 'req_fkper_director', 'req_fkconfiguracion'], 'integer'],
            [['req_fecha', 'req_folio', 'req_fechasolicitante', 'req_justificacion'], 'safe'],
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
        $query = ReqRequisicion::find();
       
        $query1 = new Query;
        $query1 -> select(['req_personal.per_id as ID', 
        'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre '])
            -> from('req_personal')
            -> join('INNER JOIN', 'user', 'req_personal.per_fkuser = user.id')
            -> where(['user.id' => Yii::$app->user->identity->id]);
        $data1 = $query1 -> createCommand() -> queryAll();
        $usuarioActual = $query1 -> createCommand() -> queryAll()[0]['ID'];

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['req_fecha'=>SORT_DESC]]
           ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        
        // grid filtering conditions
        $query->andFilterWhere([
            'req_id' => $this->req_id,
            'req_fecha' => $this->req_fecha,
            'req_fkper_solicitante' => $usuarioActual,
            'req_fechasolicitante' => $this->req_fechasolicitante,
            'req_fechaactualizado' => $this->req_fechaactualizado,
            'req_esoperativo' => $this->req_esoperativo,
            'req_fkper_subdirector' => $this->req_fkper_subdirector,
            'req_fkper_planeacion' => $this->req_fkper_planeacion,
            'req_fkper_director' => $this->req_fkper_director,
            'req_fkconfiguracion' => $this->req_fkconfiguracion,
        ]);

        $query->andFilterWhere(['like', 'req_folio', $this->req_folio])
            ->andFilterWhere(['like', 'req_justificacion', $this->req_justificacion]);

        return $dataProvider;
    }
}
