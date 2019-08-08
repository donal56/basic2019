<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ReqPersonal;
use app\models\User;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PersonalSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Personal';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-personal-index">

    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <br>

    <p>
        <?= Html::a('Crear personal', ['create'], ['class' => 'btn btn-success']) ?>
        <br><br>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'per_nombre',
            'per_paterno',
            'per_materno',
            [
                'attribute' => per_fkuser,
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fillUserName($model->per_fkuser);
                }
            ],
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
