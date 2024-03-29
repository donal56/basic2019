<?php

namespace app\controllers;

use Yii;
use app\models\ReqConfiguracion;
use app\models\ReqConfiguracionSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * ConfiguracionController implements the CRUD actions for ReqConfiguracion model.
 */
class ReqConfiguracionController extends Controller
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
            'access' =>  
            [ 
 
                'class' => \yii\filters\AccessControl::className(), 
                'only' => ['index','update'], 
                'rules' =>  
                [ 
                    // allow authenticated users
                    [ 
                        'allow' => true, 
                        'roles' => ['@'], 
                    ], 
                    // everything else is denied 
                ], 
            ],
        ];
    }

    /**
     * Lists all ReqConfiguracion models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ReqConfiguracionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ReqConfiguracion model.
     * @param integer $id
     * @return mixed
     */
    // public function actionView($id)
    // {
    //     return $this->render('view', [
    //         'model' => $this->findModel($id),
    //     ]);
    // }

    /**
     * Creates a new ReqConfiguracion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    // public function actionCreate()
    // {
    //     $model = new ReqConfiguracion();

    //     if ($model->load(Yii::$app->request->post()) && $model->save()) {
    //         return $this->redirect(['view', 'id' => $model->con_id]);
    //     } else {
    //         return $this->render('create', [
    //             'model' => $model,
    //         ]);
    //     }
    // }

    /**
     * Updates an existing ReqConfiguracion model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $oldPath = Yii::getAlias("@webroot") . $model->con_logo;

        if ($model->load(Yii::$app->request->post())) 
        {
            try
            {
                $model->file = UploadedFile::getInstance($model, 'file');
                $model->file->saveAs( Yii::getAlias("@webroot") . '/img/requisiciones/'. $model->file->baseName . '.' . $model->file->extension, false);
                $model->con_logo = '/img/requisiciones/'. $model->file->baseName . '.' . $model->file->extension;

                try
                {
                    unlink($oldPath);
                }
                catch(Exception $e) {   }
            }
            catch(Exception $e)
            {

            }
            finally
            {
                $model->save();
                return $this->redirect(['index']);
            }   
        }
        else 
        {
            return $this->render('update', ['model' => $model]);
        }
    }

    /**
     * Deletes an existing ReqConfiguracion model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    // public function actionDelete($id)
    // {
    //     $this->findModel($id)->delete();

    //     return $this->redirect(['index']);
    // }

    /**
     * Finds the ReqConfiguracion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ReqConfiguracion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ReqConfiguracion::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}