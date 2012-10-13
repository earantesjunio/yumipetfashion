<?php

	function getCategoriaDoProdutoVejaMaisHtml($codProduto){
		$query = "
		SELECT c.categoryid, c.catname
		FROM [|PREFIX|]categoryassociations ca
		LEFT JOIN [|PREFIX|]categories c ON (ca.categoryid = c.categoryid)
		WHERE ca.productid = " . $codProduto;
		
		$result 	= $GLOBALS['ISC_CLASS_DB']->Query($query);
		$categorias = $GLOBALS['ISC_CLASS_DB']->Fetch($result);
		
		/* RETORNA A PRIMEIRA CATEGORIA ASSOCIADA AO PRODUTO FORMATADA EM HTML */
		$retornoHtml = '';
		if(isset($categorias) && count($categorias) > 0){
			$retornoHtml = "
				<div class='wrapperVejaMaisCategoriaProduto'>
					<div class='labelVejaMais'>+ Veja mais:</div>
					<div class='wrapperVejaMais'>
						<div class='imgVejaMais'></div>
						<a href='" . CatLink($categorias['categoryid'], $categorias['catname'], false) . "'>
							<div class='nomeCategoria floatLeft'>" . ucwords(strtolower($categorias['catname'])) . "</div>
						</a>
					</div>
				</div>
			";
		}
		
		return $retornoHtml;
	}
	
	/**
	 *  Esta fun��o retorna uma data escrita da seguinte maneira:
	 *  Exemplo: Ter�a-feira, 17 de Abril de 20074. 
	 *  @param string $strDate data a ser analizada; por exemplo: 2007-04-17 15:10:596. 
	 *  @return string7. 
	 */
	 function getFormataDataExtenso($strDate){
	 	date_default_timezone_set("Brazil/East");
	 	
	 	// Array com os dia da semana em portugu�s;
	 	$arrDaysOfWeek = array('Domingo','Segunda-feira','Ter�a-feira','Quarta-feira','Quinta-feira','Sexta-feira','S�bado');
	 	// Array com os meses do ano em portugu�s;
	 	$arrMonthsOfYear = array(1 => 'Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
	 	// Dia da semana
	 	$intDayOfWeek = date('w',$strDate);
	 	// Dia do m�s
	 	$intDayOfMonth = date('d',$strDate);
	 	// M�s
	 	$intMonthOfYear = date('n',$strDate);
	 	// Ano
	 	$intYear = date('Y',$strDate);
		// Hora
		$intHora = date('H',$strDate);
		// Minuto
		$intMinuto = date('i',$strDate);
		// Segundo
		$intSegundo = date('s',$strDate);
		
	 	// Formato a ser retornado
	 	return $arrDaysOfWeek[$intDayOfWeek] . ', ' . $intDayOfMonth . ' de ' . $arrMonthsOfYear[$intMonthOfYear] . ' de ' . $intYear . ' - as ' . $intHora . ':' .  $intMinuto . ':' . $intSegundo;
	 }
	 
	 /**
	  * Retorna as Propriedades Globais Setadas do Endere�o de Fatura do Pedido
	  */
	 function getEnderecoDeFaturaDoPedido($codPedido, $billingAddressId=null){
	 	
	 	/* PEGA O ID DO ENDERE�O DE FATURA NO PEDIDO */
	 	if(!isset($billingAddressId)){
	 		$query 			  = " SELECT billing_address_id FROM [|PREFIX|]orders WHERE orderid = $codPedido ";
	 		$result 		  = $GLOBALS['ISC_CLASS_DB']->Query($query);
			$billingAddressId = $GLOBALS['ISC_CLASS_DB']->FetchOne($result);
	 	}
	 	
	 	/* PEGA UM ENDERE�O PELO ID E SETA PROPRIEDADES GLOBAIS */
	 	getEnderecoPeloId($billingAddressId);
	 	
	 }
	 
	 /**
	  * Retorna as Propriedades Globais Setadas do Endere�o de Entrega do Pedido
	  */
	 function getEnderecoDeEntregaDoPedido($codPedido, $shippingAddressId=null){
	 	
	 	/* PEGA O ID DO ENDERE�O DE ENTREGA NO PEDIDO */
	 	if(!isset($shippingAddressId)){
	 		$query 			  = " SELECT shipping_address_id FROM [|PREFIX|]order_addresses where order_id = $codPedido ";
	 		$result 		  = $GLOBALS['ISC_CLASS_DB']->Query($query);
			$shippingAddressId = $GLOBALS['ISC_CLASS_DB']->FetchOne($result);
	 	}
	 	
	 	/* PEGA UM ENDERE�O PELO ID E SETA PROPRIEDADES GLOBAIS */
	 	getEnderecoPeloId($shippingAddressId);
	 	
	 }
	 
	 /**
	  * Pega um Endre�o Pelo Id e Seta Propriedades Globais
	  */
	 function getEnderecoPeloId($addressId){
	 	
	 	/* PEGA O ENDERE�O DE FATURA PELO ID E SETA AS VARI�VEIS GLOBAIS */
		if(isset($addressId)){
			$query   = "SELECT * FROM [|PREFIX|]shipping_addresses WHERE shipid = $addressId ";
			$result  = $GLOBALS['ISC_CLASS_DB']->Query($query);
			$address = $GLOBALS['ISC_CLASS_DB']->fetch($result);
			
			/* VARI�VEIS GLOBAIS */
			$GLOBALS['ShipNome'] 			= ucwords(strtolower(isc_html_escape($address['shipfirstname'])));
			$GLOBALS['ShipSobrenome'] 		= ucwords(strtolower(isc_html_escape($address['shiplastname'])));
			$GLOBALS['ShipCompany'] 		= ucwords(strtolower(isc_html_escape($address['shipcompany'])));
			$GLOBALS['ShipAddressLines'] 	= ucwords(strtolower(isc_html_escape($address['shipaddress1'])));
			$GLOBALS['ShipSuburb'] 			= ucwords(strtolower(isc_html_escape($address['shipcity'])));
			$GLOBALS['ShipState'] 			= ucwords(strtolower(isc_html_escape($address['shipstate'])));
			$GLOBALS['ShipZip'] 			= ucwords(strtolower(isc_html_escape($address['shipzip'])));
			$GLOBALS['ShipCountry'] 		= ucwords(strtolower(isc_html_escape($address['shipcountry'])));
			$GLOBALS['ShipPhone'] 			= ucwords(strtolower(isc_html_escape($address['shipphone'])));
			$GLOBALS['ShipDataNascimento'] 	= ucwords(strtolower(isc_html_escape($address['shipdatanascimento'])));
			$GLOBALS['ShipNumero'] 			= ucwords(strtolower(isc_html_escape($address['shipnumero'])));
			$GLOBALS['ShipComplemento'] 	= ucwords(strtolower(isc_html_escape($address['shipcomplemento'])));
			$GLOBALS['ShipBairro'] 			= ucwords(strtolower(isc_html_escape($address['shipbairro'])));
			$GLOBALS['ShipCpf'] 			= ucwords(strtolower(isc_html_escape($address['shipcpf'])));
		}
	 	
	 }












?>
