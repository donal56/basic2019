<?php

namespace app\controllers;

use Yii;
use app\models\SwsDashboard;
use app\models\SwsDashboardgrupos;
use app\models\SwsDashboardSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use webvimark\modules\UserManagement\models\User;
use webvimark\modules\UserManagement\models\rbacDB\Role;
use yii\helpers\ArrayHelper;

/**
 * SwsDashboardController implements the CRUD actions for SwsDashboard model.
 */
class SwsDashboardController extends Controller
{
    public $freeAccessActions = ['contador'];

    public function behaviors()
    {    
         return [
            'ghost-access' => [
                'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
            ],
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
            ],*/
        ];
        
        
    }

    /**
     * @inheritdoc
     */
    public function actionIndex()
    {
        $searchModel  = new SwsDashboardSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $categorias   = ArrayHelper::map(SwsDashboardgrupos::find()->orderBy('gpo_nombre')->all(), 'gpo_nombre', 'gpo_nombre');

        return $this->render('index', [
            'searchModel'  => $searchModel,
            'dataProvider' => $dataProvider,
            'categorias'   => $categorias,
        ]);
    }

    /**
     * Displays a single SwsDashboard model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new SwsDashboard model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model      = new SwsDashboard();
        $grupos     = ArrayHelper::map(SwsDashboardgrupos::find()->orderBy('gpo_nombre')->all(), 'gpo_id', 'gpo_nombre');
        $roles      = ArrayHelper::map(Role::find()->all(),'name', 'description');
        if ($model->load(Yii::$app->request->post())) {
            if      ($model->status == 1){
                $model->url = '/sws-dashboard/submenu/?gpo='.$model->fkgrupo.'&prv=0';
            } elseif($model->status == 3){
                $model->url = '/sws-dashboard/submenu/?gpo='.$model->grupo.'&prv='.$model->fkgrupo;
            }
            $model->rol   =  implode(',', $model->asignados);
            $model->save();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model'      => $model,
                'grupos'     => $grupos,
                'roles'      => $roles,
            ]);
        }
    }

    public function actionContador($id)
    {
        return SwsDashboard::find()->where(['fkgrupo'=>$id])->count()+1;
    }

    /**
     * Updates an existing SwsDashboard model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model            = $this->findModel($id);
        $grupos           = ArrayHelper::map(SwsDashboardgrupos::find()->orderBy('gpo_nombre')->all(), 'gpo_id', 'gpo_nombre');
        $roles            = ArrayHelper::map(Role::find()->all(),'name', 'description');
        $roles['Todos']   = 'Todos';
        $model->asignados =  explode(',', $model->rol);

        if ($model->load(Yii::$app->request->post())) {
            if      ($model->status == 1){
                $model->url = '/sws-dashboard/submenu/?gpo='.$model->fkgrupo.'&prv=0';
            } elseif($model->status == 3){
                $model->url = '/sws-dashboard/submenu/?gpo='.$model->grupo.'&prv='.$model->fkgrupo;
            }
            $model->rol   =  implode(',', $model->asignados);
            $model->save();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model'     => $model,
                'grupos'    => $grupos,
                'roles'     => $roles,
            ]);
        }
    }

    /**
     * Deletes an existing SwsDashboard model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the SwsDashboard model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return SwsDashboard the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = SwsDashboard::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

	public function actionSubmenu($gpo=null,$prv=null)
    {
        if(isset($gpo) && $gpo!=''){
           Yii::$app->SESSION['gpo'] = $gpo;
            if(isset($prv) && $prv!=''){
               Yii::$app->SESSION['prv'] = $prv;
            }
        }

        return $this->redirect(['/site/index']);
    }
}