<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SwsDashboardSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Dashboard';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sws-dashboard-index">

    <div class="row">
        <div class="col-md-6">
            <?= Html::a('Crear Botón', ['create'], ['class' => 'btn btn-success']) ?>
            <?= Html::a('Ver Categorías', ['/sws-dashboardgrupos/index'], ['class' => 'btn btn-info']) ?>
        </div>
        <div class="col-md-6">
            <h1><?= Html::encode($this->title) ?></h1>
        </div>
        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    </div>

    <?= GridView::widget([
        'options' => [
            'class' => 'table-responsive',
        ],
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            [
                'attribute' => 'gruponombre',
                'format'    => 'raw',
                'filter'    =>$categorias,
                'value'     =>function($model){
                    return $model->gruponombre;
                },
            ],
            [
                'attribute' => 'orden',
                //'format'    => 'raw',
                'contentOptions' => ['style'=>'vertical-align: middle; width:15px;'],
            ],
            [
                'attribute' => 'url',
                'format'    => 'url',
                'value' => function ($model){
                    return (strpos($model->url, 'http') === false ? 'http://'.$_SERVER['SERVER_NAME'] : '').$model->url;
                },
            ],
            [
                'attribute' => 'nombre',
                'format'    => 'raw',
                'contentOptions' => ['style'=>'vertical-align: middle; width:65px;'],
                'value'     => function ($model) {
                    return '<center>'.Html::img('/img/dashboard/'.$model->clase.'.png', ['width'=>'50px']).'<br>'.$model->nombre.'</center>';
                },
            ],
            [
                'class'         => 'webvimark\components\StatusColumn',
                'attribute'     => 'status',
                'contentOptions' => [
                    'style' => 'vertical-align:middle;text-align:center'
                ],
                'optionsArray' => [
                    [0,'Inactivo'               ,'danger'],
                    [1,'Menú principal'         ,'primary'],
                    [2,'Botón en Menú Principal','info'],
                    [3,'Submenú'                ,'success'],
                    [4,'Botón enSubmenú'        ,'warning'],
                ]
            ],
            [
                'attribute' => 'rol',
                'format'    => 'raw',
                'contentOptions' => ['style'=>'vertical-align: middle; width:50px;'],
                'value'     => function ($model) {
                    return implode('<br>',explode(',',$model->rol));
                },
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
