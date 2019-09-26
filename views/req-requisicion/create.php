<?php


use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Requisicion */

$this->title = 'GENERAR REQUISICIÓN';
$this->params['breadcrumbs'][] = ['label' => 'Requisiciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requisicion-create">
    <h3><?= Html::encode($this->title) ?></h3><hr>
    <?= $this->render('_form', [
        'model' => $model,
        'modeldet' => $modeldet,
    ]) ?>

</div>   
<?php 
$this->registerCssFile("../css/req.css");
 ?>
