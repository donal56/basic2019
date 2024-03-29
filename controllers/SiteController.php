<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\SwsDashboard;
use webvimark\modules\UserManagement\models\User;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {    
         return [
            'ghost-access' => [
                'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
            ],
        ];
        /*return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => false,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];*/
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function beforeAction($action)
    {
        if ($action->id == 'index') {
            $this->enableCsrfValidation = false;
        }
        return parent::beforeAction($action);
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        // $gpo = null;
        // $prv = null;
        // if(isset(Yii::$app->SESSION['gpo'])) 
        // {
        //     $gpo = Yii::$app->SESSION['gpo'];
        //     unset(Yii::$app->SESSION['gpo']);
        //     if(isset(Yii::$app->SESSION['prv'])) 
        //     {
        //         $prv = Yii::$app->SESSION['prv'];
        //         unset(Yii::$app->SESSION['prv']);
        //     }
        // }

        // $botones = SwsDashboard::botones($gpo,$prv);

        if(!Yii::$app->user->isGuest) 
        {
            // return $this->render('index',['botones' => $botones]);
            return $this->redirect('/req-requisicion/index');
        }
        return $this->redirect('site/login');
    }

    public function actionDash()
    {
        return $this->render('dashboardPrincipal');
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
		if (!Yii::$app->user->isGuest) {
           //return $this->goHome();
           return $this->redirect('site/login');
        }

        $model = new LoginForm();
		
		if ($model->load(Yii::$app->request->post()) && $model->login()) {
		    return $this->goBack();
        }
		
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    // public function actionContact()
    // {
    //     $model = new ContactForm();
    //     if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
    //         Yii::$app->session->setFlash('contactFormSubmitted');

    //         return $this->refresh();
    //     }
    //     return $this->render('contact', [
    //         'model' => $model,
    //     ]);
    // }

    /**
     * Displays about page.
     *
     * @return string
     */
 
    public function actionAcceso()
    {
        return $this->render('acceso');
    }
}
