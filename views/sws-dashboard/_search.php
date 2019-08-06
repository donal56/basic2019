<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboardSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sws-dashboard-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'fkgrupo') ?>

    <?= $form->field($model, 'orden') ?>

    <?= $form->field($model, 'nombre') ?>

    <?= $form->field($model, 'url') ?>

    <?php // echo $form->field($model, 'clase') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'rol') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
