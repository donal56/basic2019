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

<?php 
$script = <<< JS

$('.multiple-input').on('afterInit', function(){
    $('.list-cell__det_id').hide();
}).on('afterAddRow', function(e, row, currentIndex) {
    var first = $('.js-input-plus').clone();
    var last = $('.js-input-remove').first().clone();
    $('.js-input-plus').replaceWith(last);
    $('.multiple-input-list__btn').first().replaceWith(first);

}).on('beforeDeleteRow', function(e, row, currentIndex){
    // row - HTML container of the current row for removal.
    // For TableRenderer it is tr.multiple-input-list__item
    console.log('calls on before remove row event.');
    return confirm('¿Seguro que quieres eliminar esta fila?')
});

JS;

$this->registerJs($script);

?>
