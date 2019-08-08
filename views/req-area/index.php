<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ReqPersonal;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AreaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Áreas';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="req-area-index">

    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <br>

    <p>
        <?= Html::a('Crear área', ['create'], ['class' => 'btn btn-success']) ?>
        <br><br>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'are_nivel',
            'are_nombre',
            [
                'attribute' => are_fkper_responsable,
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fullName($model->are_fkper_responsable);
                }
            ],
            [
                'attribute' => are_fkper_superior,
                'format'    => 'raw',
                'value'     => function ($model) 
                {
                    return $model-> fullNameS($model->are_fkper_superior,$model->are_nivel);
                }, 
            ],
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>

