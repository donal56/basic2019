<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ReqPersonal */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="req-personal-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'per_nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'per_paterno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'per_materno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'per_fkuser')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
