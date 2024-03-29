<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\ReqDetalle */

$this->title = $model->det_id;
$this->params['breadcrumbs'][] = ['label' => 'Req Detalles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-detalle-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->det_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->det_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'det_id',
            'det_fkrequisicion',
            'det_clave',
            'det_partida',
            'det_cantidad',
            'det_unidad',
            'det_descripcion',
            'det_costo',
        ],
    ]) ?>

</div>
