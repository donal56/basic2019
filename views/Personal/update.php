<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ReqPersonal */

$this->title = 'Update Req Personal: ' . $model->per_id;
$this->params['breadcrumbs'][] = ['label' => 'Req Personals', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->per_id, 'url' => ['view', 'id' => $model->per_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="req-personal-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
