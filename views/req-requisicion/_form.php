<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="requisicion-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'req_fecha')->textInput() ?>

    <?= $form->field($model, 'req_folio')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'req_fkper_solicitante')->textInput() ?>

    <?= $form->field($model, 'req_fechasolicitante')->textInput() ?>

    <?= $form->field($model, 'req_esoperativo')->textInput() ?>

    <?= $form->field($model, 'req_justificacion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'req_fkper_subdirector')->textInput() ?>

    <?= $form->field($model, 'req_fkper_planeacion')->textInput() ?>

    <?= $form->field($model, 'req_fkper_director')->textInput() ?>

    <?= $form->field($model, 'req_fkconfiguracion')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
