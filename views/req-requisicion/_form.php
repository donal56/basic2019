<?php
use yii\helpers\Html;
use kartik\alert\Alert;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use unclead\multipleinput\MultipleInput;
use kartik\date\DatePicker;
use yii\db\Query;
use app\components\SWS_API;
use app\models\ReqConfiguracion;
use webvimark\modules\UserManagement\models\User;

/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */
/* @var $form yii\widgets\ActiveForm */
?>
<br>
<div class="requisicion-form">


    <?php $form = ActiveForm::begin(['id' => 'requisicion-form', 'validateOnSubmit' => false]); ?>

    <div class= 'row'>
        
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
        <?= $form -> field($model, 'req_justificacion',['options' => ['class' => 'form-group col-sm-12']]) -> textarea(['label' => 'Justificación', 'rows' => 3, 'placeholder' => 'LO ANTERIOR PARA SER UTILIZADO EN LA ACCIÓN:', 'style' => 'font-size: 0.9em']); ?>
    </div>
        
    <div class="row req-detalle-form col-sm-12" >

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
                        'style' => 'height: 70px; width: 48.5em; font-size: 0.9em',
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

        //si el modelo se actualiza y existen nuevos cargos
        if(!$model->isNewRecord && $nuevosCargos)
        {
             //Si el usuario actual es superadmin, no verificar nuevos cargos a menos de que el sea el solicitante
            if (User::findOne(Yii::$app->user->identity->id)->superadmin)
            {
                if (User::findOne($model->req_fkuse_solicitante)->rfc == User::findOne(Yii::$app->user->identity->id)->rfc)
                {
                    alertCambios($model, $nuevosCargos);
                }
            }
            else 
            {
                alertCambios($model, $nuevosCargos);
            }
            
        }

        function alertCambios($model, $nuevosCargos)
        {
            Alert::begin([
                'options' => [
                    'class' => 'alert-info col-sm-12',
                    'id' => 'alertFirmas'
                ],
            ]);
            
            //IDs de usuario
            $a = $nuevosCargos['superior'];
            $b = $nuevosCargos['planeacion'];
            $c = $nuevosCargos['director'];

            //nombres;
            $old1 = SWS_API::buscarNombre(User::findOne($model->req_fkuse_subdirector)->rfc);
            $old2 = SWS_API::buscarNombre(User::findOne($model->req_fkuse_planeacion)->rfc);
            $old3 = SWS_API::buscarNombre(User::findOne($model->req_fkuse_director)->rfc);

            //nombres
            $new1 = SWS_API::getSuperior()[2];
            $new2 = SWS_API::getJefePlaneacion()[2];
            $new3 = SWS_API::getDirector()[2];

            echo <<<LABEL
            <span class="glyphicon glyphicon-info-sign"></span>
            <b>Se han actualizado algunos datos de las firmas.</b> ¿Desea realizar los cambios?
            <a style= "cursor: pointer" onclick= "actualizarFirmas($a ,$b ,$c)"> Actualizar</a><br><br>     
LABEL;

            if ($a != $model->req_fkuse_subdirector) 
                echo 'SUBDIRECTOR: ' . $old1 . ' => ' . $new1 . '<br>';
            if ($b != $model->req_fkuse_planeacion)
                echo 'JEFE DE PLANEACIÓN: ' . $old2 . ' => ' . $new2 . '<br>';
            if ($c != $model->req_fkuse_director)
                echo 'DIRECTOR: ' . $old3 . ' => ' . $new3 . '<br>';
            
            Alert::end();
        }
    ?>
  
    <?= $form -> field($model, 'req_fkuse_solicitante',['options' => ['class' => '']]) -> hiddenInput(['value' => $model->isNewRecord ? SWS_API::getID() : $model->req_fkuse_solicitante])->label(false); ?>
    <?= $form -> field($model, 'req_fkuse_subdirector',['options' => ['class' => '']]) -> hiddenInput(['id' => 'fSuperior', 'value' => $model->isNewRecord ? SWS_API::getSuperior()[3] : $model->req_fkuse_subdirector])->label(false) ?>
    <?= $form -> field($model, 'req_fkuse_planeacion',['options' => ['class' => '']]) -> hiddenInput(['id' => 'fPlaneacion', 'value' => $model->isNewRecord ?SWS_API::getJefePlaneacion()[3] : $model->req_fkuse_planeacion])->label(false) ?>
    <?= $form -> field($model, 'req_fkuse_director',['options' => ['class' => '']]) -> hiddenInput(['id' => 'fDirector', 'value' =>  $model->isNewRecord ? SWS_API::getDirector()[3]  : $model->req_fkuse_director])->label(false) ?>

    <?= $form -> field($model, 'req_fkconfiguracion',['options' => ['class' => '']]) -> hiddenInput(['value'=> ReqConfiguracion::find()->one()->con_id])->label(false); ?><br>

    <div class="row form-group col-md-3">
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