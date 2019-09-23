<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\ReqPersonal;
use app\models\User;

/* @var $this yii\web\View */
/* @var $model app\models\ReqPersonal */

$this->title = $model->per_nombre . " " . $model->per_paterno . " " . $model->per_materno;
$this->params['breadcrumbs'][] = ['label' => 'Personas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-personal-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
    <?= Html::a('', '/req-personal', ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Actualizar', ['update', 'id' => $model->per_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->per_id], [
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
            'per_id',
            'per_titulo',
            'per_nombre',
            'per_paterno',
            'per_materno',
            [
                'attribute' => 'per_fkuser',
                'format'    => 'raw',
                'value'     => function ($model) {
                    return $model-> fillUserName($model->per_fkuser);
                }
            ],
        ],

    ]) ?>

</div>
