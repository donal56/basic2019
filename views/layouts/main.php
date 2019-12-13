<?php
use yii\helpers\Html;
use app\assets\ItvhAsset;
use app\assets\AppAsset;

AppAsset::register($this);
ItvhAsset::register($this);
?>

<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">

<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>

<body>
    <div class="wraper">
        <?php $this->beginBody() ?>

        <?php !Yii::$app->user->isGuest ?: require_once('lyt_header.php'); ?>
        <?php require_once('lyt_navbar.php'); ?>

        <?= $content ?>
        <div id=app>
        </div>
                
        <?php $this->endBody() ?>
    </div>
    <?php #require_once('lyt_footer.php'); ?>
</body>

</html>
<?php $this->endPage() ?>