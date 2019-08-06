<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ReqDetalleSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="req-detalle-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'det_id') ?>

    <?= $form->field($model, 'det_fkrequisicion') ?>

    <?= $form->field($model, 'det_clave') ?>

    <?= $form->field($model, 'det_partida') ?>

    <?= $form->field($model, 'det_cantidad') ?>

    <?php // echo $form->field($model, 'det_unidad') ?>

    <?php // echo $form->field($model, 'det_descripcion') ?>

    <?php // echo $form->field($model, 'det_costo') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
