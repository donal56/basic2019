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

<?php Pjax::begin(['enablePushState'=>false]); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'req_folio',
            'req_fecha',
            [
                'attribute' => 'req_justificacion',
                'format' => 'raw',
                'value' => function($model)
                {
                    return mb_substr($model->req_justificacion,0,85)."...";
                
                },
                'contentOptions' => ['style' => 'font-size: 0.85em'],
            ],
            ['class' => 'yii\grid\ActionColumn',
            'buttons' => [
                'print' => function ($url, $model, $key) {
                    return Html::a ( '<span class="glyphicon glyphicon-print"></span> ', ['req-requisicion/report', 'id' => $model->req_id],['data-pjax'=>"0"]);

                },
            ],
            'template' => '{print} {view} {update} {delete} '
            ]
        ],
    ]); ?>
<?php Pjax::end(); ?></div>

<?php 
    $this->registerCssFile("/css/req.css"); 
 ?>
