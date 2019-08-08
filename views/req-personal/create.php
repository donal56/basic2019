<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ReqPersonal */

$this->title = 'Crear Personal';
$this->params['breadcrumbs'][] = ['label' => 'Personas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-personal-create">
    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
