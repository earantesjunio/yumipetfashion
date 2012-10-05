<?php
class ISC_FALECONOSCO
{

	public function __construct()
	{
		
	}
	
	public function HandlePage()
	{
		$solicitarOrcamento  = false;
		$codprod 			 = (isset($_REQUEST['codprod'])    && $_REQUEST['codprod'] 	 != '') ? $_REQUEST['codprod'] 	  : "";
		$tituloPagina		 = 'Entre em contato conosco';
		$emailRemetenteSite	 = GetConfig('OrderEmail');
		
		if($codprod != ''){
			$query  = " SELECT p.productid, p.prodname, pi.imagefilestd ";
			$query .= " FROM isc_products p, isc_product_images pi ";
			$query .= " WHERE p.productid   = $codprod ";
			$query .= " AND pi.imageprodid  = p.productid ";
			$query .= " AND pi.imageisthumb = 1 ";
			
			$result  = $GLOBALS['ISC_CLASS_DB']->Query($query);
			$produto = $GLOBALS['ISC_CLASS_DB']->Fetch($result);
			
			$solicitarOrcamento = true;
			$tituloPagina		= 'Solicita��o de Or�amento';
			$GLOBALS['FaleConoscoSolicitoOrcamentoaAssunto'] = "Solicita��o de Or�amento";
			$GLOBALS['FaleConoscoSolicitoOrcamentoMensagem'] = "Desejo receber or�amento e informa��es referentes ao produto " . $produto['prodname'] . " c�digo(" . $produto['productid'] . ").";
			$GLOBALS['FaleConoscoNomeProduto']   			 = $produto['prodname'];
			$GLOBALS['FaleConoscoImagemProduto'] 			 = $GLOBALS['ShopPathNormal'] . "/product_images/" . $produto['imagefilestd'];
		}
		
		$GLOBALS['TituloPagina'] 		   = $tituloPagina;
		$GLOBALS['EmailRemetenteSite']     = $emailRemetenteSite;
		$GLOBALS['HideSolicitarOrcamento'] = (!$solicitarOrcamento) ? "displayNone" : "";
		$GLOBALS['ISC_CLASS_TEMPLATE']->SetPageTitle($tituloPagina); //GetConfig('ContactUs')
		$GLOBALS['ISC_CLASS_TEMPLATE']->SetTemplate("faleconosco");
		$GLOBALS['ISC_CLASS_TEMPLATE']->ParseTemplate();
	}

}
