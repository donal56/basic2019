<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboard */

$this->title = 'Actualizar Botón: ' . $model->nombre;
$this->params['breadcrumbs'][] = ['label' => 'Dashboard', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->nombre, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Actualizar';
?>
<div class="sws-dashboard-update">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>
    <br>

    <?= $this->render('_form', [
        'model'  => $model,
        'grupos' => $grupos,
        'roles'  => $roles,
    ]) ?>

</div>
