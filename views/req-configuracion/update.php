<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ReqConfiguracion */

$this->title = 'Actualizar configuración ' . $model->con_id;
$this->params['breadcrumbs'][] = ['label' => 'Configuraciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->con_id, 'url' => ['view', 'id' => $model->con_id]];
$this->params['breadcrumbs'][] = 'Actualizar';
?>
<div class="req-configuracion-update">
    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
