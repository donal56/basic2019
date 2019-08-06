<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ReqArea */

$this->title = 'Actualizar Area: ' . $model->are_id;
$this->params['breadcrumbs'][] = ['label' => 'Areas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->are_id, 'url' => ['view', 'id' => $model->are_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="req-area-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
