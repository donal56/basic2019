<!DOCTYPE html>
<html>

<body>
<!-- cuerpo -->

	<div style="font: 12px arial;text-align: center;padding-top: 5mm;">
		<b>INSTITUTO TECNOLOGICO DE <?= $instituto ?> <br>
		REQUISICIÓN DE BIENES Y SERVICIOS</b>
	</div>

	<table width="100%">
		<tr>
			<td style="font: 10px arial;">FECHA:&nbsp;<u><?= $fecha ?></u></td>
			<td style="font: 10px arial;" align="right">FOLIO No:&nbsp;<u><?= $folio ?></u></td>
		</tr>
	</table>

	<table width="100%" border="1" cellpadding="4" cellspacing="0" bordercolor="#000000">
		<tr>
			<td style="font: 10px arial;">NOMBRE Y FIRMA DEL ÁREA SOLICITANTE:&nbsp;
				<?= $solicitante ?>	
			</td>
		</tr>
		<tr>
			<td style="font: 10px arial;">FECHA Y ÁREA SOLICITANTE:&nbsp;
				<?= $fechasolicitud ?>
				&nbsp; 	<?= $area_solicitante ?>
			</td>
		</tr>
	</table>

	<div style="font: 12px arial; margin: 3mm 0 3mm 0">¿Los Bienes o Servicios están contemplados en el Programa Operativo Anual?  &nbsp;
		<b><?php echo ($esoperativo=="1") ? "Sí" : "No"; ?></b>
	</div>

<!-- bienes -->

	<table width="100%" border="1" cellpadding="4" cellspacing="0" bordercolor="#000000">
		<tr>
		  <th align="center" style="font: 10px arial;"><b>CLAVE <br> PRESUPUESTAL</b></th>
		  <th align="center" style="font: 10px arial;"><b>PARTIDA</b></th>
		  <th align="center" style="font: 10px arial;"><b>CANTIDAD</b></th>
		  <th align="center" style="font: 10px arial;"><b>UNIDAD</b></th>
		  <th align="center" style="font: 10px arial;"><b>DESCRIPCIÒN DE LOS BIENES O SERVICIOS</b></th>
		  <th align="center" style="font-size: 10px;"><b>COSTO ESTIMADO<br>TOTAL + IVA</b></th>
		</tr>
	
	<?php
		$total = 0;
		foreach ($detalle as $column)
		{
			echo '<tr>';

			echo '<td style="font: 10px arial;">'.$column->det_clave.'</td>';

			echo '<td style="font: 10px arial;">'.$column->det_partida.'</td>';

			echo '<td style="font: 10px arial;">'.$column->det_cantidad.'</td>';

			echo '<td style="font: 10px arial;">'.$column->det_unidad.'</td>';

			echo '<td style="font: 10px arial;">'.$column->det_descripcion.'</td>';

			$total = $total+$column->det_costo;

			echo '<td style="font: 10px arial;">'.'$ '.$column->det_costo.'</td>';


			echo '</tr>';
		}

	?>
		<tr>
			<td colspan="5" align="right" style="font-size: 10px;">TOTAL</td>
			<td align="left" style="font-size: 10px;">$ <?= $total ?></td>
		</tr>


	</table><br>

<!-- justificacion -->
	<table width="100%" border="1" cellpadding="5" cellspacing="0" bordercolor="#000000">
	  <tr>
	    <th style="font: 10px arial;"><b>LO ANTERIOR PARA SER UTILIZADO EN LA ACCIÓN:</b></th>
	  </tr>
	  <tr>
	    <td style="font: 10px arial;"><?= $justificacion ?></td>
	  </tr>
	</table><br>


<!-- Firmas -->
<table  width="100%" >
	<tr>
		<td align="center" style="font-size: 10px;border-right: 10mm solid #FFF;padding-bottom: 10mm;border-bottom: 1px solid #000;"><b>NOMBRE Y FIRMA DEL SUBDIRECTOR(A)

		</td> 
		<td align="center" style="font-size: 10px;border-right: 10mm solid #FFF;padding-bottom: 10mm;border-bottom: 1px solid #000;">
			<b>Vo. Bo. <br>NOMBRE Y FIRMA DEL JEFE(A) DE <br> DEPTO. DE PLANEACIÓN, PROGRAMACIÓN Y PRESUPUESTACIÓN

		</td> 
		<td align="center" style="font-size: 10px;padding-bottom: 10mm;border-bottom: 1px solid #000;"><b>Vo. Bo.<br>NOMBRE Y FIRMA DEL DIRECTOR(A)

		</td> 
	</tr>

	<tr>
		<td align="center" style="font-size: 10px;border-right: 10mm solid #FFF;"><?= $subdirector ?>
			<br>&nbsp; 	<?= $area_subdirector ?>
		</td>
		<td align="center" style="font-size: 10px;border-right: 10mm solid #FFF;"><?= $planeacion ?>
			<br>&nbsp; 	<?= $area_planeacion ?>
		</td>
		<td align="center" style="font-size: 10px;"><?= $director ?>
			<br>&nbsp; 	<?= $area_director ?>
		</td>

	</tr>
</table>
                                                                                                                                                                                       
</body>
</html>
