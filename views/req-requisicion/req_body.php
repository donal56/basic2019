<!DOCTYPE html>
<html>

<body>
<!-- cuerpo -->

	<div style="font: 12px arial; margin: 3mm 0 3mm 0">¿Los Bienes o Servicios están contemplados en el Programa Operativo Anual?  &nbsp;
		<b><?php echo ($model->req_esoperativo=="1") ? "Sí" : "No"; ?></b>
	</div>

<!-- bienes -->

	<table  style="page-break-inside:auto" width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#000000">
		<thead style=" display:table-header-group ">
			<tr style="page-break-inside:avoid; page-break-after:auto">
				<th align="center" style="font: 10px arial;"><b>CLAVE <br> PRESUPUESTAL</b></th>
				<th align="center" style="font: 10px arial;"><b>PARTIDA</b></th>
				<th align="center" style="font: 10px arial;"><b>CANTIDAD</b></th>
				<th align="center" style="font: 10px arial;"><b>UNIDAD</b></th>
				<th align="center" style="font: 10px arial;"><b>DESCRIPCIÒN DE LOS BIENES O SERVICIOS</b></th>
				<th align="center" style="font-size: 10px;"><b>COSTO ESTIMADO<br>TOTAL + IVA</b></th>
			</tr>
		</thead>	
	
	<?php
		$total = 0;
		foreach ($model->getDetalle() as $column)
		{
			echo '<tr>';

			echo '<td style="font: 10px arial;">'.$column->det_clave.'</td>';

			echo '<td style="font: 10px arial;">'.$column->det_partida.'</td>';

			echo '<td style="font: 10px arial;">'.$column->det_cantidad.'</td>';

			echo '<td style="font: 10px arial;">'.$column->det_unidad.'</td>';

			echo '<td align="justify" style="font: 10px arial;">'.$column->det_descripcion.'</td>';

			$total = $total+$column->det_costo;

			echo '<td style="font: 10px arial;">'.'$'.number_format($column->det_costo, 2, '.', ',').'</td>';


			echo '</tr>';
		}

	?>
		<tr>
			<td colspan="5" align="right" style="font-size: 10px;">TOTAL</td>
			<td align="left" style="font-size: 10px;">$<?= number_format($total, 2, '.', ',') ?></td>
		</tr>


	</table><br>

<!-- justificacion -->
	<table width="100%" border="1" cellpadding="5" cellspacing="0" bordercolor="#000000">
	  <tr>
	    <th style="font: 10px arial;"><b>LO ANTERIOR PARA SER UTILIZADO EN LA ACCIÓN:</b></th>
	  </tr>
	  <tr>
	    <td style="font: 10px arial;"><?= $model->req_justificacion ?></td>
	  </tr>
	</table><br>

<div style="position: absolute;bottom: 70px; left: 0px;padding: 0px 55px 0px 55px">
<!-- Firmas -->
	<table  width="100%"  style="page-break-inside:avoid;">
		<tr>
			<td align="center" style="font-size: 10px;border-right: 10mm solid #FFF;padding-bottom: 10mm;border-bottom: 1px solid #000;"><b>NOMBRE Y FIRMA DEL <?=  $sws::getSuperior()[4]?>

			</td> 
			<td align="center" style="font-size: 10px;border-right: 10mm solid #FFF;padding-bottom: 10mm;border-bottom: 1px solid #000;">
				<b>Vo. Bo. <br>NOMBRE Y FIRMA DEL JEFE(A) DE <br> DEPTO. DE PLANEACIÓN, PROGRAMACIÓN Y PRESUPUESTACIÓN

			</td> 
			<td align="center" style="font-size: 10px;padding-bottom: 10mm;border-bottom: 1px solid #000;"><b>Vo. Bo.<br>NOMBRE Y FIRMA DEL DIRECTOR(A)

			</td> 
		</tr>

		<tr>
			<td align="center" style="font-size: 10px;border-right: 10mm solid #FFF;"><?= $sws::getSuperior()[2] ?>
				<br>&nbsp; 	<?=  $sws::getSuperior()[0]?>
			</td>Cambiar estooooooooo al modeloooooooooooooo
			<td align="center" style="font-size: 10px;border-right: 10mm solid #FFF;"><?= $sws::getJefePlaneacion()[2] ?>
				<br>&nbsp; 	<?=  $sws::getJefePlaneacion()[0] ?>
			</td>
			<td align="center" style="font-size: 10px;"><?= $sws::getDirector()[0]?>
				<br>&nbsp; 	<?=  $sws::getDirector()[2] ?>
			</td>

		</tr>
	</table>
</div>                                                                                                                                                                                     
</body>
</html>
