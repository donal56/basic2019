<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ReqPersonal */

$this->title = 'Actualizar Personal: ' . $model->per_id;
$this->params['breadcrumbs'][] = ['label' => 'Personas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->per_id, 'url' => ['view', 'id' => $model->per_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="req-personal-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
