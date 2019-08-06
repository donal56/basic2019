<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ReqDetalle */

$this->title = 'Update Req Detalle: ' . $model->det_id;
$this->params['breadcrumbs'][] = ['label' => 'Req Detalles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->det_id, 'url' => ['view', 'id' => $model->det_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="req-detalle-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
