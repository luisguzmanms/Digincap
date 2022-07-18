<?php
if(isset($_SESSION["op"])){
	$op=$_SESSION["op"];
}else{
	$op=0;
}
switch($op){
	case 1:
		include("mnup.php");
		break;
	case 2:
		include("func.php");
		break;
	case 3:
		include("otro.php");
		break;
	default:
		include("log.php");
		break;
}	
?>
