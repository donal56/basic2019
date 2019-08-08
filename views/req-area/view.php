<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\ReqArea */

$this->title = $model->are_id;
$this->params['breadcrumbs'][] = ['label' => 'Areas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-area-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('', '/req-area', ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Update', ['update', 'id' => $model->are_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->are_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estas seguro de seguro de eliminar este elemento?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'are_id',
            'are_nivel',
            'are_nombre',
            'are_fkper_responsable',
            'are_fkper_superior',
        ],
    ]) ?>

</div>
