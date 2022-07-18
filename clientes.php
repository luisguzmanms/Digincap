<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Digiturno Incap..</title>
	
	
	<link rel="StyleSheet" href="css/estilos.css" type="text/css">
    <script language="JavaScript" src="js/motor.js"></script>
</head>
<body>
<?php
session_start();
include("bd/conexion.php");

?>



<div id="contenido">


	
	
	

	<div id="sectioninicio">

	<center>
	<img id="logoprincipal" src="img/digincap.png" alt="..." class="" style="width: 150px; height: 100px;">
	</center>


	<div id="mitad">
		<form name="f1" id="f1" method="POST" action="clientes.php">
			<input type="hidden" name="vs" id="vs" value="" />
			<input type="hidden" name="op" id="op" value="" />

		<?php
			$cargaid=$_POST['vs'];
			if(!isset($_POST["op"]) || $_POST["op"]==0){
				if($_SESSION['cat']!="" && isset($_POST["vs"])){
					$fecha=date("Y-m-d");
					$hora=date("H:i:s");
					$_SESSION["servicio"]=$cargaid;
					$sqlCub="SELECT * FROM di_servicios WHERE dise_id=".$_SESSION["servicio"];
					
					$regs=mysqli_query($ap,$sqlCub);
					$rowc=mysqli_fetch_array($regs);
					$cub=$rowc["dise_cubiculo"];
					$codserv=$rowc["dise_codigo"];
					$sqlCu='SELECT * FROM di_cubiculos WHERE dicu_nombre="'.$cub.'";';
				
					$rcubiculo=mysqli_query($ap,$sqlCu);
					$rowcubiculo=mysqli_fetch_array($rcubiculo);
					$idcubiculo=$rowcubiculo['dicu_id'];
					$sqlIdcubiculo="SELECT * FROM di_csf WHERE dicu_id=".$idcubiculo." AND dicsf_activo=1;";
					$apEcub=mysqli_query($ap,$sqlIdcubiculo);
					$rowec=mysqli_fetch_array($apEcub);
					//$rext=mysqli_query($ap,$sqlIdcubiculo);
					//$exist=mysqli_fetch_arraÿ́($rext);
				
					$idexcub=$rowec['dicsf_id'];
					$_SESSION['dicsf_id']=$idexcub;
					$_SESSION['cod_servicio']=$codserv;
					$sqlrep="SELECT * FROM di_encolamiento WHERE dicsf_id=".$_SESSION['dicsf_id']." AND dise_id=".$_SESSION['servicio']." AND dien_fecha='".date("Y-m-d")."';";
					$crencola=mysqli_query($ap,$sqlrep);
					$cre=mysqli_num_rows($crencola);
				
					if($cre<10){
						$cadcre=$codserv."-0".($cre + 1);
					}else{
						$cadcre=$codserv."-".$cre;
					}
					$sqlEncolamiento="INSERT INTO di_encolamiento VALUES(Null, '".$fecha."', '".$hora."', ".'"", "", "'.$cadcre.'", 0, '.$_SESSION['cliente_id'].', '.$_SESSION['dicsf_id'].', '.$_SESSION['servicio'].');';
					$rr=mysqli_query($ap,$sqlEncolamiento);
				
					$_SESSION["cat"]="";
					$_SESSION["idcliente"]="";
					$_SESSION["servicio"]="";
					$_SESSION["cod_servicio"]="";
					$_SESSION["cliente_id"]="";
				}

				$sqlCat="SELECT * FROM di_categorias WHERE dica_activo=1";
				$reg=mysqli_query($ap,$sqlCat);
				$cr=mysqli_num_rows($reg);
				$con=1;
				while($rowcat=mysqli_fetch_array($reg)){
					if(($con % 2)==0){
		?>




		<div class="btn-opcion" onClick="cargarid(<?php if($rowcat['dica_existe']==1){ echo "'".$rowcat['dica_id']."', '1'";}else{ echo "'".$rowcat['dica_id']."', '2'";}?>);">

			<h3><?php echo $rowcat["dica_nombre"];?></h3>
		</div>
		</div>
		
		<?php
					}else{

		?>
		<div class="dv">
		<div class="btn-opcion" onClick="cargarid(<?php if($rowcat['dica_existe']==1){ echo "'".$rowcat['dica_id']."', '1'";}else{ echo "'".$rowcat['dica_id']."', '2'";}?>);">
		<h3><?php echo $rowcat["dica_nombre"];?></h3>
		</div>
		<?php	
						if($con == $cr){
		?>
						</div>
		<?php					
					}	
 					}	
					$con++;		
				}
			}elseif($_POST["op"]==1){
				include("template/calculadora.php");
			}elseif($_POST["op"]==2){
				if($_SESSION["cat"]!=""){
					$_SESSION["idcliente"]=$cargaid;
					$sqlCli="SELECT * FROM di_clientes WHERE dicl_identificacion=".$cargaid.";";
					$regd=mysqli_query($ap, $sqlCli);
					$crd=mysqli_num_rows($regd);
					$row=mysqli_fetch_array($regd);
					if($crd>0){
						$_SESSION['cliente_id']=$row['dicl_id'];
					}else{
						//codigo pendiente..
					}	
				}else{
					$_SESSION['cat']=$cargaid;
					$sqlCat="SELECT * FROM di_clientes WHERE dica_id=".$cargaid.";";
					$regd=mysqli_query($ap, $sqlCat);
					$crd=mysqli_num_rows($regd);
					$row=mysqli_fetch_array($regd);
				//	echo " - Busqueda Cliente...".$sqlCat;
					if($crd<=0){
						$sqlCli='INSERT INTO di_clientes VALUES(Null,"", "Anonimo", "", "", "", '."'".date("Y-m-d")."', '".date("H:i:s")."', ".'"", '.$_SESSION["cat"].");";
						$regC=mysqli_query($ap, $sqlCli);
						$sqlCat="SELECT * FROM di_clientes WHERE dica_id=".$cargaid.";";
						$regd=mysqli_query($ap, $sqlCat);
						$row=mysqli_fetch_array($regd);
						$_SESSION['cliente_id']=$row['dicl_id'];
					//	echo $sqlCli." No hay registro en cliente".$cargaid;
					}else{
						$_SESSION['cliente_id']=$row['dicl_id'];
					//	echo "se ha asignado cliente..".$_SESSION["cliente_id"];
					}
				}
				$sqlSer="SELECT * FROM di_servicios WHERE dise_activo=1";
				$reg=mysqli_query($ap,$sqlSer);
				$cr=mysqli_num_rows($reg);
				$con=1;
				while($row=mysqli_fetch_array($reg)){
					if(($con % 2)==0){	
		?>
			<div class="btn-opcion" onClick="cargarid(<?php echo $row['dise_id'];?>,0);">
			<h3><?php echo $row["dise_nombre"];?></h3>
			</div>
			</div>
		<?php
					}else{

		?>
		<div class="dv">
		<div class="btn-opcion" onClick="cargarid(<?php echo $row['dise_id'];?>,0);">
		<h3><?php echo $row["dise_nombre"];?></h3>
		</div>
		<?php	
						if($con == $cr){
		?>
						</div>
		<?php					
					}	
 					}	
					$con++;		
				}
		}
		?>
				</form>	
	</div>

	<div id="pie"></div>

	</div>

</div>



</body>
</html>
