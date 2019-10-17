<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RequisicionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="requisicion-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'req_id') ?>

    <?= $form->field($model, 'req_fecha') ?>

    <?= $form->field($model, 'req_folio') ?>

    <?= $form->field($model, 'req_fkuse_solicitante') ?>

    <?= $form->field($model, 'req_fechasolicitante') ?>

    <?php // echo $form->field($model, 'req_esoperativo') ?>

    <?php // echo $form->field($model, 'req_justificacion') ?>

    <?php // echo $form->field($model, 'req_fkuse_subdirector') ?>

    <?php // echo $form->field($model, 'req_fkuse_planeacion') ?>

    <?php // echo $form->field($model, 'req_fkuse_director') ?>

    <?php // echo $form->field($model, 'req_fkconfiguracion') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
