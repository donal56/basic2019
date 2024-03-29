<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use app\components\SWS_API;
use kartik\daterange\DateRangePicker;
use yii\helpers\StringHelper;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RequisicionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'MIS REQUISICIONES';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requisicion-index">

    <br>

    <div>
        <h2 align= 'center' style= 'display: inline-block'><?= Html::encode($this->title) ?></h2>
        <?= Html::a('Nueva Requisición', ['create'], ['class' => 'btn btn-success btn-sm', 'style' => 'float: right; display: inline-block']) ?>
    </div>
    <br>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

<?php Pjax::begin(['timeout'=>false]); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'attribute' => 'req_folio',
                'contentOptions' => ['style' => 'width:8em'],
                'filterOptions' => ['class' => 'input-group-sm'],
            ],
            [
                'attribute' => 'req_tipo',
                'format' => 'raw',
                'value' => function($model)
                {
                    return  $model->req_tipo == '0'? 'BIENES':'SERVICIOS';
                
                },
                'filter' => Html::activeDropDownList($searchModel, 'req_tipo', ['0' => 'BIENES' , '1' => 'SERVICIOS'],['class'=>'form-control','style'=>'padding:0px;font-size: 0.85em;','prompt' => '']),
                'contentOptions' => ['style' => 'width:9.5em;font-size: 0.85em;'],
                'filterOptions' => ['class' => 'input-group-sm'],
            ],
            [
                'attribute'=>'req_fecha',
                'label'=>'Fecha de elaboración  ',
                'format'=>'date',
                'filter'=> '<div class="drp-container input-group-sm input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>'.
                    DateRangePicker::widget(
                    [
                        'name'  => 'ReqRequisicionSearch[intervalo]',
                        'useWithAddon'=>'true',
                        'pluginOptions'=>
                        [ 
                            'locale'=> [ 'separator'=>' a '],
                            'opens'=>'right'
                        ] 
                    ]) . '</div>',
                'contentOptions' => ['style' => 'width: 12em; font-size: 0.85em'],
            ],
            // [
            //     'attribute' => 'req_fecha',
            //     'format' => 'date',
                
            // ],
            [
                'attribute' => 'req_justificacion',
                'format' => 'raw',
                'value' => function($model)
                {
                    return StringHelper::truncate($model->req_justificacion, 80);
                
                },
                'contentOptions' => ['style' => 'font-size: 0.85em'],
                'filterOptions' => ['class' => 'input-group-sm'],
            ],
            [
                'attribute' => "req_total",
                'format' => 'raw',
                'value' => function($model)
                {
                    return '$'.number_format( $model->getTotal(), 2, '.', ',');
                
                },
                'contentOptions' => ['style' => 'width:10em;font-size: 0.85em'],
                'filter'=> "<input class = 'form-control' name= 'ReqRequisicionSearch[costoTotal]'></input>",
                'filterOptions' => ['class' => 'input-group-sm'],
            ],
            [
                'class' => 'app\components\ActionColumnPlus',
                'filter'=> Html::a('Limpiar', ['index'], ['class' => 'btn btn-sm btn-default']),
                'buttons' => 
                [
                    'print' => function ($url, $model, $key) 
                    {
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span> ', ['req-requisicion/report', 'id' => $model->req_id],['data-pjax'=>"0"]);
                    },
                ],
                'template' => '{print} {view} {update} {delete} '
            ]
        ],
        'tableOptions' => ['class' => 'table table-striped table-condensed table-bordered']
    ]); 
    ?>
<?php Pjax::end(); ?></div>

<?php 
    $this->registerCssFile("/css/req.css"); 
 ?>
