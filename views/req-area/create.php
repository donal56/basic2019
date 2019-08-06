<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use app\models\ReqArea;
use yii\db\Query;


/* @var $this yii\web\View */
/* @var $model app\models\ReqArea */
	$this->title = "Crear Área";
    $this->params['breadcrumbs'][] = ['label' => 'Área', 'url' => ['index']];
    $this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-area-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>




