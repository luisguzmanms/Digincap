<?php
include("bd/conexion.php");
$sqlEncolamiento="SELECT * FROM di_encolamiento, di_csf, di_cubiculos WHERE di_encolamiento.dien_fecha='".date("Y-m-d")."' AND di_encolamiento.dien_activo=1 AND di_encolamiento.dicsf_id=di_csf.dicsf_id AND di_csf.dicu_id=di_cubiculos.dicu_id;";
$apEnc=mysqli_query($ap,$sqlEncolamiento);
//echo $sqlEncolamiento."  - ".mysqli_num_rows($apEnc);
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Digiturno Incap..</title>
    <link rel="styleSheet" href="css/formato.css" type="text/css">	
	
    <script language="JavaScript">
    		turno = new Array();
			modulo = new Array();
    		<?php		
				$i=0;
				while($rowEncol=mysqli_fetch_array($apEnc)){
			?>		
			 turno[<?php echo $i;?>]="<?php echo $rowEncol['dien_codserv'];?>";
			 modulo[<?php echo$i;?>]="<?php echo $rowEncol['dicu_nombre'];?>";
			<?php
					$i++;
				}
			?>
			tr=<?php echo $i;?>;
		inicio=0;
		fin=5;
		sw=0;
		if(tr<=fin){
			fin=tr;
		}
		function listar(){
			con=0;
			for(i=inicio;i<fin;i++){
				var turno1=document.getElementById("t" + con);
				turno1.innerHTML=turno[i];
				var modulo1=document.getElementById("m" + con);
				modulo1.innerHTML=modulo[i];
				con++;
			}
			//alert("xx");
			if(fin+5<tr){
				fin=fin+5;
				inicio=inicio+5;
			}else if((tr-fin) >0){
					fin=fin+(tr-fin)
					inicio=inicio+5
				}else if(sw==1){
					clearTimeout();
					document.getElementById("f1").submit();
				}else{sw=1;}
		}
		setInterval(listar,6000);	
    </script>
</head>
<body>
	<div class="vcontenedor">
		<div class="vizq">
			<br>
			<div class="venmarcar">
				<!--<center><h2>Encolamiento de Turnos - INCAP</h2></center>-->
				<form name="f1" id="f1" Method="POST" action="visor.php">
					<div class="vtitulo">Cola de Turnos - INCAP</div>
					<br>
					<div class="grupoi">
						<div class="cmt" style="height:60px;font-size:38px;padding-top:10px;background:#000;">Turno</div>
						<div class="cmt2" style="height:60px;font-size:38px;padding-top:10px;background:#000;">Mód</div>
					</div>	
					<?php
						for($i=0;$i<5;$i++){
							mysqli_data_seek($apEnc,$i);
							$rowEn=mysqli_fetch_array($apEnc);
					?>	
					
					<div class="grupoi">	
						<div class="cmt" id="t<?php echo $i;?>"><?php echo $rowEn['dien_codserv'];?></div>
						<div class="cmt2" id="m<?php echo $i;?>"><?php echo $rowEn['dicu_nombre'];?></div>
					</div>
					<?php
						}
					?>	
				</form>
			</div>
		</div>
		<div class="vder">
			<br>
			<div class="venmarcar">
				<img src="img/INCAP.png" />
			</div>
		
		</div>
	</div>
</body>
</html>
