<?php

CLASS ISC_TOPMENU_PANEL extends PANEL
{
	public function SetPanelSettings()
	{
		// Are gift certificates enabled? If so, we need to show the gift certificates link
		if(gzte11(ISC_LARGEPRINT) && GetConfig('EnableGiftCertificates') != 0) {
			$GLOBALS['SNIPPETS']['TopMenuGiftCertificates'] = $GLOBALS['ISC_CLASS_TEMPLATE']->GetSnippet("TopMenuGiftCertificates");
		}
		// Show the login/logout link as required

		$GLOBALS['HideLogoutLink'] = 'display: none';
		
		if(!isset($GLOBALS['LoginOrLogoutText'])) {

			if(CustomerIsSignedIn()) {
				$usuarioLogado = true;
				// If they're a customer, set their name so it's available in the templates
				$c = GetClass('ISC_CUSTOMER');
				$customerData = $c->GetCustomerDataByToken();
				$GLOBALS['CurrentCustomerFirstName'] = isc_html_escape($customerData['custconfirstname']);
				$GLOBALS['CurrentCustomerLastName'] = isc_html_escape($customerData['custconlastname']);
				$GLOBALS['CurrentCustomerEmail'] = isc_html_escape($customerData['custconemail']);

				$GLOBALS['LoginOrLogoutLink'] = "login.php?action=logout";
				//$GLOBALS['LoginOrLogoutText'] = sprintf(GetLang('LogoutLink'), $GLOBALS['ShopPathNormal']);
				$GLOBALS['LoginOrLogoutText'] = 'Ol&aacute; <b>'.$GLOBALS['CurrentCustomerFirstName'].'!</b> </a>
						 ( <a href="'.$GLOBALS['ShopPathNormal'].'/account.php">Meus Dados</a>
						   <a href="'.$GLOBALS['ShopPathNormal'].'/account.php?action=order_status">Meus Pedidos</a>
						   <a href="'.$GLOBALS['ShopPathNormal'].'/login.php?action=logout">Sair</a> )';
				
				$GLOBALS['HideLogoutLink'] = '';
			}else{
				$usuarioLogado = false;
				$loginLinkFunction = '';
				$createAccountLinkFunction = '';
				$GLOBALS['OptimizerLinkScript'] = $this -> insertOptimizerLinkScript();
				if($GLOBALS['OptimizerLinkScript'] != '') {
					$loginLinkFunction = "gwoTracker._link(\"".$GLOBALS['ShopPathSSL']."/login.php?tk=".session_id()."\"); return false;";
					$createAccountLinkFunction = "gwoTracker._link(\"".$GLOBALS['ShopPathSSL']."/login.php?action=create_account&tk=".session_id()."\"); return false;";

				}
				// If they're a guest, set their name to 'Guest'
				$GLOBALS['CurrentCustomerFirstName'] = GetLang('Guest');
				$GLOBALS['CurrentCustomerLastName'] = $GLOBALS['CurrentCustomerEmail'] = '';

				$GLOBALS['LoginOrLogoutLink'] = "login.php";
				$GLOBALS['LoginOrLogoutText'] = sprintf(GetLang('SignInOrCreateAccount'), $GLOBALS['ShopPath'], $loginLinkFunction, $GLOBALS['ShopPath'], $createAccountLinkFunction);
			}
		}else{
			$usuarioLogado = false;
		}
		
		/* EDAZCOMMERCE - CRIAR OS CAMPOS DE LOGIN NO HEADER POR AQUI, PARA N�O ENTRAR EM CONFLITO COM O LOGIN DO CHECKOUT */
		$GLOBALS['FieldsLoginHeader'] = '<input type="text" class="InputTexto InitialFocus" name="login_email" id="login_email" size="35" />
						<input type="password" class="InputTexto" name="login_pass" id="login_pass" />
						<input type="submit" id="id="LoginButton"" value="Entrar" />';
		
		/* EDAZCOMMERCE - USU�RIO DESLOGADO DO SISTEMA */
		$GLOBALS['UsuarioLogado'] = $usuarioLogado;
		if($usuarioLogado){
			$GLOBALS['DisplayLoginHome'] 		= "displayNone";
			$GLOBALS['ClassWelcomeMessageUser'] = "width600";
		}else{
			/* DESABILITA OS CAMPOS PARA LOGIN NO HEADER QUANDO ESTIVER NO CHECKOUT */
			if(!isset($GLOBALS['PanelLoginJavaScript']) || (isset($GLOBALS['PanelLoginJavaScript']) && $GLOBALS['PanelLoginJavaScript'] != 'desabilitadoCheckout')){
				$GLOBALS['PanelLoginJavaScript'] = "%%Panel.LoginJavaScript%%";
			}
		}
		if($GLOBALS['PanelLoginJavaScript'] == 'desabilitadoCheckout'){
			$GLOBALS['FieldsLoginHeader']	 = "";
			$GLOBALS['PanelLoginJavaScript'] = "";
		}

		// Display our currency flags. Has been disabled for the time being. Theory being that this will include the whole locale (text aswell)
		$GLOBALS['CurrencyFlags'] = "";
	}


	public function insertOptimizerLinkScript()
	{

		// if it's not using shared ssl,  do nothing
		if(GetConfig('UseSSL') != 2) {
			return;
		}

		$trackingScript = '';

		//we are here, means the store is using a shared ssl, the checkout page is on a different domain, check if and of the storewide test using finish order page as conversion page, if so, this test is a cross domain test, we need to modify the process to checkout link on the cart page so it pass the user cookies to the checkout page.
		$optimizerStorewide = GetClass('ISC_OPTIMIZER');
		$secondDomainPages = array('AccountCreated');
		$linkScript = $optimizerStorewide->getLinkScriptForConversionPage($secondDomainPages);

		//No storewide optimizer test is using finish order page as conversion page. we need to check the product/category/page based tests.
		if($linkScript == '') {
			$optimizerPerPage = GetClass('ISC_OPTIMIZER_PERPAGE');
			$linkScript = $optimizerPerPage->getLinkScriptForConversionPage($secondDomainPages);
		}

		return $linkScript;
	}
}