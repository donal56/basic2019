<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ReqDetalleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Req Detalles';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-detalle-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Req Detalle', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'det_id',
            //'det_fkrequisicion',
            'det_clave',
            'det_partida',
            'det_cantidad',
            'det_unidad',
            'det_descripcion',
            'det_costo',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
