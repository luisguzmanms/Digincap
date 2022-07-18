<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Digiturno Incap..</title>
    <link rel="styleSheet" href="css/formato.css" type="text/css">
    <script language="JavaScript" src="js/motor.js"></script>
</head>
<body>
<?php
session_start();
include("bd/conexion.php");
if(!isset($_SESSION["op"]) || $_SESSION["op"]!=1){
	$sqlUsuario='SELECT * FROM di_funcionarios WHERE difu_identificacion="'.$_POST["usuario"].'" AND difu_password="'.$_POST["password"].'";';
	$apr=mysqli_query($ap,$sqlUsuario);
	$nr=mysqli_num_rows($apr);
	$reg=mysqli_fetch_array($apr);
	echo $sqlUsuario." - ".$nr;
	if($nr>0){
		$_SESSION["op"]=1;
		$_SESSION["func_id"]=$reg['difu_id'];
	}else{
		echo "Usuario No Existe!!";
	}	
}
?>
<div id="contenedor">
	<div id="encab">DigIncap..</div>
	<div id="mitad">
		<?php include("template/controlador.php");?>
	</div>
	<div id="pie"></div>
</div>
</body>
</html>
