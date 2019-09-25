<!DOCTYPE html>
<html>

<body>

<!-- Tabla del Encabezado -->

	<table width="100%" border="1" cellpadding="5" cellspacing="0" bordercolor="#000000">
		<tr>
			<td style="font: 10px arial;" align="center" rowspan="3">
				<img src="<?= $model->getConfig()->con_logo ?>" width=15mm>
			</td>
			<td style="font: 12px arial;" align="center"><b>Formato para  Requisición de Bienes y Servicios.</b></td>
			<td style="font: 12px arial;" ><b>Código: TecNM-AD-IT-001-03</b></td>
		</tr>
		<tr>
			<td style="font: 12px arial;" rowspan="2">
				<b>Referencia a la norma ISO 9001:2015 &nbsp; 6.1, 7.1.1, 7.1.5.2, 8.2 <br>
				Referencia a la norma ISO 14001:2015 &nbsp; 4.2, 6.1, 7.1</b>
			</td>
			<td style="font: 12px arial;">
				<b>Revisión: <?= $model->getConfig()->con_revision ?></b>
			</td>
		</tr>
		<tr>
			<td style="font: 12px arial;">
				<b>Hoja: {PAGENO} de {nb}</b>
			</td>
		</tr>
	</table>

		<div style="font: 12px arial;text-align: center;padding-top: 5mm;">
		<b>INSTITUTO TECNOLÓGICO DE <?= $model->getConfig()->con_instituto ?> <br>
		REQUISICIÓN DE BIENES Y SERVICIOS</b>
	</div>

	<table width="100%">
		<tr>
			<td style="font: 10px arial;">FECHA:&nbsp;<u><?= mb_strtoupper(\Yii::$app->formatter->asDate($model->req_fecha, 'long'));?></u></td>
			<td style="font: 11px arial;" align="right">FOLIO No:&nbsp;
				<u><b><?=($model->req_folio!=""?$model->req_folio :"___________")?></b></u>
			</td>
		</tr>
	</table>

	<table width="100%" border="1" cellpadding="4" cellspacing="0" bordercolor="#000000">
		<tr>
			<td style="font: 10px arial;">NOMBRE Y FIRMA DEL ÁREA SOLICITANTE:&nbsp;
				<?= $sws::getNombre()  ?>	
			</td>
		</tr>
		<tr>
			<td style="font: 10px arial;">FECHA Y ÁREA SOLICITANTE:&nbsp;
				<?= $model->req_fechasolicitante ?>
				&nbsp; 	<?=  $sws::getDepartamento() ?>
			</td>
		</tr>
	</table>


</body>
</html>
