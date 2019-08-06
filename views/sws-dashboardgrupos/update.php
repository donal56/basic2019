<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboardgrupos */

$this->title = 'Actualizar Categoría: ' . $model->gpo_nombre;
$this->params['breadcrumbs'][] = ['label' => 'Categorías', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->gpo_nombre, 'url' => ['view', 'id' => $model->gpo_id]];
$this->params['breadcrumbs'][] = 'Actualizar';
?>
<div class="sws-dashboardgrupos-update">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>
    <br>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
