<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ConfiguracionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Configuración';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-configuracion-index">

    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'layout' => '{items}',
        'columns' => [
            'con_id',
            'con_instituto',
            [
                'label' => 'Logo',
                'attribute' => 'con_logo',
                'format' => 'raw',
                'value' => function ($data) 
                {
                    return Html::img($data->con_logo, ['alt'=>'Logo', 'height'=>'120']);
                }
            ],
            'con_revision', 
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update}',
            ],
        ],
    ]); ?>
</div>
