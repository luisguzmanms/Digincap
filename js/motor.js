function cargarid(indice, op){
	document.getElementById("vs").value=indice;
	document.getElementById("op").value=op;
	//alert(indice);
	document.getElementById("f1").submit();
	
}
function componer(numero){
	document.getElementById("display").value = document.getElementById("display").value + numero;
}
function limpiar(){
	document.getElementById("display").value="";
}
/*function enviarid(iden, op){
	document.getElementById("vs").value=indice;
	document.getElementById("op").value=op;
	document.getElementById("f1").submit();
}*/
