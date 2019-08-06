<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ConfiguracionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="req-configuracion-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'con_id') ?>

    <?= $form->field($model, 'con_instituto') ?>

    <?= $form->field($model, 'con_logo') ?>

    <?= $form->field($model, 'con_revision') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
