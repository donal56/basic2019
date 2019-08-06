<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\RequisicionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Requisiciones';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requisicion-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Crear Requisicion', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'req_id',
            'req_fecha',
            'req_folio',
            'req_fkper_solicitante',
            'req_fechasolicitante',
            // 'req_esoperativo',
            // 'req_justificacion:ntext',
            // 'req_fkper_subdirector',
            // 'req_fkper_planeacion',
            // 'req_fkper_director',
            // 'req_fkconfiguracion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
