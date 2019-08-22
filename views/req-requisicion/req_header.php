<!DOCTYPE html>
<html>

<body>

<!-- Tabla del Encabezado -->

	<table width="100%" border="1" cellpadding="5" cellspacing="0" bordercolor="#000000">
		<tr>
			<td style="font: 10px arial;" align="center" rowspan="3">
				<img src="<?= $data['config']->con_logo ?>" width=15mm>
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
				<b>Revisión: <?= $data['config']->con_revision ?></b>
			</td>
		</tr>
		<tr>
			<td style="font: 12px arial;">
				<b>Hoja: {PAGENO} de {nb}</b>
			</td>
		</tr>
	</table>

		<div style="font: 12px arial;text-align: center;padding-top: 5mm;">
		<b>INSTITUTO TECNOLOGICO DE <?= $data['config']->con_instituto ?> <br>
		REQUISICIÓN DE BIENES Y SERVICIOS</b>
	</div>

	<table width="100%">
		<tr>
			<td style="font: 10px arial;">FECHA:&nbsp;<u><?= $data['req']->req_fecha; ?></u></td>
			<td style="font: 10px arial;" align="right">FOLIO No:&nbsp;<u><?=($data['req']->req_folio!=""?$data['req']->req_folio!="":"___________")?></u></td>
		</tr>
	</table>

	<table width="100%" border="1" cellpadding="4" cellspacing="0" bordercolor="#000000">
		<tr>
			<td style="font: 10px arial;">NOMBRE Y FIRMA DEL ÁREA SOLICITANTE:&nbsp;
				<?=  $data['per_solicitante'] ?>	
			</td>
		</tr>
		<tr>
			<td style="font: 10px arial;">FECHA Y ÁREA SOLICITANTE:&nbsp;
				<?= $data['req']->req_fechasolicitante ?>
				&nbsp; 	<?= $data['area_solicitante'] ?>
			</td>
		</tr>
	</table>


</body>
</html>
