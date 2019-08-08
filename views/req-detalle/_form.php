<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use unclead\multipleinput\MultipleInput;

/* @var $this yii\web\View */
/* @var $model app\models\ReqDetalle */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="req-detalle-form">

    <?php $form = ActiveForm::begin(); ?>


    <?= $form->field($model,'temp')->widget(MultipleInput::className(), 
    [
        'allowEmptyList'    => false,
        'addButtonPosition' => MultipleInput::POS_ROW,
        'prepend'   => true,
        'sortable' => true,
        'columns' => 
        [
            [
            'name'  => 'det_clave',
            'title' => 'Clave'
            ],
            [
            'name'  => 'det_partida',
            'title' => 'Partida'
            ],
            [
            'name'  => 'det_cantidad',
            'title' => 'Cantidad'
            ],
            [
            'name'  => 'det_unidad',
            'title' => 'Unidad'
            ],
            [
            'name'  => 'det_descripcion',
            'title' => 'Descripcion'
            ],
            [
            'name'  => 'det_costo',
            'title' => 'Costo'
            ]
        ]
    ]);
    ?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
