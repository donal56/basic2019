<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboard */

$this->title = 'Crear Botón';
$this->params['breadcrumbs'][] = ['label' => 'Dashboard', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sws-dashboard-create">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>
    <br>

    <?= $this->render('_form', [
        'model'      => $model,
        'grupos'     => $grupos,
        'roles'      => $roles,

    ]) ?>

</div>
