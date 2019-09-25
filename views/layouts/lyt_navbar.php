<?php
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\helpers\Html;
?>

<?php
setlocale(LC_TIME, "es_MX");

NavBar::begin([
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar navbar-default tecnm-navbar',
    ],
]);

$menuItems = [
    ['label' => '<span class="glyphicon glyphicon-home"></span>', 'url' => ['/site/index']],
];
if (Yii::$app->user->isGuest) {
  $menuItems[] = ['label' => 'Iniciar Sesión', 'url' => ['/user-management/auth/login']];
} 
else 
{  
  //Agregar opciones de administrador
  //if(Yii::$app->user->identity->hasRole('Admin')):
  $menuItems[] = ['label' => 'Administrador', 'items'=>UserManagementModule::menuItems()];
  $menuItems[] = 
  [
    'label' => 'Cerrar Sesión (' . Yii::$app->user->identity->username . ')',
    'url' => ['/user-management/auth/logout'],
    'linkOptions' => ['data-method' => 'post'],
  ];
  $menuItems[] = 
  [
    'label' => utf8_encode(strftime("%A, %e de %B de %Y"))
  ];

  $tecnm[] = 
  [
    'label' => Html::img('@web/img/tecnm.png', ['alt' => 'Logo', 'height' => '60'])
  ];
  $itvh[] = 
  [
    'label' => Html::img('@web/img/itvh.png', ['alt' => 'Logo', 'height' => '48'])
  ];


}

echo Nav::widget([
  'options' => ['class' => 'navbar-nav navbar-left'],
  'encodeLabels' => false,
  'items' => $tecnm,
]);

echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-left', 'style' => 'vertical-align: middle'],
    'encodeLabels' => false,
    'items' => $menuItems,
]);

echo Nav::widget([
  'options' => ['class' => 'navbar-nav navbar-right'],
  'encodeLabels' => false,
  'items' => $itvh,
]);

NavBar::end();
?>
