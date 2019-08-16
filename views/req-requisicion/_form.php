<?php
use yii\helpers\Html;
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
    $data1 = $query1 -> createCommand() -> queryAll();

    $query0 = new Query;
    $query0 -> select(['are_fkper_superior']) -> from('req_area') -> where(['are_fkper_responsable' => $data1[0]['ID']]);
    $data0 = $query0 -> createCommand() -> queryAll();

    $query2 = new Query;
    $query2  ->select([ 'req_area.are_id as ID' , 
        'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre '])  
        ->from('req_area')
        ->join('INNER JOIN', 'req_personal', 'req_area.are_fkper_responsable = req_personal.per_id');
    
    $data2 = $query2 -> where(['req_area.are_nivel' => '2']) -> andWhere(['req_area.are_fkper_responsable' => $data0[0]['are_fkper_superior']]) -> createCommand() -> queryAll();
    $data3 = $query2 ->where(['req_area.are_nivel' => '1']) -> createCommand() -> queryAll();
    $data4 = $query2 ->where(['req_area.are_nivel' => '0']) -> createCommand() -> queryAll();

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
    },
]); ?>
    <div class= 'row' style= 'margin-top: 1.0em'>
        <?php

            echo $form->field($model, 'req_fecha') -> widget(DatePicker::classname(), 
            [
                'options' => ['value' => $model->isNewRecord ? date('Y-m-d') :  $model -> req_fecha],
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
        <?= $form -> field($model, 'req_folio'); ?>
        <?= $form -> field($model, 'req_fkper_solicitante') -> dropDownList(ArrayHelper::map($data1, "ID", "Nombre"), ['readonly' => true]); ?>
        <?php
            echo $form->field($model, 'req_fechasolicitante') -> widget(DatePicker::classname(), 
            [
                'options' => ['value' => $model->isNewRecord ? date('Y-m-d') :  $model -> req_fecha],
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
        <?= $form ->field($model, 'req_esoperativo') -> checkbox(['labelOptions' => ['class' => 'text-justify']]); ?>
   

    </div>

    <div class= 'row'>
        <?= $form -> field($model, 'req_justificacion') -> textarea(['label' => 'Justificación', 'rows' => 2, 'placeholder' => 'LO ANTERIOR PARA SER UTILIZADO EN LA ACCIÓN:']); ?>
    </div>
        
    <div class="row req-detalle-form">

        <?= $form->field($modeldet,'temp')->widget(MultipleInput::className(), 
        [
            'allowEmptyList'    => false,
            'addButtonPosition' => MultipleInput::POS_ROW,
            'addButtonOptions' => [
            'class' => 'btn btn-success',
            'label' => '<i class="glyphicon glyphicon-plus"></i>' 
            ],
            'prepend'   => true,
            'sortable' => false,
            'columns' => 
            [
                [
                    'name'  => 'det_id',
                    'title' => 'ID'
                ],
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
                    'title' => 'Descripcion',
                    'type' => 'textarea',
                    'options'=> [
                        'style' => 'height:34px; !important;'
                    ]
                  
                ],
                [
                    'name'  => 'det_costo',
                    'title' => 'Costo'
                ]
            ]
        ])->label(false);
        ?>

    </div>

    <div class= 'row'>
        <?= $form -> field($model, 'req_fkper_subdirector') -> dropDownList(ArrayHelper::map($data2, "ID", "Nombre")) ?>
        <?= $form -> field($model, 'req_fkper_planeacion') -> dropDownList(ArrayHelper::map($data3, "ID", "Nombre")) ?>
        <?= $form -> field($model, 'req_fkper_director') -> dropDownList(ArrayHelper::map($data4, "ID", "Nombre")) ?>
    </div>

    <?= $form -> field($model, 'req_fkconfiguracion') -> hiddenInput(['value'=> 1])->label(false); ?><br>

    <div class="row form-group col-md-3" style= 'margin-top: 1.0em'>
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Cancelar', '/req-requisicion', ['Class' => 'btn btn-danger']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>


<?php 
$script = <<< JS

$('.multiple-input').on('afterInit', function() 
{
    if($('.list-cell__det_clave').find('input').val()!="")
    {
        $('.btn-success').click();
    }
    $('.list-cell__det_id').hide();
}).on('afterAddRow', function(e, row, currentIndex) 
{
    $('.list-cell__det_id').hide();

    var first = $('.js-input-plus').clone();
    var last = $('.js-input-remove').first().clone();
    $('.js-input-plus').replaceWith(last);
    $('.multiple-input-list__btn').first().replaceWith(first);

}).on('beforeDeleteRow', function(e, row, currentIndex)
{
    if ($(row).find('input').eq(1).val()== "")
        return true;
    else 
        return confirm('¿Seguro que quieres eliminar esta fila?');
});

/*
.on('beforeAddRow', function(e, row, currentIndex)
{
    var clave = $('.multiple-input').find('td.list-cell__det_clave:first').find('input[type=text]').val();
    var partida = $('.multiple-input').find('td.list-cell__det_partida:first').find('input[type=text]').val();
    var cantidad = $('.multiple-input').find('td.list-cell__det_cantidad:first').find('input[type=text]').val();
    var unidad = $('.multiple-input').find('td.list-cell__det_unidad:first').find('input[type=text]').val();
    var descripcion = $('.multiple-input').find('td.list-cell__det_descripcion:first').find('input[type=text]').val();
    var costo = $('.multiple-input').find('td.list-cell__det_costo:first').find('input[type=text]').val();
    var mensaje= "Se han encontrado los siguientes errores: \n";
    var esCorrecto= true;

    if(clave.length > 30)
    {
        mensaje+= "La clave debe ser menor o igual a 30 caracteres.\n";
        esCorrecto= false;
    }
    
    if(partida.length > 6)
    {
        mensaje+= "La partida debe ser menor o igual a 6 caracteres.\n";
        esCorrecto= false;
    }

    if(cantidad.length > 14 || !isFloat(cantidad))
    {
        mensaje+= "La cantidad debe ser un numero de hasta 2 decimales.\n";
        esCorrecto= false;
    }

    if(unidad.length > 20)
    {
        mensaje+= "La unidad debe ser menor o igual a 20 caracteres.\n";
        esCorrecto= false;
    }

    if(descripcion.length > 500)
    {
        mensaje+= "La descripción debe ser menor o igual a 500 caracteres.\n";
        esCorrecto= false;
    }

    if(costo.length > 14 || !isFloat(costo))
    {
        mensaje+= "El costo debe ser un numero de hasta 2 decimales.\n";
        esCorrecto= false;
    }

    alert(mensaje);
    console.log(mensaje);
    console.log(esCorrecto);
    return esCorrecto;
});

function isFloat(n)
{
    //No puede ser una cadena vacia
    n= parseFloat(n);
    return Number(n) === n;
}

*/

JS;

$this->registerJs($script);

?>
