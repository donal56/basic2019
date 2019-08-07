<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use unclead\multipleinput\MultipleInput;
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

    $query2 = new Query;
    $query2  ->select([ 'req_area.are_id as ID' , 
        'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre '])  
        ->from('req_area')
        ->join('INNER JOIN', 'req_personal', 'req_area.are_fkper_responsable = req_personal.per_id');
    
    $data2 = $query2 ->where(['req_area.are_nivel' => '2']) -> createCommand() -> queryAll();
    $data3 = $query2 ->where(['req_area.are_nivel' => '1']) -> createCommand() -> queryAll();
    $data4 = $query2 ->where(['req_area.are_nivel' => '0']) -> createCommand() -> queryAll();

    $query3 = new Query;
    $data5 = $query3->select(['con_id as ID' , 'CONCAT("INSTITUTO TECNOLÓGICO DE ", con_instituto) as Instituto'])->from('req_configuracion')->createCommand()->queryAll();
?>

<div class="requisicion-form">

    <?php $form = ActiveForm::begin(['fieldConfig' => ['options' => ['class' => 'col-md-3']]]); ?>
    
    <?= $form -> field($model, 'req_fecha') -> input('date', ['value' => date('Y-m-d')]); ?>    
    <?= $form -> field($model, 'req_folio'); ?>
    <?= $form -> field($model, 'req_fkper_solicitante') -> dropDownList(ArrayHelper::map($data1, "ID", "Nombre"), 
    ['readonly' => true]); ?>
    <?= $form -> field($model, 'req_fechaSolicitante') -> input('date', ['value' => date('Y-m-d')]); ?>
    <?= $form -> field($model, 'req_esoperativo') -> checkbox(['label' => '¿Es parte del presupuesto operativo anual?']); ?>
    <?= $form -> field($model, 'req_justificacion') -> textarea(['label' => 'Justificación', 'rows' => 5]); ?>
    <?= $form -> field($model, 'req_fkper_subdirector') -> dropDownList(ArrayHelper::map($data2, "ID", "Nombre")) ?>
    <?= $form -> field($model, 'req_fkper_planeacion') -> dropDownList(ArrayHelper::map($data3, "ID", "Nombre")) ?>
    <?= $form -> field($model, 'req_fkper_director') -> dropDownList(ArrayHelper::map($data4, "ID", "Nombre")) ?>
    <?= $form -> field($model, 'req_fkconfiguracion') -> dropDownList(ArrayHelper::map($data5, "ID", "Instituto")) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
