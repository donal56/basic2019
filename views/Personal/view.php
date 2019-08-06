<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\ReqPersonal */

$this->title = $model->per_id;
$this->params['breadcrumbs'][] = ['label' => 'Req Personals', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-personal-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->per_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->per_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'per_id',
            'per_nombre',
            'per_paterno',
            'per_materno',
            'per_fkuser',
        ],
    ]) ?>

</div>
