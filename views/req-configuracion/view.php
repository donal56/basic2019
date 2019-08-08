<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\ReqConfiguracion */

$this->title = $model->con_id;
$this->params['breadcrumbs'][] = ['label' => 'Configuraciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-configuracion-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('', '/req-configuracion', ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Update', ['update', 'id' => $model->con_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->con_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estas seguro de seguro de eliminar este elemento?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'con_id',
            'con_instituto',
            'con_logo',
            'con_revision',
        ],
    ]) ?>

</div>
