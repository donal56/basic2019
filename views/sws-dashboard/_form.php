<?php

use yii\helpers\Html;
use kartik\select2\Select2;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboard */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sws-dashboard-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-12">
            <div class="col-md-3">
                <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-3">
                <?= $form->field($model, 'fkgrupo')->widget(Select2::classname(), [
                        'data'              => $grupos,
                        'language'          => 'es',
                        'options'           => [
                            'placeholder'   => 'Seleccione el grupo...',
                            'onchange'      => '$.post("/sws-dashboard/contador?id="+$(this).val(),
                                                    function(data) {
                                                        $("input#swsdashboard-orden").val(data);
                                                    }
                                                );',
                        ],
                        'pluginOptions'     => [
                            'allowClear'    => false
                        ],
                ]);?>
            </div>
            <div class="col-md-3">
                <?= $form->field($model, 'clase')->textInput() ?>
            </div>
            <div class="col-md-3">
                <?= $form->field($model, 'orden')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-3" id="status">
                <?= $form->field($model, 'status')->widget(Select2::classname(), [
                        'data'              => [ '1' => 'Menú principal', '2' => 'Botón en Menú principal', '3' => 'Submenú', '4' => 'Botón en Submenú', '0' => 'Inactivo'],
                        'language'          => 'es',
                        'options'           => [
                            'placeholder'   => 'Seleccione el status...',
                            'onchange'      => 'visiblegrupo()',
                        ],
                        'pluginOptions'     => [
                            'allowClear'    => false
                        ],
                ]);?>
            </div>
            <div class="col-md-6" id='url'>
                <?= $form->field($model, 'url')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-3" id='roles'>
                <?= $form->field($model, 'asignados')->widget(Select2::classname(), [
                    'data'              => $roles,
                    'maintainOrder'     => true,
                    'language'          => 'es',
                    'options'           => [
                        'placeholder'   => 'Seleccione el rol...',
                        'multiple'      => true,
                    ],
                    'pluginOptions'     => [
                        'tags'               => true,
                        'maximumInputLength' => 10
                    ],
                ]);?>
            </div>
            <div class="col-md-3" id='grupo' style="visibility: hidden; position:relative;">
                <?= $form->field($model, 'grupo')->widget(Select2::classname(), [
                        'data'              => $grupos,
                        'language'          => 'es',
                        'options'           => [
                            'placeholder'   => 'Seleccione el grupo...',
                        ],
                        'pluginOptions'     => [
                            'allowClear'    => false
                        ],
                ]);?>
            </div>
        </div>
    </div>

     <div class="form-group" align="center">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    function visiblegrupo()
    {
        var valor = $("#swsdashboard-status").val();
        if(valor == 0 || valor == 1 || valor == 3){
            $("#url")   .css("visibility", "hidden");
            $("#grupo") .css("visibility", "hidden");
            if(valor == 3) {
            	$("#grupo") .css("visibility", "visible");
	            $("#grupo") .insertAfter("#status"); 
	            $("#roles") .insertAfter("#grupo");
	        } else {
	            $("#roles") .insertBefore("#status"); 
	            $("#status").insertBefore("#roles"); 
	        }
        } else {
	        $("#url")  .css("visibility", "visible");
	        $("#grupo").css("visibility", "hidden");
            $("#grupo").insertAfter("#url");
            $("#roles").insertAfter("#url");
        }
    }
    visiblegrupo();
</script>