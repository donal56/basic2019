<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SwsDashboardgruposSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Categorías';
$this->params['breadcrumbs'][] = ['label' => 'Dashboard', 'url' => ['/sws-dashboard/index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sws-dashboardgrupos-index">

    <div class="row">
        <div class="col-md-2">
            <?= Html::a('Crear Categoría', ['create'], ['class' => 'btn btn-success']) ?>
        </div>
        <div class="col-md-8" align="center">
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

            //'gpo_id',
            'gpo_nombre',
            'gpo_orden',
            [
                'class'         => 'webvimark\components\StatusColumn',
                'attribute'     => 'gpo_activo',
                'contentOptions' => [
                    'style' => 'vertical-align:middle;text-align:center'
                ],
                'optionsArray' => [
                    [0,'Inactivo','danger'],
                    [1,'Activo','success'],
                ]
            ],
            //'gpo_color',
            [
                'attribute'      => 'gpo_color',
                'format'         => 'raw',
                'contentOptions' => function ($model, $key, $index, $column){
                    return [
                        'class' =>'badge', 
                        'style' => 'text-align: center; width: 100px;color:white;background-color:'.$model->gpo_color
                    ];},
                'headerOptions'  => ['style' => 'width: 100px; text-align: center;'],
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
