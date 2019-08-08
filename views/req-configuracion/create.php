<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ReqConfiguracion */

$this->title = 'Crear configuración';
$this->params['breadcrumbs'][] = ['label' => 'Configuraciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-configuracion-create">
    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
