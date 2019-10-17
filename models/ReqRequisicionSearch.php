<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use yii\db\Query;
use app\models\ReqRequisicion;
use webvimark\modules\UserManagement\models\User;

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
            [['req_id', 'req_fkuse_solicitante', 'req_esoperativo', 'req_fkuse_subdirector', 'req_fkuse_planeacion', 'req_fkuse_director', 'req_fkconfiguracion'], 'integer'],
            [['req_tipo','req_fecha', 'req_folio', 'req_fechasolicitante', 'req_justificacion'], 'safe'],
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
        $query->addSelect(["*", "SUM(req_detalle.det_costo) AS req_costoTotal"])
              ->innerJoin('req_detalle', 'req_requisicion.req_id = req_detalle.det_fkrequisicion')
              ->groupBy(['req_requisicion.req_id']);


        $fecha = explode( ' a ', $params['ReqRequisicionSearch']['intervalo']);
        $costoTotal = $params['ReqRequisicionSearch']['costoTotal'];

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
            'req_fechasolicitante' => $this->req_fechasolicitante,
            'req_fechaactualizado' => $this->req_fechaactualizado,
            'req_esoperativo' => $this->req_esoperativo,
            'req_fkuse_subdirector' => $this->req_fkuse_subdirector,
            'req_fkuse_planeacion' => $this->req_fkuse_planeacion,
            'req_fkuse_director' => $this->req_fkuse_director,
            'req_fkconfiguracion' => $this->req_fkconfiguracion
        ]);

        if(!Yii::$app->user->isSuperAdmin)
            $query->andFilterWhere(['req_fkuse_solicitante' => Yii::$app->user->identity->id]);

        $query->andFilterWhere(['like', 'req_tipo', $this->req_tipo])
            ->andFilterWhere(['like', 'req_folio', $this->req_folio])
            ->andFilterWhere(['like', 'req_justificacion', $this->req_justificacion]);

        $query->andFilterWhere(['>=', 'req_fecha', $fecha[0] ])
                ->andFilterWhere(['<=', 'req_fecha', $fecha[1]]);

        if( $costoTotal)
            $query->having(['=', 'req_costoTotal', $costoTotal]);

        return $dataProvider;
    }
}
