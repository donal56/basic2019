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

/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */
/* @var $form yii\widgets\ActiveForm */

    $query1 = new Query;
    $query1 -> select(['req_personal.per_id as ID', 
    'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre '])
        -> from('req_personal')
        -> join('INNER JOIN', 'user', 'req_personal.per_fkuser = user.id')
        -> where(['user.id' => Yii::$app->user->identity->id]);
    $data = $query1 -> createCommand() -> queryAll();

    $query2 = new Query;
    $query2  ->select([ 'req_personal.per_id as ID' , 
        'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre '])  
        ->from('req_personal')
        ->join('INNER JOIN', 'req_area', 'req_area.are_fkper_responsable = req_personal.per_id');
    
    $data2 = $query2 ->where(['req_area.are_nivel' => '2']) -> createCommand() -> queryAll();
    $data1 = $query2 ->where(['req_area.are_nivel' => '1']) -> createCommand() -> queryAll();
    $data0 = $query2 ->where(['req_area.are_nombre' => 'DEPTO. DE PLAN., PROG. Y PRESUPUESTACIÓN']) -> createCommand() -> queryAll();

    $query3 = new Query;
    $data5 = $query3->select(['con_id as ID' , 'CONCAT("INSTITUTO TECNOLÓGICO DE ", con_instituto) as Instituto'])->from('req_configuracion')->createCommand()->queryAll();
?>

<div class="requisicion-form">


    <?php $form = ActiveForm::begin(['fieldConfig' => function ($model, $attribute) 
    {
        if ($attribute == 'req_justificacion' || $attribute == 'temp') 
        {
            return ['options' => ['class' => 'col-md-12']];
        }
        else if($attribute == 'req_esoperativo'  || $attribute == 'req_fkper_solicitante') 
        {
            return ['options' => ['class' => 'col-md-3']];
        }
        else if ($attribute == 'req_fkper_subdirector' || $attribute == 'req_fkper_planeacion' || $attribute == 'req_fkper_director') 
        {
            return ['options' => ['class' => 'col-md-4']];
        }
        else 
        {
            return ['options' => ['class' => 'col-md-2']];
        }
    }, 'id' => 'requisicion-form', 'validateOnSubmit' => false]); ?>

    <div class= 'row' style= 'margin-top: 1.0em'>
        <?php
            echo $form->field($model, 'req_fecha') -> widget(DatePicker::classname(), 
            [
                 'options' => ['value' => $model->isNewRecord ? date('Y-m-d') :  $model -> req_fecha,
                                 'style' => 'font-size: 0.8vw'], 
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
        <?= $form -> field($model, 'req_folio') -> textInput(['style' => 'font-size: 0.8vw']);; ?>
        <?= $form -> field($model, 'req_fkper_solicitante') -> dropDownList(ArrayHelper::map($data, "ID", "Nombre"), ['readonly' => true, 'style' => 'font-size: 0.8vw']); ?>
        <?php
            echo $form->field($model, 'req_fechasolicitante') -> widget(DatePicker::classname(), 
            [
                'options' => ['value' => $model -> isNewRecord ? date('Y-m-d') : $model -> req_fecha,
                                'style' => 'font-size: 0.8vw'],
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
        <?= $form ->field($model, 'req_esoperativo') -> checkbox(['labelOptions' => ['class' => 'text-justify', 'style' => 'font-size: 0.8vw']]); ?> 
   

    </div>

    <div class= 'row'>
        <?= $form -> field($model, 'req_justificacion') -> textarea(['label' => 'Justificación', 'rows' => 2, 'placeholder' => 'LO ANTERIOR PARA SER UTILIZADO EN LA ACCIÓN:', 'style' => 'font-size: 0.8vw']); ?>
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
                        'style' => 'width: 15vw; font-size: 0.8vw',
                    ],
                ],
                [
                    'name'  => 'det_partida',
                    'title' => 'Partida',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 5vw; font-size: 0.8vw',
                    ],
                ],
                [
                    'name'  => 'det_cantidad',
                    'title' => 'Cantidad',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 5vw; font-size: 0.8vw',
                    ],
                ],
                [
                    'name'  => 'det_unidad',
                    'title' => 'Unidad',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 5vw; font-size: 0.8vw',
                    ],
                ],
                [
                    'name'  => 'det_descripcion',
                    'title' => 'Descripcion',
                    'type' => 'textarea',
                    'options'=> 
                    [
                        'style' => 'height: 70px; !important; width: 40vw; font-size: 0.8vw',
                    ],
                    'enableError' => true 
                ],
                [
                    'name'  => 'det_costo',
                    'title' => 'Costo',
                    'enableError' => true,
                    'options'=> 
                    [
                        'style' => 'width: 7vw; font-size: 0.8vw',
                        'placeholder' => '$0.00',
                    ],
                ]
            ]
        ])->label(false);
        ?>

    </div>

    <div class= 'row'>
        <?= $form -> field($model, 'req_fkper_subdirector') -> dropDownList(ArrayHelper::map($data1, "ID", "Nombre"),  ['style' => 'font-size: 0.8vw']) ?>
        <?= $form -> field($model, 'req_fkper_planeacion') -> dropDownList(ArrayHelper::map($data0, "ID", "Nombre"), ['style' => 'font-size: 0.8vw']) ?>
        <?= $form -> field($model, 'req_fkper_director') -> dropDownList(ArrayHelper::map($data2, "ID", "Nombre"), ['style' => 'font-size: 0.8vw']) ?>
    </div>

    <?= $form -> field($model, 'req_fkconfiguracion') -> hiddenInput(['value'=> 1])->label(false); ?><br>

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
} ?>

<?php 
$script = <<< JS
window.errorDet = [];

$('.multiple-input').on('afterInit', function() 
{
    if($('.list-cell__det_clave').find('input').val()!="")
    {
        $('.btn-success').click();

    }else{
        validateDetalles();
    }
    $('.list-cell__det_id').hide();
    $('#alert-id').find('.close').attr("data-dismiss","modal"); 


   
    $('#ModalDet').modal('show');
    setTimeout(function() {
            $('#ModalDet').modal('hide');
    }, 2500);

    $('#alert-det').find('.close').attr('data-dismiss','modal');



}).on('afterAddRow', function(e, row, currentIndex) 
{
    $('.list-cell__det_id').hide();

    var first = $('.js-input-plus').clone();
    var last = $('.js-input-remove').first().clone();
    $('.js-input-plus').replaceWith(last);
    $('.multiple-input-list__btn').first().replaceWith(first);

    validateDetalles();
 
}).on('beforeAddRow', function(e, row, currentIndex)
{
    if(errorDet.length!=0){
        return false;
    }
}).on('beforeDeleteRow', function(e, row, currentIndex)
{
    var conf;

    if ($(row).find('input').eq(1).val()== ""){
        conf = true;
    }
    else {
        conf =  confirm('¿Seguro que quieres eliminar esta fila?');
    }

    if(conf){
        $(row).find('input').each(
            function(index,det) {
              removeError($(det).attr('id'));
            }
        );
    }
    return conf;
});

//on change
function validateDetalles(){

    $("[id^='reqdetalle-temp']").on('change.yii',function(){
    var detalle =$(this).attr('id');

        if (detalle.includes('det_clave')){
            if($(this).val().length > 100)
            {

                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Clave  debería contener hasta 100 caracteres."]);
                addError(detalle);

            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('det_partida')){

            if($(this).val().length > 6)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Partida  debería contener hasta 6 caracteres."]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('det_cantidad')){
            
            if($(this).val().length > 14)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Cantidad debería contener hasta 14 numeros"]);
                addError(detalle);
            }else if (isNaN($(this).val())){
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Cantidad debería ser un numero sin simbolos"]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('det_unidad')){
            if($(this).val().length > 20)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Unidad debería contener hasta 20 caracteres"]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('det_descripcion')){
            if($(this).val().length > 5000)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Descripcion debería contener hasta 500 caracteres"]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }
        
        }
        if (detalle.includes('det_costo')){
            
            if($(this).val().length > 14)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Costo debería contener hasta 14 numeros"]);
                addError(detalle);
            }else if (isNaN($(this).val())){
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Costo debería ser un numero sin simbolos"]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }
        }

    });
}

function removeError(detalle){
    var index = errorDet.indexOf(detalle);
    
    if(index!=-1){
        errorDet.splice(index);
    }

}

function addError(detalle){
    var index = errorDet.indexOf(detalle);

    if(index==-1){
       errorDet.push(detalle);
    }

}



$('#requisicion-form').on('submit', function (e) {
   
    if(errorDet.length!=0){

        $('#ModalCenter').modal('toggle');
        
        setTimeout(function() {
            $('#ModalCenter').modal('hide');
        }, 2500);
        e.preventDefault();
        
        return false;
   }
 
}); 


JS;

$this->registerJs($script);

?>