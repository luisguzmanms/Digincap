<nav>
	<div class="opm" onclick="">
	</div>
	<div class="opm" onclick="">
	</div>
	<div class="opm" onclick="">
	</div>	
</nav>
<div class="dinf">
<?php
include("bd/conexion.php");
$func_id=$_SESSION['func_id'];
$sqlEncoll="SELECT di_encolamiento.dien_hora, di_encolamiento.dien_codserv, di_encolamiento.dien_activo, di_funcionarios.difu_nombre FROM di_encolamiento, di_csf, di_funcionarios WHERE di_encolamiento.dien_activo=0 AND di_encolamiento.dien_fecha='".date("Y-m-d")."' AND di_encolamiento.dicsf_id=di_csf.dicsf_id AND di_csf.difu_id=".$func_id." AND di_csf.difu_id=di_funcionarios.difu_id;";
//$sqlEncoll="SELECT * FROM di_encolamiento, di_csf, di_funcionarios WHERE di_encolamiento.dien_activo=0 AND di_encolamiento.dien_fecha='".date("Y-m-d")."' AND di_encolamiento.dicsf_id=di_csf.dicsf_id AND di_csf.difu_id=".$func_id." AND di_csf.difu_id=di_funcionarios.difu_id;";
$apreg=mysqli_query($ap,$sqlEncoll);
echo $sqlEncoll;
?>
	<div class="fil_fun">
		<div class="d5">Orden</div>
		<div class="d5">HORA</div>
		<div class="d5">TURNO</div>
		<div class="d5">ACTIVO</div>
		<div class="d2">FUNCIONARIO</div>
	</div>
	<?php
	$i=1;
	while($fila=mysqli_fetch_array($apreg)){
	?>
	<a href="funcionario.php?op=2">
	<div class="fil_fun">
		<div class="d5"><?php echo $i;?></div>
		<div class="d5"><?php echo $fila['dien_hora'];?></div>
		<div class="d5"><?php echo $fila['dien_codserv'];?></div>
		<div class="d5"><?php if(!$fila['dien_activo']){ echo "No atendido";}else{ echo "Atendido";}?></div>
		<div class="d2"><?php echo $fila['difu_nombre'];?></div>
	</div>
	</a>
	<?php
	}
	?>
</div>
