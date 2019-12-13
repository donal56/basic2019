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
    <?php $this->beginBody() ?>

    <div class="very-main-content" style= "max-width: calc(100% - 260px); float: right;">
        <?= $content ?>
    </div>

    <div id=app>
    </div>


    <?php //!Yii::$app->user->isGuest ?: require_once('lyt_header.php'); ?>
    <?php //require_once('lyt_navbar.php'); ?>

    <?php #require_once('lyt_footer.php'); ?>

    <?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>