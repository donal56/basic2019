<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use kartik\color\ColorInput;

/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboardgrupos */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sws-dashboardgrupos-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
    	<div class="col-md-12">
	    	<div class="col-md-6">
	    		<?= $form->field($model, 'gpo_nombre')->textInput(['maxlength' => true]) ?>
	    	</div>
	    	<div class="col-md-2">
    			<?= $form->field($model, 'gpo_orden')->textInput() ?>
	    	</div>
	    	<div class="col-md-2">
    			<?= $form->field($model, 'gpo_activo')->widget(Select2::classname(), [
                        'data'              => ['1' => 'Activo', '0' => 'Inactivo'],
                        'language'          => 'es',
                        'options'           => [
                            'placeholder'   => 'Seleccione el status...',
                        ],
                        'pluginOptions'     => [
                            'allowClear'    => false
                        ],
                ]);?>
	    	</div>
	    	<div class="col-md-2">
    			<?= $form->field($model, 'gpo_color')->widget(ColorInput::classname(), [
    				'options' => ['placeholder' => 'Selecciona el color...'],
    			]);?>
	    	</div>
    	</div>
    </div>

    <div class="form-group" align="center">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
