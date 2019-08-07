<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use unclead\multipleinput\MultipleInput;
use yii\db\Query;

use yii\bootstrap\Modal;


/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */
/* @var $form yii\widgets\ActiveForm */

 $query = new Query;
    $query  ->select([
        'req_area.are_id as ID' , 
        'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre ']
        )  
        ->from('req_area')
        ->join('INNER JOIN', 'req_personal',
            'req_area.are_fkper_responsable = req_personal.per_id');

    $command = $query->createCommand();
    $data1 = $command->queryAll();

    $data2 = $query ->where(['req_area.are_nivel' => '2'])->createCommand()->queryAll();

    $data3 = $query ->where(['req_area.are_nivel' => '1'])
        ->createCommand()->queryAll();

    $data4 = $query ->where(['req_area.are_nivel' => '0'])
        ->createCommand()->queryAll();;

    $query = new Query;
    $data5 = $query->select(['con_id as ID' , 'CONCAT("INSTITUTO TECNOLÓGICO DE ", con_instituto) as Instituto'])->from('req_configuracion')->createCommand()->queryAll();


?>

<div class="requisicion-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form -> field($model, 'req_fecha') -> input('date', ['value' => date('Y-m-d'), ]); ?>
    <?= $form -> field($model, 'req_folio'); ?>
    <?= $form -> field($model, 'req_fkper_solicitante') -> dropDownList(ArrayHelper::map($data1, "ID", "Nombre")) ?>
    <?= $form -> field($model, 'req_fechaSolicitante') -> input('date', ['value' => date('Y-m-d'), ]); ?>
    <?= $form -> field($model, 'req_esoperativo') -> checkbox(['label' => '¿Es parte del presupuesto operativo anual?']); ?>
    <?= $form -> field($model, 'req_justificacion') -> textarea(['label' => 'Justificación', 'rows' => 5]); ?>
    <?= $form -> field($model, 'req_fkper_subdirector') -> dropDownList(ArrayHelper::map($data2, "ID", "Nombre")) ?>
    <?= $form -> field($model, 'req_fkper_planeacion') -> dropDownList(ArrayHelper::map($data3, "ID", "Nombre")) ?>
    <?= $form -> field($model, 'req_fkper_director') -> dropDownList(ArrayHelper::map($data4, "ID", "Nombre")) ?>
    <?= $form -> field($model, 'req_fkconfiguracion') -> dropDownList(ArrayHelper::map($data5, "ID", "Instituto")) ?>

 <?= $form->field($model, 'det_id')->widget(MultipleInput::className(), 
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

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 
        $searchModel = new app\models\ReqDetalleSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

echo Yii::$app->controller->renderPartial('//req-detalle/index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);

  $modal = Modal::begin([

            'header' => '<h2>DETALLES</h2>',

            'toggleButton' => ['label' => 'click me'],

            ]);


              
echo "<div id='modalContent'>";

$detalle = new app\models\ReqDetalle();

        if ($detalle->load(Yii::$app->request->post()) && $detalle->save()) {
            echo Yii::$app->controller->redirect(['view', 'id' => $detalle->det_id]);
        } else {
            echo Yii::$app->controller->render('create', [
                'model' => $detalle,
            ]);
        }

echo "</div>";


        

        Modal::end(); 
 ?>