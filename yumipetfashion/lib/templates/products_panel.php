<?php
/**
* Implements panel functionality common to most product-listing panels
*
*/
class PRODUCTS_PANEL extends PANEL
{
	public function getProductQuery($where = '', $order = '', $limit = null, $start = null)
	{
		$additionalColumns = array(
			'FLOOR(prodratingtotal/prodnumratings) AS prodavgrating',
			getProdCustomerGroupPriceSQL()
		);

		$additionalJoins = array();
		$query = "
			SELECT p.*, pi.*, ".implode(', ', $additionalColumns)."
			FROM [|PREFIX|]products p
			LEFT JOIN [|PREFIX|]product_images pi ON (p.productid=pi.imageprodid AND pi.imageisthumb=1)
			".implode("\n", $additionalJoins)."
			WHERE p.prodvisible=1
		";

		if($where) {
			$query .= " AND ".$where;
		}
		$query .= getProdCustomerGroupPermissionsSQL();

		if($order) {
			$query .= " ORDER BY ".$order;
		}

		if($start !== null) {
			$query .= " OFFSET ".(int)$start;
		}

		if($limit !== null) {
			$query .= " LIMIT ".(int)$limit;
		}

		return $query;
	}

	public function setProductGlobals($row)
	{
		if($GLOBALS['AlternateClass'] == 'Odd') {
			$GLOBALS['AlternateClass'] = 'Even';
		}
		else {
			$GLOBALS['AlternateClass'] = 'Odd';
		}

		$GLOBALS['ProductCartQuantity'] = '';
		if(isset($GLOBALS['CartQuantity'.$row['productid']])) {
			$GLOBALS['ProductCartQuantity'] = (int)$GLOBALS['CartQuantity'.$row['productid']];
		}

		$GLOBALS['ProductId'] = (int)$row['productid'];
		$GLOBALS['ProductName'] = isc_html_escape(ucwords(strtolower($row['prodname'])));
		$GLOBALS['ProductLink'] = ProdLink($row['prodname']);
		$GLOBALS['ProductRating'] = (int)$row['prodavgrating'];

		// Determine the price of this product
		$GLOBALS['ProductPrice'] = '';
		if (GetConfig('ShowProductPrice') && !$row['prodhideprice']) {
			$GLOBALS['ProductPrice'] = formatProductCatalogPrice($row);
		}

		// Workout the product description
		$desc = strip_tags($row['proddesc']);

		if (isc_strlen($desc) < 120) {
			$GLOBALS['ProductSummary'] = $desc;
		} else {
			$GLOBALS['ProductSummary'] = isc_substr($desc, 0, 120) . "...";
		}

		$GLOBALS['ProductThumb'] = ImageThumb($row, ProdLink($row['prodname']));
		$GLOBALS['ProductDate'] = isc_date(GetConfig('DisplayDateFormat'), $row['proddateadded']);

		$GLOBALS['ProductPreOrder'] = false;
		$GLOBALS['ProductReleaseDate'] = '';
		$GLOBALS['HideProductReleaseDate'] = 'display:none';

		if ($row['prodpreorder']) {
			$GLOBALS['ProductPreOrder'] = true;
			if ($row['prodreleasedate'] && $row['prodreleasedateremove'] && time() >= (int)$row['prodreleasedate']) {
				$GLOBALS['ProductPreOrder'] = false;
			} else if ($row['prodreleasedate']) {
				$GLOBALS['ProductReleaseDate'] = GetLang('ProductListReleaseDate', array('releasedate' => isc_date(GetConfig('DisplayDateFormat'), (int)$row['prodreleasedate'])));
				$GLOBALS['HideProductReleaseDate'] = '';
			}
		}

		if (isId($row['prodvariationid']) || trim($row['prodconfigfields'])!='' || $row['prodeventdaterequired'] == 1) {
			$GLOBALS['ProductURL'] = ProdLink($row['prodname']);
			/* EDAZCOMMERCE */
			//$GLOBALS['ProductAddText'] = GetLang('ProductChooseOptionLink');
			$GLOBALS['ProductAddText'] = '<input type="image" src="%%GLOBAL_IMG_PATH%%/%%GLOBAL_SiteColor%%/ProductVariation.png" alt="Comprar" width="110" height="22"/>';
		} else {
			$GLOBALS['ProductURL'] = CartLink($row['productid']);
			if ($GLOBALS['ProductPreOrder']) {
				$GLOBALS['ProductAddText'] = GetLang('ProductPreOrderCartLink');
			} else {
				$GLOBALS['ProductAddText'] = GetLang('ProductAddToCartLink');
			}
			/* EDAZCOMMERCE */
			$GLOBALS['ProductAddText'] = '<input type="image" src="%%GLOBAL_IMG_PATH%%/%%GLOBAL_SiteColor%%/AddCartButton.gif" alt="Comprar" width="110" height="22"/>';
		}
		
		if (CanAddToCart($row) && GetConfig('ShowAddToCartLink')) {
			$GLOBALS['HideActionAdd'] = '';
			/* EDAZCOMMERCE - PRODUTO INDISPON�VEL (AVISE-ME QUANDO CHEGAR) */
			$GLOBALS['HideProdutoIndisponivel'] = 'displayNone';
			$GLOBALS['HideParcelamentoProduto'] = '';
		} else {
			/* EDAZCOMMERCE - PRODUTO INDISPON�VEL (AVISE-ME QUANDO CHEGAR) */
			$naoControlaEstoque 		 = 0;
			$controlaEstoqueNormal 		 = 1;
			$controlaEstoquePelaVariacao = 2;
			if($row['prodhideprice'] != 1 && 
					(($row['prodinvtrack'] == $naoControlaEstoque || $row['prodinvtrack'] == $controlaEstoquePelaVariacao) || ($row['prodinvtrack'] == $controlaEstoqueNormal  && $row['prodcurrentinv'] > '0'))){
				$GLOBALS['HideActionAdd'] 			= '';
				$GLOBALS['HideProdutoIndisponivel'] = 'displayNone';
				$GLOBALS['HideParcelamentoProduto'] = '';
			}else{
				$GLOBALS['HideActionAdd'] 			= 'none';
				$GLOBALS['HideProdutoIndisponivel'] = '';
				$GLOBALS['HideParcelamentoProduto'] = 'displayNone';
			}
		}
		
		$GLOBALS['HideProductVendorName'] = 'display: none';
		$GLOBALS['ProductVendor'] = '';
		if(GetConfig('ShowProductVendorNames') && $row['prodvendorid'] > 0) {
			$vendorCache = $GLOBALS['ISC_CLASS_DATA_STORE']->Read('Vendors');
			if(isset($vendorCache[$row['prodvendorid']])) {
				$GLOBALS['ProductVendor'] = '<a href="'.VendorLink($vendorCache[$row['prodvendorid']]).'">'.isc_html_escape($vendorCache[$row['prodvendorid']]['vendorname']).'</a>';
				$GLOBALS['HideProductVendorName'] = '';
			}
		}
	}
}