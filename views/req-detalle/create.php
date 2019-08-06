<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ReqDetalle */

$this->title = 'Create Req Detalle';
$this->params['breadcrumbs'][] = ['label' => 'Req Detalles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-detalle-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
