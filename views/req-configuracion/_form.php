<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ReqConfiguracion */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="req-configuracion-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'con_instituto')->textInput(['maxlength' => true]) ?>

    <!-- <?= $form->field($model, 'con_logo')->textInput(['maxlength' => true]) ?> -->
    <?= $form->field($model, 'file')->fileInput(['accept' => '.jpg,.jpeg,.png', 'class' => 'well']) ?>

    <?= $form->field($model, 'con_revision')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Actualizar', ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Cancelar', '/req-configuracion', ['Class' => 'btn btn-danger']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
