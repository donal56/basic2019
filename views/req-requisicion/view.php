<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */

$this->title = $model->req_folio;
$this->params['breadcrumbs'][] = ['label' => 'Requisiciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requisicion-view">
    
    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <br>

    <p>
        <?= Html::a('', '/req-requisicion', ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Actualizar', ['update', 'id' => $model->req_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->req_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estas seguro de seguro de eliminar este elemento?',
                'method' => 'post',
            ],
        ]) ?>
        <?= Html::a('Imprimir', ['report', 'id' => $model->req_id], [
            'class' => 'btn btn-info'
        ]) ?>
    </p>

    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'req_id',
            'req_fecha',
            'req_folio',
             [
                'attribute' => req_fkper_solicitante,
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fullName($model->req_fkper_solicitante);
                }
            ],
            'req_fechasolicitante',
            [
                'attribute' =>  req_esoperativo,
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model->req_esoperativo = 1 ? 'Si' : 'No';
                }
            ],
            'req_justificacion:ntext',
            [
                'attribute' => req_fkper_subdirector,
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fullName($model->req_fkper_subdirector);
                }
            ],
            [
                'attribute' => req_fkper_planeacion,
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fullName($model->req_fkper_planeacion);
                }
            ],
            [
                'attribute' => req_fkper_director,
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fullName($model->req_fkper_director);
                }
            ],
        ],

    
    ]) ?>

</div>
