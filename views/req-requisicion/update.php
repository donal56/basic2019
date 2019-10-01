<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */

$this->title = 'Actualizar requisición ' . $model->req_folio;
$this->params['breadcrumbs'][] = ['label' => 'Requisiciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->req_id, 'url' => ['view', 'id' => $model->req_id]];
$this->params['breadcrumbs'][] = 'Update';

?>
<div class="requisicion-update">
    <h3 style="text-align: center;"><?= Html::encode($this->title) ?></h3><hr style="margin:0;">
    <?= $this->render('_form', [
        'model' => $model,
        'modeldet' => $modeldet,
        'nuevosCargos' => $model->checkUpdates()
    ]) ?>

</div>
