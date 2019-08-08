<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ReqConfiguracion */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="req-configuracion-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'con_instituto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'con_logo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'con_revision')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Cancelar', '/req-configuracion', ['Class' => 'btn btn-danger']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
