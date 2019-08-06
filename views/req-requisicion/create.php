<?php


use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */

$this->title = 'Generar requisición';
$this->params['breadcrumbs'][] = ['label' => 'Requisiciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requisicion-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>   