<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\base\Model;
use kartik\mpdf\Pdf;
use app\controllers\ReqRequiscion;
use app\models\ReqRequisicion;
use app\models\ReqRequisicionSearch;
use app\models\ReqConfiguracion;
use app\models\ReqArea;
use app\models\ReqDetalle;
use yii\db\Query;
use app\models\ReqDetalleSearch;
use yii\web\ServerErrorHttpException;
use yii\web\UnauthorizedHttpException;
use app\components\SWS_API;
use webvimark\modules\UserManagement\models\User;

/**
 * RequisicionController implements the CRUD actions for Requisicion model.
 */
class ReqRequisicionController extends Controller
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
                'only' => ['index','create','update','view'], 
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
     * Lists all Requisicion models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ReqRequisicionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Requisicion model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model= $this->findModel($id);  
        $searchModel = new ReqDetalleSearch();
        $dataProvider = $searchModel->search($id);

        if(Yii::$app->user->isSuperAdmin || $this -> getIDUsuarioActual() == $model -> getReqFkuseSolicitante() -> asArray() -> one()['id'])
        {
            return $this->render('view', [
                'model' => $this->findModel($id),
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        }
        else
        {
            throw new UnauthorizedHttpException('Acceso no permitido.');
        }
    }

    /**
     * Creates a new Requisicion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */

    public function actionCreate()
    {
        $model = new ReqRequisicion();
        $modeldet = new ReqDetalle();
        $this->view->params['empty'] = '';

        if(isset($_POST['_csrf'])){

        //Save requisicion
            $req = Yii::$app->request->post();
            $detalle=array_pop($req)['temp'];

            $datareq['_csrf'] =  Yii::$app->request->post()['_csrf'];
            $datareq= $req;

            //transaction
            $connection = \Yii::$app->db;
            $transaction = $connection->beginTransaction();
            $countDet = 0;
            
            if ($req['ReqRequisicion']['req_fkuse_solicitante'] === (String) $this -> getIDUsuarioActual() && $model->load($datareq) && $model->save()) {
                $req_id =  $model->req_id;
                //Save detalles
                
                for ($i=0; $i < count($detalle); $i++) { 

                    $datadet['_csrf'] =  Yii::$app->request->post()['_csrf'];

                    $datadet['ReqDetalle'] = $detalle[$i];
                    $datadet['ReqDetalle']['det_fkrequisicion']=$model->req_id;

                    if (!$this->isEmpty($datadet)) { 

                        if ($modeldet->load($datadet) && $modeldet->save()) {
                            $modeldet = new ReqDetalle();    
                        } else {
                            $transaction->rollback();
                            throw new ServerErrorHttpException('A OCCURIDO UN ERROR CON LOS DETALLES');
                        }
                        $countDet++;
                    }
                }

                if ($countDet==0) {
                    $transaction->rollback();
                    $model->isNewRecord = true;
                    $this->view->params['empty'] = 'true';
                    return $this->render('create', [
                    'model' => $model,
                    'modeldet'  => $modeldet,
                    ]); 

                }else{
                    $transaction->commit();
                }

            }
            else
            {
                $transaction->rollback();
                return $this->render('create', [
                    'model' => $model,
                    'modeldet'  => $modeldet,
                ]);   
            }
            return $this->redirect(['view', 'id' => $req_id]); 

        }else{
            
            return $this->render('create', [
                    'model' => $model,
                    'modeldet'  => $modeldet,
            ]);
        }

    }



    /**
     * Updates an existing Requisicion model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $idlist;

        $this->view->params['empty'] = '';

        if(Yii::$app->user->isSuperAdmin || $this -> getIDUsuarioActual() == $model -> getReqFkuseSolicitante() -> asArray() -> one()['id'])
        {
            $modeldet = new ReqDetalle();
            $modeldet['temp'] = $model->getDetalle();

            if(isset($_POST['_csrf']))
            {
                //update requisicion

                $requisicion = Yii::$app->request->post()['ReqRequisicion'];
                $detalle=Yii::$app->request->post()['ReqDetalle']['temp'];
        
                $datareq['_csrf'] =  Yii::$app->request->post()['_csrf'];
                $datareq['ReqRequisicion']= $requisicion;

                 //transaction
                $connection = \Yii::$app->db;
                $transaction = $connection->beginTransaction();
            
                if ($requisicion['req_fkuse_solicitante'] === (String) $this -> getIDUsuarioActual()  && $model->load($datareq) && $model->save()) 
                {
                    //update detalles
                    for ($i=0; $i < sizeof($detalle); $i++) 
                    { 
                        $datadet['_csrf'] =  Yii::$app->request->post()['_csrf'];
                        $datadet['ReqDetalle'] = current($detalle);
                        next($detalle);
                        $datadet['ReqDetalle']['det_fkrequisicion']=$id;

                        if (!$this->isEmpty($datadet)) 
                        {    
                            if ($modeldet->load($datadet) && $modeldet->save()) 
                            {
                                $idlist[$i] = $modeldet->det_id;
                                $modeldet = new ReqDetalle();    
                            } 
                            else 
                            {
                                throw new ServerErrorHttpException('A OCCURIDO UN ERROR.');
                            }
                        }
                        
                    }
                    if(!empty($idlist)){
                        $this->deleteNotListed($id,$idlist);
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $id]);
                    }else{
                        $transaction->rollback();
                        $this->view->params['empty'] = 'true';
                        return $this->render('update', [
                        'model' => $model,
                        'modeldet'  => $modeldet,
                        ]); 
                    }
        
                }   
                else 
                {
                    throw new UnauthorizedHttpException('Acción no permitida.');
                }
            }
            else
            {
                return $this->render('update', ['model' => $model, 'modeldet' => $modeldet]);
            }   
        }
        else 
        {
            throw new UnauthorizedHttpException('Acceso no permitido.');
        }
    }


    /**
     * Deletes an existing Requisicion model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->isSuperAdmin || $this -> getIDUsuarioActual() == $this -> findModel($id)-> getReqFkuseSolicitante() -> asArray() -> one()['id'])
        {
    	    ReqDetalle::deleteAll('det_fkrequisicion = '.$id);
            $this->findModel($id)->delete();
            return $this->redirect(['index']);
        }
        else 
        {
            throw new UnauthorizedHttpException('Acción no permitida.');
        }
        
    }


    public function actionReport($id) 
    {
        $model =  $this->findModel($id);

        if(Yii::$app->user->isSuperAdmin || $this -> getIDUsuarioActual() == $model->getSolicitanteID())
        {
            $sws = new SWS_API();
            
            Yii::$app->user->isSuperAdmin ? $sws::find($model->req_fkuse_solicitante) : $sws::find();

            $pdf = new Pdf([
                // set to use core fonts only
                'mode' => Pdf::MODE_CORE, 
                // A4 paper format
                'format' => Pdf::FORMAT_A4, 
                // portrait orientation
                'orientation' => Pdf::ORIENT_LANDSCAPE, 
                // stream to browser inline
                'destination' => Pdf::DEST_BROWSER, 

                'marginTop' => '65',
                'marginBottom' => '15',
                 // set mPDF properties on the fly
                'options' => ['title' => 'Formato para  Requisición de Bienes y Servicios.']
            ]);
            
            $mpdf = $pdf->api;

            $mpdf->SetHTMLHeader($this->renderPartial('req_header',['model' => $model, 'sws' => $sws]));

            $pdf->content = $this->renderPartial('req_body', [ 'model' =>   $model, 'sws' => $sws]);
         
            $mpdf -> SetHTMLFooter($this->renderPartial('req_footer', [ 'model' =>   $model ]));
       
                return $pdf->render();

        }else {
                throw new UnauthorizedHttpException('Acceso no permitido.');
        }

    }
    



    /**
     * Finds the Requisicion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Requisicion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ReqRequisicion::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('La requesicion solicitada no existe.');
        }
    }

    public function deleteNotListed($id,$idlist)
    {
        ReqDetalle::deleteAll('det_id NOT IN ('.implode(", ",$idlist).') AND det_fkrequisicion = '.$id);

    }

    public function isEmpty($array){

        if ($array['ReqDetalle']['det_clave']=="") {
            return true;
        }else{
            return false;
        }
           // ReqDetalle::deleteAll('det_clave ="" AND det_fkrequisicion = '.$id);
    
    }

    public function getIDUsuarioActual()
    {
        return Yii::$app->user->identity->id;
    }

}
