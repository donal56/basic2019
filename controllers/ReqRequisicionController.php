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
use app\models\ReqPersonal;
use app\models\ReqArea;
use app\models\ReqDetalle;
use yii\db\Query;

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

        if($this -> getIDUsuarioActual() == $model -> getReqFkperSolicitante() -> asArray() -> one()[per_id])
        {
            return $this->render('view', ['model' => $this->findModel($id)]);
        }
        else
        {
            return $this->redirect('/req-requisicion');
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

        if($_POST['_csrf']!=""){

        //Save requisicion
            $req = Yii::$app->request->post();
            $detalle=array_pop($req)['temp'];
            $requisicion = $req;

            $datareq['_csrf'] =  Yii::$app->request->post()['_csrf'];
            $datareq= $req;
            
            if ($model->load($datareq) && $model->save()) {
                $req_id =  $model->req_id;
                //Save detalles
                
                for ($i=0; $i < count($detalle); $i++) { 

                    $datadet['_csrf'] =  Yii::$app->request->post()['_csrf'];

                    $datadet['ReqDetalle'] = $detalle[$i];
                    $datadet['ReqDetalle']['det_fkrequisicion']=$model->req_id;
                    if ($modeldet->load($datadet) && $modeldet->save()) {
                        $modeldet = new ReqDetalle();    
                    } else {
                        throw new NotFoundHttpException('A OCCURIDO UN ERROR CON LOS DETALLES');
                    }
                }

            }else{
                 throw new NotFoundHttpException('A OCCURIDO UN ERROR CON LA REQUISICION.'); 
            }
            $this->deleteEmpty($req_id);
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
        
        if($this -> getIDUsuarioActual() == $model -> getReqFkperSolicitante() -> asArray() -> one()[per_id])
        {
            
            $modeldet = new ReqDetalle();
            $modeldet['temp'] = $this->findAllDetalle($model->req_id);

            if($_POST['_csrf'] != ""){
                //update requisicion

                $requisicion = Yii::$app->request->post()['ReqRequisicion'];
                $detalle= Yii::$app->request->post()['ReqDetalle']['temp'];
        
                $datareq['_csrf'] =  Yii::$app->request->post()['_csrf'];
                $datareq['ReqRequisicion']= $requisicion;

            
                if ($_POST['ReqRequisicion[req_fkper_solicitante]'] === (String) $this -> getIDUsuarioActual() && $model->load($datareq) && $model->save()) {
                    
                //update detalles
                    for ($i=0; $i < sizeof($detalle); $i++) { 

                        $datadet['_csrf'] =  Yii::$app->request->post()['_csrf'];

                        $datadet['ReqDetalle'] = current($detalle);
                        next($detalle);

                        $datadet['ReqDetalle']['det_fkrequisicion']=$id;

                        if ($modeldet->load($datadet) && $modeldet->save()) {
                            $idlist[$i] = $modeldet->det_id;
                            $modeldet = new ReqDetalle();    
                        } else {
                            throw new NotFoundHttpException('A OCCURIDO UN ERROR.');
                        }

                    }
                    $this->deleteEmpty($id);
                    $this->deleteNotListed($id,$idlist);
                }
                else {
                    return $this->redirect('/req-requisicion');
                } 
                return $this->redirect(['view', 'id' => $id]);
            }else{
                return $this->render('update', [
                    'model' => $model,
                    'modeldet' => $modeldet,
                ]);
            }
        }
        else
        {
            return $this->redirect('/req-requisicion');
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
    	ReqDetalle::deleteAll('det_fkrequisicion = '.$id);
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }


    public function actionReport($id) {

    $req =  $this->findModel($id);
    $config = $this->findConfig($req->req_fkconfiguracion);
    $per_solicitante = $this->findPersona($req->req_fkper_solicitante);

    $per_subdirector = $this->findPersona($req->req_fkper_subdirector);
    $per_planeacion = $this->findPersona($req->req_fkper_planeacion);
    $per_director = $this->findPersona($req->req_fkper_director);

    $area_solicitante = $this->findArea(  $per_solicitante->per_id)->are_nombre;

    $area_subdirector = $this->findArea(  $per_subdirector->per_id)->are_nombre;

    $area_planeacion = $this->findArea(  $per_planeacion->per_id)->are_nombre;

     $area_director = $this->findArea( $per_director->per_id)->are_nombre;




        $pdf = new Pdf([
            // set to use core fonts only
            'mode' => Pdf::MODE_CORE, 
            // A4 paper format
            'format' => Pdf::FORMAT_A4, 
            // portrait orientation
            'orientation' => Pdf::ORIENT_LANDSCAPE, 
            // stream to browser inline
            'destination' => Pdf::DEST_BROWSER, 

            'marginTop' => '30',
             // set mPDF properties on the fly
            'options' => ['title' => 'Formato para  Requisición de Bienes y Servicios.']
        ]);
        
        $mpdf = $pdf->api;

        $mpdf -> SetHTMLHeader($this->renderPartial('req_header',
            [   'logo' =>  $config->con_logo,
                'revision'  =>  $config->con_revision
            ]
        ));

        $mpdf -> SetHTMLFooter(
        '<table width="100%">
        <tr>
            <td style="font: 10px arial;" ><b>TecNM-AD-IT-001-03</b></td>
            <td style="font: 10px arial;" align="right"><b>Rev.'.$config->con_revision.'</b></td>
        </tr>
        </table>');
        

        $pdf->content = $this->renderPartial('req_body',
            [   'instituto' =>  $config->con_instituto,
                'fecha'  =>  $req->req_fecha ,
                'folio'  =>  $req->req_folio ,
                'fechasolicitud'  =>  $req->req_fechasolicitante ,
                'esoperativo'  =>  $req->req_esoperativo ,
                'justificacion'  =>  $req->req_justificacion,
                'solicitante' =>   $this->fullName($per_solicitante),
                'area_solicitante' =>  $area_solicitante,
                'area_subdirector' =>  $area_subdirector,
                'area_planeacion' =>  $area_planeacion,
                'area_director' =>  $area_director,
                'subdirector' =>   $this->fullName($per_subdirector),
                'planeacion' =>  $this->fullName($per_planeacion),
                'director' =>   $this->fullName($per_director),
                'detalle' =>  $this-> findDetalle($req->req_id)
            ]
        );

        return $pdf->render();
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

    protected function findConfig($id)
    {
        if (($model = ReqConfiguracion::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('Error en la configuracion de la requisición.');
        }
    }

    protected function findPersona($id)
    {
        if (($model = ReqPersonal::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('Error en el registro del personal');
        }
    }

    protected function findArea($id)
    {     
        if ( ($model = ReqArea::findOne(['are_fkper_responsable' => $id]) ) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    protected function findDetalle($id)
    {    
        if ( ($model = ReqDetalle::findAll(['det_fkrequisicion' => $id]) ) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }

    }
    protected function fullName($per)
    { 
        return  $per->per_nombre." ".
                $per->per_paterno." ".
                $per->per_materno;
    }



    protected function findAllDetalle($id)
    {
        if (($model = ReqDetalle::find()->where(['det_fkrequisicion' => $id])->asArray()->all()) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function deleteNotListed($id,$idlist)
    {
        ReqDetalle::deleteAll('det_id NOT IN ('.implode(", ",$idlist).') AND det_fkrequisicion = '.$id);

    }

    public function deleteEmpty($id){
        ReqDetalle::deleteAll('det_clave ="" AND det_fkrequisicion = '.$id);
    }

    public function getIDUsuarioActual()
    {
        $query1 = new Query;
        $query1 -> select(['req_personal.per_id as ID', 
            'CONCAT(req_personal.per_nombre, " ", req_personal.per_paterno, " ", req_personal.per_materno) as Nombre '])
                -> from('req_personal')
                -> join('INNER JOIN', 'user', 'req_personal.per_fkuser = user.id')
                -> where(['user.id' => Yii::$app->user->identity->id]);
        $data1 = $query1 -> createCommand() -> queryAll();
        $usuarioActual = $query1 -> createCommand() -> queryAll()[0][ID];

        return $usuarioActual;
    }

}
