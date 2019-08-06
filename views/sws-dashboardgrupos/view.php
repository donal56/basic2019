<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboardgrupos */

$this->title = $model->gpo_nombre;
$this->params['breadcrumbs'][] = ['label' => 'Categorías', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sws-dashboardgrupos-view">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>
    <br>

    <p align="center">
        <?= Html::a('Actualizar', ['update', 'id' => $model->gpo_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->gpo_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estás seguro de eliminar este grupo?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'gpo_id',
            'gpo_nombre',
            'gpo_orden',
            'activo',
            [
                'attribute' => 'gpo_color',
                        
                'value'=>Html::tag('span', ' ', ['class'=>'badge','style' => 'text-align: center; width: 100px; height:50px; color:white;background-color:'.$model->gpo_color])."<br>".$model->gpo_color,
                'format' => 'raw',
            ],
        ],
    ]) ?>

</div>
