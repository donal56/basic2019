<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\ReqPersonal;

/* @var $this yii\web\View */
/* @var $model app\models\ReqArea */

$this->title = $model->are_id;
$this->params['breadcrumbs'][] = ['label' => 'Areas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-area-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('', '/req-area', ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Actualizar', ['update', 'id' => $model->are_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->are_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estas seguro de seguro de eliminar este elemento?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'are_id',
            'are_nivel',
            'are_nombre',
            [
                'attribute' => 'are_fkper_responsable',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fullName($model->are_fkper_responsable);
                }
            ],
            [
                'attribute' => 'are_fkper_superior',
                'format'    => 'raw',
                'value'     => function ($model) 
                {
                    return $model-> fullNameS($model->are_fkper_superior,$model->are_nivel);
                }, 
            ],
        ],
    ]) ?>

</div>
