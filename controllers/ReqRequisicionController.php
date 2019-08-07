<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\base\Model;

use kartik\mpdf\Pdf;
use app\models\ReqRequisicion;
use app\models\ReqRequisicionSearch;
use app\models\ReqConfiguracion;
use app\models\ReqPersonal;
use app\models\ReqArea;
use app\models\ReqDetalle;
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
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Requisicion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */

 public function actionCreate()

    {   

        $model = new  ReqRequisicion();
        $modelDet = new  ReqDetalle();


        if ($model->load(Yii::$app->request->post()) && $modelDet->load(Yii::$app->request->post()) && Model::validateMultiple([$model, $modelDet])) {

            

            $model->save(false); // skip validation as model is already validated

            $modelDet->det_fkrequisicion = $model->req_id; // no need for validation rule on model_id as you set it yourself

            $modelDet-save(false); 

            

            return $this->redirect(['view', 'id' => $model->req_id]);

        } else {

            return $this->render('create', [

                'model' => $model,

                'modelDet' => $modelDet,

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

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->req_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
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





}
