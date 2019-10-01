<?php
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\helpers\Html;
?>

<?php
setlocale(LC_ALL, "es_MX");

NavBar::begin([
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar navbar-default tecnm-navbar',
        'style' => 'margin-bottom:1em',
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
    $menuItems[] = 
    [
      'label' => utf8_encode(strftime("%a, %e de %b de %Y"))
    ];
  $menuItems[] = ['label' => 'Administrador', 'items'=>UserManagementModule::menuItems()];
  $menuItems[] = 
  [
    'label' => 'Cerrar Sesión (' . Yii::$app->user->identity->username . ')',
    'url' => ['/user-management/auth/logout'],
    'linkOptions' => ['data-method' => 'post'],
  ];
  
  $tecnm[] = 
  [
    'label' => Html::a(Html::img('@web/img/tecnm.png', ['alt' => 'Logo', 'height' => '50']), 'https://tecnm.mx/')
  ];
  $itvh[] = 
  [
    'label' => Html::a(Html::img('@web/img/itvh.png', ['alt' => 'Logo', 'height' => '40']), 'http://villahermosa.tecnm.mx/')
  ];

  echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-left', 'id' => 'nav-img-left'],
    'encodeLabels' => false,
    'items' => $tecnm,
  ]);

  echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-right', 'id' => 'nav-img-right', 'style' => 'margin-right: 45px'],
    'encodeLabels' => false,
    'items' => $itvh,
  ]);

}

echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-center', 'style' => 'padding: 15px'],
    'encodeLabels' => false,
    'items' => $menuItems,
]);

NavBar::end();

$this->registerCss('.navbar .nav>li>a { 
  padding: .3em 2em .3em .1em;
  background-color: unset !important;
} ');
?>
