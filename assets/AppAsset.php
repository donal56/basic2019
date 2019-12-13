<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Main application asset bundle.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = 
    [
        'css/site.css',
        'css/google.fonts.roboto.css',
        'css/google.fonts.material.icons.css',
        'css/font-awesome.css',
        'css/chunk.css',
        'css/vuetify.css',
        'css/vuetify-material-dashboard.css',
        'css/bigchunk.css',
    ];
    public $js = 
    [
        // 'js/user_profile.js',
        // 'js/table_list.js',
        // 'js/dashboard.js',
        // 'js/upgrade.js',
        // 'js/icons.js',
        // 'js/maps.js',
        // 'js/script7.js',
        // 'js/notificaciones.js',
        'js/template.js',

        #Important JS
        'js/vuetify-material-dashboard2.js',
        'js/exports.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];

    public $jsOptions = ['position' => \yii\web\View::POS_END];
}