<?php

// Informa��es para conex�o
$serverName = "localhost";
$usuarioDB  = "root";
$senhaDB	= "";
$bancoDados = "yumipetfashion";

// Realizando conex�o e selecioando banco de dados
$conexaoDB 		= mysql_connect($serverName, $usuarioDB, $senhaDB) or print(mysql_error());
$selecionaBanco = mysql_select_db($bancoDados,$conexaoDB) or print(mysql_error());

// Alterando o charset para utf8, para evitar problemas de acentua��o
//mysql_set_charset('utf8');

?>
