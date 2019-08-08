<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ConfiguracionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Configuración';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-configuracion-index">

    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <br>

    <p>
        <?= Html::a('Crear configuración', ['create'], ['class' => 'btn btn-success']) ?>
        <br><br>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'con_id',
            'con_instituto',
            [
                'attribute' => con_logo,
                'format'    => 'raw',
                'contentOptions' => ['style'=>'vertical-align: middle; width:65px;'],
                'value'     => function ($model) {
                    return '<center>'.Html::img($model->con_logo, ['width'=>'50px']).'<br>'.$model->con_logo.'</center>';
                },
            ],
            'con_revision',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {view}',
            ],
        ],
    ]); ?>
</div>
