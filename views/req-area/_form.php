<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use app\models\ReqArea;
use yii\db\Query;

/* @var $this yii\web\View */
/* @var $model app\models\ReqArea */
/* @var $form yii\widgets\ActiveForm */
	$this->title = "Area";
?>

<div class="req-area-form">
    <?php $form =ActiveForm::begin(); ?>

<?php
	$query = new Query;
    $query	->select([
        'req_area.are_id as ID' , 
        'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre ']
        )  
        ->from('req_area')
        ->join('INNER JOIN', 'req_personal',
            'req_area.are_fkper_responsable = req_personal.per_id');
    $command = $query->createCommand();
    $data1 = $command->queryAll();

?>


<?= $form->field($model, 'are_nivel')->textInput() ?>

<?= $form->field($model, 'are_nombre')->textInput(['maxlength' => true]) ?>

<?= $form->field($model, 'are_fkper_responsable')->dropDownList(ArrayHelper::map($data1, "ID", "Nombre")) ?>

<?= $form->field($model, 'are_fkper_superior')->dropDownList(ArrayHelper::map($data1, "ID", "Nombre")) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Cancelar', '/req-requisicion', ['Class' => 'btn btn-danger']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
