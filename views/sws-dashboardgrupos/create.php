<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SwsDashboardgrupos */

$this->title = 'Crear Categoría';
$this->params['breadcrumbs'][] = ['label' => 'Categorías', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sws-dashboardgrupos-create">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>
    <br>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
