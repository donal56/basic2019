<?php
    // http://basic2019.test/index.php?r=site/requisicion

    use yii\helpers\Html;
    use yii\widgets\ActiveForm;
    use yii\grid\GridView;
    use yii\helpers\ArrayHelper;
    use app\models\ReqArea;
    use app\models;
    use unclead\multipleinput\MultipleInput;
    use yii\db\Query;
    
    $this->title = 'Generar requisición';
?>

<?php $form = ActiveForm::begin(); ?>

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

    $query2 = $query ->where(['req_area.are_nivel' => '2']);
    $command = $query2->createCommand();
    $data2 = $command->queryAll();

    $query3 = $query ->where(['req_area.are_nivel' => '1']);
    $command = $query3->createCommand();
    $data3 = $command->queryAll();

    $query4 = $query ->where(['req_area.are_nivel' => '0']);
    $command = $query4->createCommand();
    $data4 = $command->queryAll();

    $query5 = new Query;
    $query5->select(['con_id as ID' , 'CONCAT("INSTITUTO TECNOLÓGICO DE ", con_instituto) as Instituto'])  
        ->from('req_configuracion');
    $command = $query5->createCommand();
    $data5 = $command->queryAll();
?>

<?= $form -> field($model, 'req_fechaEntrega') -> input('date', ['value' => date('Y-m-d'), ]); ?>
<?= $form -> field($model, 'req_folio'); ?>
<?= $form -> field($model, 'req_fkper_solicitante') -> dropDownList(ArrayHelper::map($data1, "ID", "Nombre")) ?>
<?= $form -> field($model, 'req_fechaSolicitud') -> input('date', ['value' => date('Y-m-d'), ]); ?>
<?= $form -> field($model, 'req_esoperativo') -> checkbox(['label' => '¿Es parte del presupuesto operativo anual?']); ?>
<?= $form -> field($model, 'req_justificacion') -> textarea(['label' => 'Justificación', 'rows' => 5]); ?>
<?= $form -> field($model, 'req_fkper_subdirector') -> dropDownList(ArrayHelper::map($data2, "ID", "Nombre")) ?>
<?= $form -> field($model, 'req_fkper_planeacion') -> dropDownList(ArrayHelper::map($data3, "ID", "Nombre")) ?>
<?= $form -> field($model, 'req_fkper_director') -> dropDownList(ArrayHelper::map($data4, "ID", "Nombre")) ?>
<?= $form -> field($model, 'req_fkconfiguracion') -> dropDownList(ArrayHelper::map($data5, "ID", "Instituto")) ?>


<?= 
    /*TODO: fechas, forma de agregar los campos, usuario concurrente*/

    $form->field($modelDet, 'det_id')->widget(MultipleInput::className(), 
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
            'name'  => 'req_cantidad',
            'title' => 'Cantidad'
            ],
            [
            'name'  => 'req_unidad',
            'title' => 'Unidad'
            ],
            [
            'name'  => 'req_descripcion',
            'title' => 'Descripcion'
            ],
            [
            'name'  => 'req_costo',
            'title' => 'Costo'
            ]
        ]
    ]);
?>



<?= Html::submitButton('Submit', ['class' => 'btn btn-success']); ?>

<?php ActiveForm::end() ?>