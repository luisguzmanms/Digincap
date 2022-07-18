<?php
//session_start();
$_SESSION["cat"]=$_POST["vs"];
?>

<!--

<div class="calculadora">
	<div class="dhor">
		<div class="col1"><input type="text" name="displyyay" id="disddsdplay" value="" placeholder="Ingrese Identificación" class="botones" /></div> 
	</div>
	<div class="dhor">
		<div class="col1"><input type="button" value="Limpiar.." onClick="limpiar();" class="botones" /></div>
	</div>	
	<div class="dhor">
		<div class="col3"><input type="button" name="uno" id="uno" value="1" onClick="componer('1');" class="botones" /></div>
		<div class="col3"><input type="button" name="dos" id="dos" value="2" onClick="componer('2');" class="botones" /></div>
		<div class="col3"><input type="button" name="tres" id="tres" value="3" onClick="componer('3');" class="botones" /></div>
	</div>
	<div class="dhor">
		<div class="col3"><input type="button" value="4" onClick="componer(4);" class="botones" /></div>
		<div class="col3"><input type="button" value="5" onClick="componer(5);" class="botones" /></div>
		<div class="col3"><input type="button" value="6" onClick="componer(6);" class="botones" /></div>
	</div>
	<div class="dhor">
		<div class="col3"><input type="button" value="7" class="botones" onClick="componer(7);" /></div>
		<div class="col3"><input type="button" value="8" class="botones" onClick="componer(8);" /></div>
		<div class="col3"><input type="button" value="9" class="botones" onClick="componer(9);" /></div>
	</div>
	<div class="dhor">
		<div class="col1"><input type="button" value="0" onClick="componer(0);" class="botones" /></div>
	</div>
	<div class="dhor">
		<div class="col1">
			<input type="button" value="Enviar" onClick="cargarid(document.getElementById('display').value,2);" class="botones" />
			<input type="button" value="Cancelar" onClick="cargarid(document.getElementById('display').value,0);" class="botones" />
		</div>
	</div>	
</div>

-->

<center>


<div id="contenDigiDoc" class="" style="width: 30rem; margin: 4%; height: 36rem;" >

<center>
<form name="regisDoc" class="form-regisDoc">

  <input class="regisInput" type="text" name="display" id="display" value="" placeholder="Documento">
  <br>
  <input class="btn-regisDoc" type="button" name="uno" id="uno" value="1" onClick="componer('1');">
  <input class="btn-regisDoc" type="button" name="dos" id="dos" value="2" onClick="componer('2');">
  <input class="btn-regisDoc" type="button" name="tres" id="tres" value="3" onClick="componer('3');">

  <br>
  <input class="btn-regisDoc" type="button" name="cuatro" id="cuatro" value="4" onClick="componer('4');">
  <input class="btn-regisDoc" type="button" name="cinco" id="cinco" value="5" onClick="componer('5');">
  <input class="btn-regisDoc" type="button" name="seis" id="seis" value="6" onClick="componer('6');">
  
  <br>
  <input class="btn-regisDoc" type="button" name="siete" id="siete" value="7" onClick="componer('7');">
  <input class="btn-regisDoc" type="button" name="ocho" id="ocho" value="8" onClick="componer('8');">
  <input class="btn-regisDoc" type="button" name="nueve" id="nueve" value="9" onClick="componer('9');">

  <br>
  <input class="btn-regisDoc" type="button" value="0" id="0" value="0" onClick="componer('0');">
  <input class="btn-regisDoc" type="button" value="Cancelar" onClick="cargarid(document.getElementById('display').value,0);">
  <input class="btn-regisDoc" type="reset" value="Borrar" style="background: rgb(233, 82, 82); ">
  <input class="btn-regisDoc" type="button" value="Enviar" onClick="cargarid(document.getElementById('display').value,2);" style="background:#CCE253; ">
 
  </form>

  </div>


</center>