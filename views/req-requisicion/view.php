<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;
use app\components\SWS_API;

/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */

$this->title = $model->req_folio? $model->req_folio : 'Requisición sin folio';
$this->params['breadcrumbs'][] = ['label' => 'Requisiciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requisicion-view">
    

    <h1><?= Html::encode($model->req_folio) ?></h1>
 

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
            'req_fecha:date',
            'req_folio',
             [
                'attribute' => 'req_fkuse_solicitante',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return SWS_API::buscarNombre($model->getSolicitante()->rfc);
                }
            ],
            [
                'attribute' => 'req_tipo',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model->req_tipo == '0'? 'BIENES':'SERVICIOS';
                }
            ],
            'req_fechasolicitante:date',
            'req_fechaactualizado:date',
            'req_esoperativo:boolean',
            'req_justificacion:ntext',
            [
                'attribute' => 'req_fkuse_subdirector',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return SWS_API::buscarNombre($model->getSubdirector()->rfc);
                }
            ],
            [
                'attribute' => 'req_fkuse_planeacion',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return SWS_API::buscarNombre($model->getPlaneacion()->rfc);
                }
            ],
            [
                'attribute' => 'req_fkuse_director',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return SWS_API::buscarNombre($model->getDirector()->rfc);
                }
            ],
        ],

    
    ]) ?>
<br>
<h2>Detalles</h2>
<br>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //'det_id',
            //'det_fkrequisicion',
            'det_clave',
            'det_partida',
            'det_cantidad',
            'det_unidad',
            'det_descripcion',
            [
              'attribute' => 'det_costo',
              'label' => 'Costo estimado <br> (Total + IVA)',
              'encodeLabel' => false,
              'value' =>  function ($model) {
                    return '$'.number_format($model->det_costo, 2, '.', ',');
                },
            ],   
        ],
    ]); ?>

</div>
