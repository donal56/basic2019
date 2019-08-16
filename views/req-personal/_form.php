<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\db\Query;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\ReqPersonal */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="req-personal-form">

<?php
    $query = new Query;
    $query  ->select(['user.id as ID','user.username as USERNAME'])
    ->from('user')
    ->join('INNER JOIN', 'req_personal',
            'req_personal.per_fkuser = user.id');

    $command = $query->createCommand();
    $data1 = $command->queryAll();
?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'per_nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'per_paterno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'per_materno')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'per_fkuser')->dropDownList(ArrayHelper::map($data1, "ID", "USERNAME")) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Cancelar', '/req-requisicion', ['Class' => 'btn btn-danger']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
