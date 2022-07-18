<?php
 // mysql_query ("SET NAMES 'utf8'");
  $ap= new mysqli("localhost","root","","digincap");//Creo el objeto
  if($ap->connect_errno ){
     echo "Fallo al conectar a MySQL: ". $ap->connect_error;
     return;    
  }
  //$conectarbd->set_charset("utf8");
  //mysql_query ("SET NAMES 'utf8'");
?>
