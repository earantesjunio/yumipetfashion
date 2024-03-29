<?php
function ValorProduto($produto) {
		$query = "SELECT * FROM [|PREFIX|]products where productid=".$produto;
		$result = $GLOBALS['ISC_CLASS_DB']->Query($query);
		$a = $GLOBALS['ISC_CLASS_DB']->Fetch($result);
		
$GLOBALS['ISC_CLASS_CUSTOMER'] = GetClass('ISC_CUSTOMER');
$g = $GLOBALS['ISC_CLASS_CUSTOMER']->GetCustomerGroup();

//print_r($g);

$valor = $a['prodcalculatedprice']-(($a['prodcalculatedprice']/100)*$g['discount']);

return $valor;

}

function FreteTipo($produto) {
		$query = "SELECT * FROM [|PREFIX|]products where productid=".$produto;
		$result = $GLOBALS['ISC_CLASS_DB']->Query($query);
		$dados = $GLOBALS['ISC_CLASS_DB']->Fetch($result);
		if($dados['prodfreeshipping']==1){
		$d = '<img src="%%GLOBAL_AppPath%%/modificacoes/frete_gratis.png" border="0">';
		return $d;
		}else{
		$s = '<img src="%%GLOBAL_AppPath%%/modificacoes/frete_pago.gif" border="0">';
		return $s;
		}
}
		
function jurosSimples($valor, $taxa, $parcelas) {
$taxa = $taxa/100;
$m = $valor * (1 + $taxa * $parcelas);
$valParcela = $m/$parcelas;
return $valParcela;
}

function jurosComposto($valor, $taxa, $parcelas) {
$taxa = $taxa/100;
$valParcela = $valor * pow((1 + $taxa), $parcelas);
$valParcela = $valParcela/$parcelas;
return $valParcela;
}

function simulador_de_rodape($produto){

$ler = "select * from [|PREFIX|]module_vars where modulename = 'addon_parcelas' and variablename = 'rodape1' or variablename = 'rodape2' order by variablename asc";
$resultado = $GLOBALS['ISC_CLASS_DB']->Query($ler);
$parcelador = "";
while ($s = $GLOBALS['ISC_CLASS_DB']->Fetch($resultado)) {

//inicio do switch
switch($s['variableval']) {


case 'shopline':
$ativo = GetModuleVariable('checkout_itaushopline','is_setup');
$nome = GetModuleVariable('checkout_itaushopline','displayname');
$boleto = '';
$facil = '';
$finan = '';
$trans = '';
if(!empty($ativo)) {
//verifica o desconto
$valordoproduto = ValorProduto($produto);
$msg = "";
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg .= " ou <span class='destaque'>1x</span> de <span class='destaque'> ".$preco."</span> no <span class='destaque'>itau shopline</span> ";
//inicio do codigo do parcelamento
$parcelador .= $msg.'</fbr>';
//fim do codigo de parcelamento
}
break;


case 'bbofice':
$ativo = GetModuleVariable('checkout_bbcomercio','is_setup');
$nome = GetModuleVariable('checkout_bbcomercio','displayname');
$boleto = '';
$facil = '';
$finan = '';
$trans = '';
if(!empty($ativo)) {
//verifica o desconto
$valordoproduto = ValorProduto($produto);
$msg = "";
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg .= " ou <span class='destaque'>1x</span> de <span class='destaque'> ".$preco."</span> no <span class='destaque'>bb ofice bank</span> ";


//inicio do codigo do parcelamento
$parcelador .= $msg.'</br>';
//fim do codigo de parcelamento
}
break;


case 'sps1':
$ativo = GetModuleVariable('checkout_spsbradesco','is_setup');
$nome = GetModuleVariable('checkout_spsbradesco','displayname');
$boleto = GetModuleVariable('checkout_spsbradesco','pagboletos');
$facil = GetModuleVariable('checkout_spsbradesco','pagfacil');
$finan = GetModuleVariable('checkout_spsbradesco','pagfinan');
$trans = GetModuleVariable('checkout_spsbradesco','pagtrans');
if(!empty($ativo)) {
//verifica o desconto
$valordoproduto = ValorProduto($produto);
$msg = "";
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg .= " ou <span class='destaque'>1x</span> de <span class='destaque'> ".$preco."</span> no <span class='destaque'>bradesco online</span> ";



//inicio do codigo do parcelamento
$parcelador .= $msg.'</br>';
//fim do codigo de parcelamento
}
break;


case 'dinners':
$ativo = GetModuleVariable('checkout_dinners','is_setup');
$nome = GetModuleVariable('checkout_dinners','displayname');
$div = GetModuleVariable('checkout_dinners','div');
$juross = '0';
$taxa = GetModuleVariable('checkout_dinners','juros');
$jt = GetModuleVariable('checkout_dinners','tipojuros');

$pm = GetModuleVariable('checkout_dinners','parcelamin');

if(!empty($ativo)) {
//verifica o juros
$valordoproduto = ValorProduto($produto);
$valor = $valordoproduto;
if($juross<=0 OR empty($juross)){
$valor = $valor;
} else {
$valor = (($valor/100)*$juross)+$valor;
}

$msg = '';
$msg1 = '';
$splitss = (int) ($valor/$pm);
if($splitss<=$div){
$div = $splitss;
}else{
$div = $div;
}
if($valor<=$pm){
$div = 1;
}

for($j=1; $j<=$div;$j++) {
if($div==$j){
if($jt==0)
$parcelas = jurosSimples($valor, $taxa, $j);
else
$parcelas = jurosComposto($valor, $taxa, $j);

$parcelas = number_format($parcelas, 2, '.', '');
$valors = number_format($valor, 2, '.', '');

$op = GetModuleVariable('checkout_dinners','jurosde');
if($op>=$j) {
$msg .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($valors/$j, 1, 0)."</span> sem juros no <span class='destaque'>diners</span> ";
}else{
$msg1 .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($parcelas, 1, 0)."</span> com juros no <span class='destaque'>diners</span> ";
}
}
}
//inicio do codigo do parcelamento
$parcelador .= $msg.''.$msg1.'</br>';
//fim do codigo de parcelamento
}
break;


case 'master':
$ativo = GetModuleVariable('checkout_mastercard','is_setup');
$nome = GetModuleVariable('checkout_mastercard','displayname');
$div = GetModuleVariable('checkout_mastercard','div');
$juross = '0';
$taxa = GetModuleVariable('checkout_mastercard','juros');
$jt = GetModuleVariable('checkout_mastercard','tipojuros');

$pm = GetModuleVariable('checkout_mastercard','parcelamin');

if(!empty($ativo)) {
//verifica o juros
$valordoproduto = ValorProduto($produto);
$valor = $valordoproduto;
if($juross<=0 OR empty($juross)){
$valor = $valor;
} else {
$valor = (($valor/100)*$juross)+$valor;
}

$msg = '';
$msg1 = '';
$splitss = (int) ($valor/$pm);
if($splitss<=$div){
$div = $splitss;
}else{
$div = $div;
}
if($valor<=$pm){
$div = 1;
}

for($j=1; $j<=$div;$j++) {
if($div==$j){
if($jt==0)
$parcelas = jurosSimples($valor, $taxa, $j);
else
$parcelas = jurosComposto($valor, $taxa, $j);

$parcelas = number_format($parcelas, 2, '.', '');
$valors = number_format($valor, 2, '.', '');

$op = GetModuleVariable('checkout_mastercard','jurosde');
if($op>=$j) {
$msg .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($valors/$j, 1, 0)."</span> sem juros no <span class='destaque'>mastercard</span> ";
}else{
$msg1 .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($parcelas, 1, 0)."</span> com juros no <span class='destaque'>mastercard</span> ";
}
}
}
//inicio do codigo do parcelamento
$parcelador .= $msg.''.$msg1.'</br>';
//fim do codigo de parcelamento
}
break;


case 'visadebito':
$ativo = GetModuleVariable('checkout_visanet','is_setup');
$nome = GetModuleVariable('checkout_visanet','displayname');
$desc = GetModuleVariable('checkout_visanet','desconto');

if(!empty($ativo)) {
//verifica o desconto
$valordoproduto = ValorProduto($produto);
if($desc<=0 OR empty($desc)){
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg = " ou <span class='destaque'>1x</span> de <span class='destaque'>".$preco."</span> a vista no <span class='destaque'>visa electron</span> ";
} else {
$valven = ($valordoproduto/100)*$desc;
$preco = CurrencyConvertFormatPrice($valordoproduto-$valven, 1, 0);
$msg = " ou <span class='destaque'>1x</span> de <span class='destaque'>".$preco."</span> com <span class='destaque'>".$desc."%</span> de desconto no <span class='destaque'>visa electron</span> ";
}
//inicio do codigo do parcelamento
$parcelador .= $msg.'</br>';
//fim do codigo de parcelamento
}
break;

case 'visacredito':
$ativo = GetModuleVariable('checkout_visanet','is_setup');
$nome = GetModuleVariable('checkout_visanet','displayname');
$div = GetModuleVariable('checkout_visanet','div');
$juross = '0';
$taxa = GetModuleVariable('checkout_visanet','juros');
$jt = GetModuleVariable('checkout_visanet','tipojuros');

$pm = GetModuleVariable('checkout_visanet','parcelamin');

if(!empty($ativo)) {
//verifica o juros
$valordoproduto = ValorProduto($produto);
$valor = $valordoproduto;
if($juross<=0 OR empty($juross)){
$valor = $valor;
} else {
$valor = (($valor/100)*$juross)+$valor;
}

$msg = '';
$msg1 = '';
$splitss = (int) ($valor/$pm);
if($splitss<=$div){
$div = $splitss;
}else{
$div = $div;
}
if($valor<=$pm){
$div = 1;
}

for($j=1; $j<=$div;$j++) {
if($div==$j){
if($jt==0)
$parcelas = jurosSimples($valor, $taxa, $j);
else
$parcelas = jurosComposto($valor, $taxa, $j);

$parcelas = number_format($parcelas, 2, '.', '');
$valors = number_format($valor, 2, '.', '');

$op = GetModuleVariable('checkout_visanet','jurosde');
if($op>=$j) {
$msg .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($valors/$j, 1, 0)."</span> sem juros no <span class='destaque'>visa</span> ";
}else{
$msg1 .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($parcelas, 1, 0)."</span> com juros no <span class='destaque'>visa</span> ";
}
}
}
//inicio do codigo do parcelamento
$parcelador .= $msg.''.$msg1.'</br>';
//fim do codigo de parcelamento
}
break;




case 'paypal':
$ativo = GetModuleVariable('checkout_paypal','is_setup');
$desc = GetModuleVariable('checkout_paypal','desconto');
$nome = GetModuleVariable('checkout_paypal','displayname');
if(!empty($ativo)) {
//verifica o desconto
$valordoproduto = ValorProduto($produto);
if($desc<=0 OR empty($desc)){
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg = " ou <span class='destaque'>1x</span> de <span class='destaque'>".$preco."</span> a vista no <span class='destaque'>paypal</span> ";
} else {
$valven = ($valordoproduto/100)*$desc;
$preco = CurrencyConvertFormatPrice($valordoproduto-$valven, 1, 0);
$msg = " ou <span class='destaque'>1x</span> de <span class='destaque'>".$preco."</span> com <span class='destaque'>".$desc."%</span> de desconto no <span class='destaque'>paypal</span> ";
}
//inicio do codigo do parcelamento
$parcelador .= $msg.'</br>';
//fim do codigo de parcelamento
}
break;


case 'dinheiromail':
$ativo = GetModuleVariable('checkout_dinheiromail','is_setup');
$juross = GetModuleVariable('checkout_dinheiromail','acrecimo');
$nome = GetModuleVariable('checkout_dinheiromail','displayname');
$taxa = 0.0199;
if(!empty($ativo)) {
//verifica o juros
$valordoproduto = ValorProduto($produto);
$valor = $valordoproduto;
if($juross<=0 OR empty($juross)){
$valor = $valor;
} else {
$valor = (($valor/100)*$juross)+$valor;
}

$msg = '';
$msg1 = '';
$splitss = (int) ($valor/5);
if($splitss<=12){
$div = $splitss;
}else{
$div = 12;
}
if($valor<=5){
$div = 1;
}

for($j=1; $j<=$div;$j++) {

if($div==$j){
$parcelas = jurosSimples($valor, 1.99, $j);
$parcelas = number_format($parcelas, 2, '.', '');
$valors = number_format($valor, 2, '.', '');
$op = GetModuleVariable('checkout_dinheiromail','jurosde');
if($j==1 OR $op>=$j) {
$msg .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($valors/$j, 1, 0)."</span> sem juros no <span class='destaque'>dinheiromail</span> ";
}else{
$msg1 .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($parcelas, 1, 0)."</span> com juros no <span class='destaque'>dinheiromail</span> ";
}
}
}
//inicio do codigo do parcelamento
$parcelador .= $msg.''.$msg1.'</br>';
//fim do codigo de parcelamento
}
break;



case 'moip':
$ativo = GetModuleVariable('checkout_moip','is_setup');
$juross = GetModuleVariable('checkout_moip','acrecimo');
$nome = GetModuleVariable('checkout_moip','displayname');
$taxa = 0.0199;
if(!empty($ativo)) {
//verifica o juros
$valordoproduto = ValorProduto($produto);
$valor = $valordoproduto;
if($juross<=0 OR empty($juross)){
$valor = $valor;
} else {
$valor = (($valor/100)*$juross)+$valor;
}

$msg = '';
$msg1 = '';
$splitss = (int) ($valor/5);
if($splitss<=12){
$div = $splitss;
}else{
$div = 12;
}
if($valor<=5){
$div = 1;
}
//echo $div."<br>";
for($j=1; $j<=$div;$j++) {
if($div==$j){
$cf = pow((1 + $taxa), $j);
$cf = (1 / $cf);
$cf = (1 - $cf);
$cf = ($taxa / $cf);
//echo $cf."<br>";
$parcelas = ($valor*$cf);
//echo $parcela."<br>";
$parcelas = number_format($parcelas, 2, '.', '');
//echo $parcela."<br>";
$valors = number_format($valor, 2, '.', '');
$op = GetModuleVariable('checkout_moip','jurosde');
if($j==1 OR $op>=$j) {
$msg .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($valors/$j, 1, 0)."</span> sem juros no <span class='destaque'>moip</span> ";
}else{
$msg1 .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($parcelas, 1, 0)."</span> com juros no <span class='destaque'>moip</span> ";
}
}
}
//inicio do codigo do parcelamento
$parcelador .= $msg.''.$msg1.'</br>';
//fim do codigo de parcelamento
}
break;

case 'pagdigital':
$ativo = GetModuleVariable('checkout_pagamentodigital','is_setup');
$juross = GetModuleVariable('checkout_pagamentodigital','acrecimo');
$nome = GetModuleVariable('checkout_pagamentodigital','displayname');
$taxa = 0.0199;
if(!empty($ativo)) {
//verifica o juros
$valordoproduto = ValorProduto($produto);
$valor = $valordoproduto;
if($juross<=0 OR empty($juross)){
$valor = $valor;
} else {
$valor = (($valor/100)*$juross)+$valor;
}

$msg = '';
$msg1 = '';
$splitss = (int) ($valor/5);
if($splitss<=12){
$div = $splitss;
}else{
$div = 12;
}
if($valor<=5){
$div = 1;
}

for($j=1; $j<=$div;$j++) {
if($div==$j){

$parcelas = jurosComposto($valor, 1.99, $j);

$parcelas = number_format($parcelas, 2, '.', '');
$valors = number_format($valor, 2, '.', '');

$op = GetModuleVariable('checkout_pagamentodigital','jurosde');
if($j==1 OR $op>=$j) {
$msg .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($valors/$j, 1, 0)."</span> sem juros no <span class='destaque'>Pagamento Digital</span> ";
}else{
$msg1 .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($parcelas, 1, 0)."</span> com juros no <span class='destaque'>Pagamento Digital</span> ";
}
}
}
//inicio do codigo do parcelamento
$parcelador .= $msg.''.$msg1.'</br>';
//fim do codigo de parcelamento
}
break;

case 'pagseguro':
$ativo = GetModuleVariable('checkout_pagseguro','is_setup');
$juross = GetModuleVariable('checkout_pagseguro','acrecimo');
$nome = GetModuleVariable('checkout_pagseguro','displayname');
$taxa = 0.0199;
if(!empty($ativo)) {
//verifica o juros
$valordoproduto = ValorProduto($produto);
$valor = $valordoproduto;
if($juross<=0 OR empty($juross)){
$valor = $valor;
} else {
$valor = (($valor/100)*$juross)+$valor;
}

$msg = '';
$msg1 = '';
$splitss = (int) ($valor/5);
if($splitss<=12){
$div = $splitss;
}else{
$div = 12;
}
if($valor<=5){
$div = 1;
}
//echo $div."<br>";
for($j=1; $j<=$div;$j++) {
$cf = pow((1 + $taxa), $j);
$cf = (1 / $cf);
$cf = (1 - $cf);
$cf = ($taxa / $cf);
//echo $cf."<br>";
$parcelas = ($valor*$cf);
//echo $parcela."<br>";
$parcelas = number_format($parcelas, 2, '.', '');
//echo $parcela."<br>";
$valors = number_format($valor, 2, '.', '');
$op = GetModuleVariable('checkout_pagseguro','jurosde');
if($div==$j){
if($j==1 OR $op>=$j) {
$msg .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($valors/$j, 1, 0)."</span> sem juros no <span class='destaque'>Pagseguro</span> ";
}else{
$msg1 .=" ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($parcelas, 1, 0)."</span> com juros no <span class='destaque'>Pagseguro</span> ";
}
}
}
//inicio do codigo do parcelamento
$parcelador .= $msg.''.$msg1;
//fim do codigo de parcelamento
}
break;


case 'boleto': //boleto
$desc = GetModuleVariable('addon_parcelas','descboleto');

//verifica o desconto
$valordoproduto = ValorProduto($produto);
if($desc<=0){
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg = " ou <span class='destaque'>1x</span> de <span class='destaque'> ".$preco."</span> no <span class='destaque'>boleto</span> ";
} else {
$valven = ($valordoproduto/100)*$desc;
$preco = CurrencyConvertFormatPrice($valordoproduto-$valven, 1, 0);
$msg = " ou <span class='destaque'>1x</span> de <span class='destaque'>".$preco."</span> com <span class='destaque'>".$desc."%</span> de desconto no <span class='destaque'>boleto</span> ";
}
//inicio do codigo do parcelamento
$parcelador .= $msg.'</br>';
break; // fim boleto

case 'sps':
$ativo = GetModuleVariable('checkout_spsbradesco','is_setup');
$nome = GetModuleVariable('checkout_spsbradesco','displayname');
$boleto = GetModuleVariable('checkout_spsbradesco','pagboletos');
$facil = GetModuleVariable('checkout_spsbradesco','pagfacil');
$finan = GetModuleVariable('checkout_spsbradesco','pagfinan');
$trans = GetModuleVariable('checkout_spsbradesco','pagtrans');
if(!empty($ativo)) {
//verifica o desconto
$valordoproduto = ValorProduto($produto);
$msg = "";
$valordoproduto = ValorProduto($produto);
$msg = "";
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg .= " ou <span class='destaque'>1x</span> de <span class='destaque'> ".$preco."</span> no <span class='destaque'>bradesco online</span> ";
//inicio do codigo do parcelamento
$parcelador .= $msg.'</br>';
//fim do codigo de parcelamento
}
break;



case 'cheque':
$ativo = GetModuleVariable('checkout_cheque','is_setup');
$juros = GetModuleVariable('checkout_cheque','juros');
$nome = GetModuleVariable('checkout_cheque','displayname');
$div = GetModuleVariable('checkout_cheque','dividir');
$jde = GetModuleVariable('checkout_cheque','jurosde');
$pmin = GetModuleVariable('checkout_cheque','parmin');
if(!empty($ativo)) {
//verifica o juros
$valordoproduto = ValorProduto($produto);
if($juros<=0 OR empty($juros)){
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg = " ou <span class='destaque'>1x</span> de <span class='destaque'> ".$preco."</span> sem juros no <span class='destaque'>cheque</span> ";
} else {
$msg = '';
$msg1 = '';
$splits = (int) ($valordoproduto/$pmin);
if($splits<=$div){
$div = $splits;
}else{
$div = $div;
}
for ($j=1;$j<=$div;$j++) {
if($div==$j){
if ($jde<=$j and $jde<='50') {
$valven = ($valordoproduto/100)*$juros;
$msg1 .= " ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice(($valordoproduto+$valven)/$j, 1, 0)."</span> com juros no <span class='destaque'>cheque</span> ";
}else{
$msg .= " ou <span class='destaque'>".$j."x</span> de <span class='destaque'>".CurrencyConvertFormatPrice($valordoproduto/$j, 1, 0)."</span>sem juros no <span class='destaque'>cheque</span> ";
}
}
}
}
//inicio do codigo do parcelamento
$parcelador .= $msg.''.$msg1;
//fim do codigo de parcelamento
}
break;


case 'deposito': //deposito
$ativo = GetModuleVariable('checkout_deposito','is_setup');
$desc = GetModuleVariable('checkout_deposito','desconto');
$nome = GetModuleVariable('checkout_deposito','displayname');
if(!empty($ativo)) {
//verifica o desconto
$valordoproduto = ValorProduto($produto);
if($desc<=0 OR empty($desc)){
$preco = CurrencyConvertFormatPrice($valordoproduto, 1, 0);
$msg = " ou <span class='destaque'>".$preco."</span> a Vista no <span class='destaque'>Deposito</span> ";
} else {
$valven = ($valordoproduto/100)*$desc;
$preco = CurrencyConvertFormatPrice($valordoproduto-$valven, 1, 0);
$msg = " ou <span class='destaque'>".$preco."</span> com <span class='destaque'>".$desc."%</span> de Desconto no <span class='destaque'>Dep�sito em conta</span> ";
}
//inicio do codigo do parcelamento
$parcelador .= $msg;
//fim do codigo de parcelamento
}
break; // fim deposito

}

}

$parcelador = "<span class='parcelamento_label_produto " . $GLOBALS['HideParcelamentoProduto'] . "'>" . $parcelador . "</span>";
return $parcelador;
}
?>
