<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ReqDetalle */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="req-detalle-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'det_fkrequisicion')->textInput() ?>

    <?= $form->field($model, 'det_clave')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'det_partida')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'det_cantidad')->textInput() ?>

    <?= $form->field($model, 'det_unidad')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'det_descripcion')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'det_costo')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
