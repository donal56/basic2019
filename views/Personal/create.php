<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ReqPersonal */

$this->title = 'Create Req Personal';
$this->params['breadcrumbs'][] = ['label' => 'Req Personals', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="req-personal-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
