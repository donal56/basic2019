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
            'req_fkper_solicitante',
            'req_fechasolicitante',
            'req_esoperativo',
            'req_justificacion:ntext',
            'req_fkper_subdirector',
            'req_fkper_planeacion',
            'req_fkper_director',
            'req_fkconfiguracion',
        ],
    ]) ?>

</div>
