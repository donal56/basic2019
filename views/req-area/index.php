<?php

use yii\helpers\Html;
use yii\grid\GridView;

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

            'are_id',
            'are_nivel',
            'are_nombre',
            'are_fkper_responsable',
            'are_fkper_superior',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
