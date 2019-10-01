<?php
use yii\helpers\Html;
use kartik\alert\Alert;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use unclead\multipleinput\MultipleInput;
use kartik\date\DatePicker;
use yii\db\Query;
use yii\web\User;
use app\components\SWS_API;
use app\models\ReqConfiguracion;

/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */
/* @var $form yii\widgets\ActiveForm */
?>
<br>
<div class="requisicion-form">


    <?php $form = ActiveForm::begin(['id' => 'requisicion-form', 'validateOnSubmit' => false]); ?>

    <div class= 'row' style= 'margin-top: 1.0em'>
        
         <?= $form -> field($model, 'req_tipo' ,['options' => ['class' => 'form-group col-sm-2']]) ->dropDownList(
            ['0' => 'BIENES' , '1' => 'SERVICIOS'],
            ['style' => 'font-size: 0.9em']); ?>
        <?php
            echo $form->field($model, 'req_fecha', ['options' => ['class' => 'form-group col-sm-2']]) -> widget(DatePicker::classname(), 
            [
                 'options' => ['value' => $model->isNewRecord ? date('Y-m-d') :  $model -> req_fecha,
                                 'style' => 'font-size: 0.9em'], 
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
       
        <?php
            echo $form->field($model, 'req_fechasolicitante',['options' => ['class' => 'form-group col-sm-2']] ) -> widget(DatePicker::classname(), 
            [
                'options' => ['value' => $model -> isNewRecord ? date('Y-m-d') : $model -> req_fecha,
                                'style' => 'font-size: 0.9em'],
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
   
        <?= $form -> field($model, 'req_folio', ['options' => ['class' => 'form-group col-sm-2']]) -> textInput(['style' => 'font-size: 0.9em']);; ?>

        <?= $form ->field($model, 'req_esoperativo',['options' => ['class' => 'form-group col-sm-4']]) -> checkbox(['labelOptions' => ['class' => 'text-justify', 'style' => 'margin-top:15px;font-size: 0.9em;']]); ?> 

    </div>

    <div class= 'row'>
        <?= $form -> field($model, 'req_justificacion',['options' => ['class' => 'form-group col-sm-12']]) -> textarea(['label' => 'Justificación', 'rows' => 2, 'placeholder' => 'LO ANTERIOR PARA SER UTILIZADO EN LA ACCIÓN:', 'style' => 'font-size: 0.9em']); ?>
    </div>
        
    <div class="row req-detalle-form">

        <?= $form->field($modeldet,'temp')->widget(MultipleInput::className(), 
        [
            'allowEmptyList'    => false,
            'addButtonPosition' => MultipleInput::POS_ROW,
            'addButtonOptions' => 
            [
                'class' => 'btn btn-success',
                'label' => '<i class="glyphicon glyphicon-plus"></i>' 
            ],
            'prepend'   => true,
            'sortable' => false,
            'columns' => 
            [
                [
                    'name'  => 'det_id',
                    'title' => 'ID',
                ],
                [
                    'name'  => 'det_clave',
                    'title' => 'Clave',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 15em; font-size: 0.9em',
                    ],
                ],
                [
                    'name'  => 'det_partida',
                    'title' => 'Partida',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 5em; font-size: 0.9em',
                    ],
                ],
                [
                    'name'  => 'det_cantidad',
                    'title' => 'Cantidad',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 5em; font-size: 0.9em',
                    ],
                ],
                [
                    'name'  => 'det_unidad',
                    'title' => 'Unidad',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 5em; font-size: 0.9em',
                    ],
                ],
                [
                    'name'  => 'det_descripcion',
                    'title' => 'Descripcion',
                    'type' => 'textarea',
                    'options'=> 
                    [
                        'style' => 'height: 70px; !important; width: 47em; font-size: 0.9em',
                    ],
                    'enableError' => true 
                ],
                [
                    'name'  => 'det_costo',
                    'title' => 'Costo',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 7em; font-size: 0.9em',
                        'placeholder' => '$0.00',
                    ],
                ]
            ]
        ])->label(false);
        ?>

    </div>

    <?php 
        if(!$nuevosCargos)
        {
            Alert::begin([
                'options' => [
                    'class' => 'alert-info',
                    'id' => 'alertFirmas'
                ],
            ]);
            
            $a = $nuevosCargos['superior'];
            $b = $nuevosCargos['planeacion'];
            $c = $nuevosCargos['director'];

            echo <<<LABEL
            <span class="glyphicon glyphicon-info-sign"></span>
            <b>Se han actualizado algunos datos de las firmas.</b> ¿Desea realizar los cambios?
            <a style= "cursor: pointer" onclick= "actualizarFirmas($a ,$b ,$c)"> Actualizar</a>
LABEL;

            Alert::end();
        }
    ?>

        <?= $form -> field($model, 'req_fkper_solicitante') -> hiddenInput(['value' => SWS_API::getID()])->label(false); ?>
        <?= $form -> field($model, 'req_fkper_subdirector') -> hiddenInput(['id' => 'fSuperior', 'value' => SWS_API::getSuperior()[3]])->label(false) ?>
        <?= $form -> field($model, 'req_fkper_planeacion') -> hiddenInput(['id' => 'fPlaneacion', 'value' => SWS_API::getJefePlaneacion()[3]])->label(false) ?>
        <?= $form -> field($model, 'req_fkper_director') -> hiddenInput(['id' => 'fDirector', 'value' => SWS_API::getDirector()[3]])->label(false) ?>


    <?= $form -> field($model, 'req_fkconfiguracion') -> hiddenInput(['value'=> ReqConfiguracion::find()->one()->con_id])->label(false); ?><br>

    <div class="row form-group col-md-3" style= 'margin-top: 1.0em'>
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Cancelar', '/req-requisicion', ['Class' => 'btn btn-danger']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>


<!-- Modal -->
<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
       <?php echo Alert::widget([
            'type' => Alert::TYPE_DANGER,
            'title' => 'Error!',
            'body' => 'Revisa los campos con errores e intenta de nuevo ',
            'showSeparator' => true,
            'delay' => 0,
            'options'=>['id'=>'alert-id']
        ]); ?>
  </div>
</div>

<?php if ($this->params['empty']=="true") { ?>

<div class="modal fade" id="ModalDet" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
       <?php echo Alert::widget([
            'type' => Alert::TYPE_DANGER,
            'title' => 'Error!',
            'body' => 'Es necesario registrar algun bien o servicio para generar una requisición',
            'showSeparator' => true,
            'delay' => 0,
            'options'=>['id'=>'alert-det']
        ]); ?>
  </div>
</div>

<?php 
} 
    $this->registerJsFile("/js/requisicion.js", ['depends' => 'yii\web\JqueryAsset']);
?>