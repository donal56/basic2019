<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ReqConfiguracion */

$this->title = 'Update Req Configuracion: ' . $model->con_id;
$this->params['breadcrumbs'][] = ['label' => 'Req Configuracions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->con_id, 'url' => ['view', 'id' => $model->con_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="req-configuracion-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
