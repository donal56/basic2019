<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\RequisicionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'MIS REQUISICIONES';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requisicion-index">

    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <br>

    <p>
        <?= Html::a('Nueva Requisición', ['create'], ['class' => 'btn btn-success']) ?>
        <br><br>
    </p>

<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'req_folio',
            'req_fecha',
            [
                'attribute' => req_fkper_solicitante,
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fullName($model->req_fkper_solicitante);
                }
            ],
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

<?php 
$this->registerCssFile("css/req.css");
 ?>
