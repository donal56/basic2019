<?php

namespace app\controllers;

use Yii;
use app\models\ReqDetalle;
use app\models\ReqDetalleSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DetalleController implements the CRUD actions for ReqDetalle model.
 */
class ReqDetalleController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all ReqDetalle models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ReqDetalleSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ReqDetalle model.
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
     * Creates a new ReqDetalle model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        
        $model = new ReqDetalle();
       
        if($_POST['_csrf']!=""){
            print("<pre>".print_r(Yii::$app->request->post(),true)."</pre>");
            for ($i=0; $i < count(Yii::$app->request->post()['ReqDetalle']['temp']); $i++) { 

                $data['_csrf'] =  Yii::$app->request->post()['_csrf'];

                $data['ReqDetalle'] = Yii::$app->request->post()['ReqDetalle']['temp'][$i];
                $data['ReqDetalle']['det_fkrequisicion']=1;

                if ($model->load($data) && $model->save()) {
                    $model = new ReqDetalle();    
                } else {
                    throw new NotFoundHttpException('A OCCURIDO UN ERROR.');
                }
            }

        }else{

           return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing ReqDetalle model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
       // 
        $model = new ReqDetalle();

        $model['temp'] = $this->findAllDetalle($id);
         
          if($_POST['_csrf']!=""){ 

            for ($i=0; $i < count(Yii::$app->request->post()['ReqDetalle']['temp']); $i++) { 

                $data['_csrf'] =  Yii::$app->request->post()['_csrf'];

                $data['ReqDetalle'] = Yii::$app->request->post()['ReqDetalle']['temp'][$i];
                $data['ReqDetalle']['det_fkrequisicion']=$id;
                $model = $this->findModel($data['ReqDetalle']['det_id']);
                
                if ($model->load($data) && $model->save()) {
                    $model = new ReqDetalle();    
                } else {
                    throw new NotFoundHttpException('A OCCURIDO UN ERROR.');
                }
            }

          } else{
             return $this->render('update', [
                'model' => $model,
            ]);
          }

   /*     if ($model->load(Yii::$app->request->post()) && $model->save()) {
           return $this->redirect(['view', 'id' => $model->det_id]);
        } else {
        
        
        }  */ 
    }

    /**
     * Deletes an existing ReqDetalle model.
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
     * Finds the ReqDetalle model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ReqDetalle the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ReqDetalle::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    protected function findAllDetalle($id)
    {
        if (($model = ReqDetalle::find()->where(['det_fkrequisicion' => $id])->asArray()->all()) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
