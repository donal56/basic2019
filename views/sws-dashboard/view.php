<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboard */

$this->title = $model->nombre;
$this->params['breadcrumbs'][] = ['label' => 'Dashboard', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sws-dashboard-view">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>
    <br>

    <p align="center">
        <?= Html::a('Actualizar', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estás seguro de eliminar este botón?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'id',
            'gruponombre',
            'orden',
            'nombre',
            'url:url',
            'clase',
            //'status',
            'activo',
            'rol',
        ],
    ]) ?>

</div>
