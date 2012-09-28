/*
	JQuery
*/
$(document).ready(function() {
	/* ===== INICIO - Menu de Categorias ===== */
	$('#menuHorizontal ul li').click(function(){
		var url = $(this).attr('url');
		if(url != undefined){
			window.location.href = url;
			return false;
		}
	});
	
	$('#menuHorizontal ul li ul li').click(function(){
		var url = $(this).attr('url');
		if(url != undefined){
			window.location.href = url;
			return false;
		}
	});
	
	$('#menuVertical li').click(function(){
		var url = $(this).attr('url');
		if(url != undefined){
			window.location.href = url;
			return false;
		}
	});
	
	$('#menuVertical ul li ul div li').click(function(){
		var url = $(this).attr('url');
		if(url != undefined){
			window.location.href = url;
			return false;
		}
	});
	
	/*** Painel do Cliente ***/
	$('#SideAccountMenu div ul li').click(function(){
		var url = $(this).attr('url');
		if(url != undefined){
			window.location.href = url;
			return false;
		}
	});
	
	/*** Painel de Novos Produtos ***/
	$('.attributes_wrapper_div div#SideNewProducts div.BlockContent ul li').click(function(){
		var url = $(this).attr('url');
		if(url != undefined){
			window.location.href = url;
			return false;
		}
	});
	/* ===== FIM - Menu de Categorias ===== */
	
	/* ===== SCROLL EM MENSAGEM DE AVISO NA TELA ===== */
	if($('.InfoMessage').length || $('.SuccessMessage').length || $('.ErrorMessage').length){
		var campoMensagem;
		
		if($('.InfoMessage').length){
			campoMensagem = $('.InfoMessage').eq(0);
		}else if($('.SuccessMessage').length){
			campoMensagem = $('.SuccessMessage').eq(0);
		}else if($('.ErrorMessage').length){
			campoMensagem = $('.ErrorMessage').eq(0);
		}
		$('html,body').animate({scrollTop: $(campoMensagem).offset().top - 35}, 1500);
	}
	
	/* ===== INICIO - CHECKOUT CIELO ===== */
	$('.checkout_cielo_parcelas_div > div > input:radio').click(function(){
		pegavalor();
	});
	/* ===== FIM - CHECKOUT CIELO ===== */
	
	/* ===== INICIO - BUSCA POR CEP ===== */
	$('.buscaCep').blur(function(event){
		var cep  	   = $.trim($(this).val()).replace('-', '').replace('_', '');
		var parentForm = $(this).parents('form');
		
		if(cep != "" && cep.length == 8){
			buscaCep($(this).val(), parentForm);
		}
	});
	/* ===== FIM - BUSCA POR CEP ===== */
	
	/* ===== INICIO - TRATAMENTO CAMPOS CADASTRO DO CLIENTE ===== */
	if($('.FormContainer').length){
		$('.FormContainer').find('input').each(function(){
			// Desabilita Campo Empresa
			if($(this).attr('attributeprivateid') == 'companyname'){ $(this).hide(); $(this).parent().prev().hide(); }
			// Mascara Data de CPF
			if($(this).attr('attributeprivateid') == 'cpf'){ $(this).mask("999.999.999-99"); }
			// Mascara Data de Nascimento
			if($(this).attr('attributeprivateid') == 'datanascimento'){ $(this).mask("99/99/9999"); }
			// Mascara de Telefone
			if($(this).attr('attributeprivateid') == 'phone'){ $(this).mask("(99) 9999-9999"); }
			// Mascara de Cep
			if($(this).attr('attributeprivateid') == 'zip'){ $(this).mask("99999-999"); }
		});
		$('.FormContainer').find('select').each(function(){
			//Desabilita Campo Pa�s
			if($(this).attr('attributeprivateid') == 'country'){ $(this).hide(); $(this).parent().prev().hide(); }
		});
	}
	/* ===== FIM - TRATAMENTO CAMPOS CADASTRO DO CLIENTE ===== */
	
	/* ===== INICIO - VARIA��O DE PRODUTOS ===== */
	$('.itemVariationProduct').click(function(){
		var valorAtributoSelecionado = $(this).attr('value');
		var indiceAtributoVariacao   = $(this).parents('.GrupoAtributoVariacaoProduto').eq(0).attr('indiceAtributoVariacao');
		
		if(!$(this).hasClass('itemVariationProductSelected') && !$(this).hasClass('itemVariationProductDisabled')){
			var qtdeAtributos = $('.GrupoAtributoVariacaoProduto').length;

			$('.GrupoAtributoVariacaoProduto').each(function(){
				if($(this).attr('indiceAtributoVariacao') >= indiceAtributoVariacao){
					$(this).find('li').removeClass('itemVariationProductSelected');
					
					// Desabilitando Atributos
					if($(this).attr('indiceAtributoVariacao') > indiceAtributoVariacao){
						$(this).find('li').addClass('itemVariationProductDisabled');
					}
				}
			});
			
			$(this).addClass('itemVariationProductSelected');
			
			// Mostra a Qtde de Estoque da Sele��o
			mostraQtdeEstoqueSelecao(indiceAtributoVariacao, qtdeAtributos);
			
			/* Carrega Atributos Disponiveis Para Sele��o */
			carregaAtributosDisponiveisParaSelecao(indiceAtributoVariacao, valorAtributoSelecionado);
			
			/* Ajax - Carrega do Servidor o Conteudo da Selecao de Atributos */
			carregaConteudoSelecaoServidorAjax();
		}
	});
	
	$('.itemVariationImageProduct').mouseover(function(){
		selecionarImagemVariacaoProduto($(this), 'mouseover');
	});
	
	$('.itemVariationImageProduct').mouseout(function(){
		if($(this).attr('imagemSelecionada') != true){
			var imgProduto  = $('.ProductThumbImage').find('img');
			var srcImageProdutoOriginal = $(imgProduto).attr('srcOriginalBKP');
			$(imgProduto).attr('src',srcImageProdutoOriginal);
		}
	});
	
	$('.itemVariationImageProduct').click(function(){
		$('.itemVariationImageProduct').removeAttr('imagemSelecionada');
		$(this).attr('imagemSelecionada','true');
		selecionarImagemVariacaoProduto($(this), 'click');
	});
	
	/* ===== FIM - VARIA��O DE PRODUTOS ===== */
	
	$('[alt=Comprar]').click(function(){
		window.location = $(this).parent().attr('href');
		return false;
	});
	
	/* Footer Links */
	$('#footerLinksCMS ul li a span').click(function(){
		var link;
		var nomeLink = $(this).html();
		
		if(nomeLink != ''){
			if(nomeLink.toLowerCase().indexOf('contato') != -1 ||
				nomeLink.toLowerCase().indexOf('fale conosco') != -1){
					carregaUrl(urlWebsite + '/fale_conosco/faleconosco.php', '900px');
					return false;
			}
		}
		
	});
	
	/* SLIDER */
	if(jQuery('.sliderCarousel').length != 0){
		jQuery('.sliderCarousel').tinycarousel({start: 2});
	}
	
	/* FORMAS DE PAGAMENTO - PAG DE PRODUTO */
	var cliqueHabilitado = true;
	
	/* Habilita o Primeiro Item */
	$('#bandeirasFormasPagamento li').eq(0).addClass('bandeiraSelecionada');
	$('#parcelasFormasPagamento div.ConteudoFormaPagamento').eq(0).addClass('parcelaSelecionada').show();
	$('#metodoPagamentoSelecionado').html($('#bandeirasFormasPagamento li').eq(0).attr('descricao'));
	
	$('#bandeirasFormasPagamento li img').click(function(){
		var countNumber     = $(this).parent().attr('count');
		var descricaoMetodo = $(this).parent().attr('descricao');
		
		if(cliqueHabilitado){
			cliqueHabilitado = false;
			
			$('#metodoPagamentoSelecionado').html(descricaoMetodo);
			
			$('#bandeirasFormasPagamento li').each(function(){
				if($(this).attr('count') == countNumber){
					$(this).addClass('bandeiraSelecionada');
				}else{
					$(this).removeClass('bandeiraSelecionada');
				}
			});
		
			$('#parcelasFormasPagamento div.ConteudoFormaPagamento').each(function(){
				if($(this).attr('count') == countNumber){
					$(this).addClass('parcelaSelecionada');
					$(this).slideDown('slow', function(){
						cliqueHabilitado = true;
					});
				}else{
					$(this).hide();
					$(this).removeClass('parcelaSelecionada');
				}
			});
		}
	});
	
});

/* ===== INICIO - BUSCA POR CEP ===== */
function buscaCep(cep, form){
	var arrayEstados 	   = new Array();
		arrayEstados['AC'] = 'Acre';
		arrayEstados['AL'] = 'Alagoas';
		arrayEstados['AP'] = 'Amapa';
		arrayEstados['AM'] = 'Amazonas';
		arrayEstados['BA'] = 'Bahia';
		arrayEstados['CE'] = 'Ceara';
		arrayEstados['DF'] = 'Distrito Federal';
		arrayEstados['ES'] = 'Espirito Santo';
		arrayEstados['GO'] = 'Goias';
		arrayEstados['MA'] = 'Maranhao';
		arrayEstados['MT'] = 'Mato Grosso';
		arrayEstados['MS'] = 'Mato Grosso do Sul';
		arrayEstados['MG'] = 'Minas Gerais';
		arrayEstados['PA'] = 'Para';
		arrayEstados['PB'] = 'Paraiba';
		arrayEstados['PR'] = 'Parana';
		arrayEstados['PE'] = 'Pernambuco';
		arrayEstados['PI'] = 'Piaui';
		arrayEstados['RJ'] = 'Rio de Janeiro';
		arrayEstados['RN'] = 'Rio Grande do Norte';
		arrayEstados['RS'] = 'Rio Grande do Sul';
		arrayEstados['RO'] = 'Rondonia';
		arrayEstados['RR'] = 'Roraima';
		arrayEstados['SC'] = 'Santa Catarina';
		arrayEstados['SP'] = 'Sao Paulo';
		arrayEstados['SE'] = 'Sergipe';
		arrayEstados['TO'] = 'Tocantins';
	
	$.getScript(urlWebsite + "/modificacoes/buscacep.php?cep=" + cep, function(){
		if(resultadoCEP["resultado"] && resultadoCEP["resultado"] != 0){
			$(form).find('input').each(function(){
				if($(this).attr('attributeprivateid') == 'addressline1'){
					$(this).val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));
				}
				if($(this).attr('attributeprivateid') == 'bairro'){
					$(this).val(unescape(resultadoCEP["bairro"]));
				}
				if($(this).attr('attributeprivateid') == 'city'){
					$(this).val(unescape(resultadoCEP["cidade"]));
				}
				if($(this).attr('attributeprivateid') == 'numero'){
					$(this).focus();
				}
			});
			
			$('.FormContainer').find('select').each(function(){
				if($(this).attr('attributeprivateid') == 'state'){
					$(this).children('option[value="' + arrayEstados[unescape(resultadoCEP["uf"])] + '"]').attr({ selected : "selected" });
				}
			});
        }else{
            alert("Endere�o n�o encontrado!");
            return false;
        }
    });
}
/* ===== FIM - BUSCA POR CEP ===== */

/*
	Aplica M�scaras e Oculta Campos do Cadastro de Clientes
*/
function mascaraCamposCadastroCliente(){
	if($('.FormContainer').length){
		$('.FormContainer').find('input').each(function(){
			// Desabilita Campo Empresa
			if($(this).attr('attributeprivateid') == 'companyname'){ $(this).hide(); $(this).parent().prev().hide(); }
			// Mascara Data de CPF
			if($(this).attr('attributeprivateid') == 'cpf'){ $(this).mask("999.999.999-99"); }
			// Mascara Data de Nascimento
			if($(this).attr('attributeprivateid') == 'datanascimento'){ $(this).mask("99/99/9999"); }
			// Mascara de Telefone
			if($(this).attr('attributeprivateid') == 'phone'){ $(this).mask("(99) 9999-9999"); }
			// Mascara de Cep
			if($(this).attr('attributeprivateid') == 'zip'){ $(this).mask("99999-999"); }
		});
		$('.FormContainer').find('select').each(function(){
			//Desabilita Campo Pa�s
			if($(this).attr('attributeprivateid') == 'country'){ $(this).hide(); $(this).parent().prev().hide(); }
		});
	}
}

function inArray(array, valor) {
    for(var i=0; i<array.length; i++) {
        if(array[i] == valor) {
            return true;
        }
    }
    return false;
}

/*
  Ajax - Carrega do Servidor o Conteudo da Selecao de Atributos
*/
function carregaConteudoSelecaoServidorAjax(){
	var optionIds = '';
	$('.GrupoAtributoVariacaoProduto').find('li.itemVariationProductSelected').each(function(){
		optionIds += $(this).attr('value') + ",";
	});
	
	if(optionIds != ''){
		optionIds = optionIds.substr(0, optionIds.length-1);
	}
	
	$.getJSON(
		config.AppPath + '/remote.php?w=GetVariationOptions&productId=' + productId + '&options=' + optionIds,
		function(data) {
			if (data.comboFound) { // was a combination found instead?
				// display price, image etc
				updateSelectedVariation($('body'), data, data.combinationid);
			}
		}
	);
}

/* 
	Mostra a Qtde de Estoque da Sele��o
*/
function mostraQtdeEstoqueSelecao(indiceAtributoVariacao, qtdeAtributos){
	if(indiceAtributoVariacao == qtdeAtributos){
		var qtdeEstoqueProduto;
		var atributosSelecionadosString = '';
		var valoresPreSelecaoString;
		var achouEstoqueDaSelecao = false;
		
		$('.GrupoAtributoVariacaoProduto').find('li.itemVariationProductSelected').each(function(){
			atributosSelecionadosString += $(this).attr('value') + ",";
		});
		
		if(atributosSelecionadosString.length > 1){
			atributosSelecionadosString = atributosSelecionadosString.substr(0, atributosSelecionadosString.length-1);
			
			for(var i=0; i<arrayCombinacaoAtributos.length; i++){
				valoresPreSelecaoString = arrayCombinacaoAtributos[i].join(",");
				if(trim(valoresPreSelecaoString) == trim(atributosSelecionadosString)){
					achouEstoqueDaSelecao = true;
					qtdeEstoqueProduto	  = arrayCombinacaoEstoque[i];
					break;
				}
			}
			
			if(achouEstoqueDaSelecao){
				$('#qtdeEstoqueAtributosDiv').fadeOut('slow',function(){
					$('#qtdeEstoqueAtributosDiv').html('Em estoque: ' + qtdeEstoqueProduto + ' unidade(s)');
					$('#qtdeEstoqueAtributosDiv').fadeIn(1200);
				});
			}else{
				$('#qtdeEstoqueAtributosDiv').fadeOut('slow');
			}
		}
	}else{
		$('#qtdeEstoqueAtributosDiv').fadeOut('slow');
	}
}

function compareProductSubmit(){
	var form;
	
	form 		= document.frmCompare;
	form.action = "%%GLOBAL_CompareLink%%";
	form.submit();
}

/* 
  Carrega Atributos Disponiveis Para Sele��o
*/
function carregaAtributosDisponiveisParaSelecao(indice, valor){
	var indiceAtributoVariacao;
	var valorAtributoSeleciondo;
	var removerIndice = 0;
	var arrayAtributosSelecionados 			= new Array();
	var arrayCombinacaoAtributosTempAlterar = new Array();
	var conteudoRestanteSelecaoAtributos	= new Array();
	
	arrayCombinacaoAtributosTempAlterar = arrayCombinacaoAtributos.slice();
	
	/* Monta Array Coms os Atributos J� Selecionados */
	$('.GrupoAtributoVariacaoProduto').each(function(){
		indiceAtributoVariacao  = $(this).attr('indiceAtributoVariacao');
		valorAtributoSeleciondo = $(this).find('li.itemVariationProductSelected').eq(0).attr('value');
		
		if(valorAtributoSeleciondo != undefined){
			arrayAtributosSelecionados[indiceAtributoVariacao-1] = valorAtributoSeleciondo;
		}
	});
	
	var addCombinacaoAtributosValido = true;
	for(var y=0; y<arrayCombinacaoAtributosTempAlterar.length; y++){
		addCombinacaoAtributosValido = true;
		for(var i=0; i<indice; i++){
			if(!arrayCombinacaoAtributosTempAlterar[y][i] || (arrayCombinacaoAtributosTempAlterar[y][i] != arrayAtributosSelecionados[i])){
				addCombinacaoAtributosValido = false;
				break;
			}
		}
		if(addCombinacaoAtributosValido){
			conteudoRestanteSelecaoAtributos.push(arrayCombinacaoAtributosTempAlterar[y]);
		}
	}	
	
	$('.GrupoAtributoVariacaoProduto').each(function(){
		if($(this).attr('indiceAtributoVariacao') == (parseInt(indice)+1)){
			$(this).find('li').each(function(){
				for(var i=0; i<conteudoRestanteSelecaoAtributos.length; i++){
					if(conteudoRestanteSelecaoAtributos[i] != undefined){
						if(inArray(conteudoRestanteSelecaoAtributos[i], $(this).attr('value'))){
							$(this).removeClass('itemVariationProductDisabled');
							$(this).addClass('itemVariationProduct');
						}
					}
				}
			});
		}
	});

}

/*
  Seleciona a Imagem do Atributo Cor da Varia��o do Produto
*/
function selecionarImagemVariacaoProduto(obj, evento){
	var imgAtributo	= $(obj).find('img');
	var imageZoom   = $(imgAtributo).attr('imageProdutoHover');
	
	var imgProduto  = $('.ProductThumbImage').find('img');
	var srcImageProdutoOriginal = $(imgProduto).attr('src');
	$(imgProduto).attr('srcOriginalBKP',srcImageProdutoOriginal);
	$(imgProduto).attr('width',ProductThumbWidth).css('height',ProductThumbHeight);
	$(imgProduto).attr('src',imageZoom);
	
	if(evento == 'click'){
		$('.ProductThumbImage a').attr("href", imageZoom);
		$('.ProductThumbImage a').css({'cursor':'pointer'});
	}
}

/*
  Carrega Url no IFRAME
*/
function carregaUrl(url, height){
	var novoElemento,
		divPrincipal,
		parametros;
	
	divPrincipal = $('#Wrapper');
	parametros   = '?urlWebsite=' + urlWebsite;
		
	if(!$('#iframeURL')[0]){
		/* Cria IFRAME */
		novoElemento  = "<div id='bannerDIV'></div>";
		novoElemento += "<div id='iframeDIV'>";
		novoElemento += "<iframe id='iframeURL' name='iframeURL' src='" + urlWebsite + "/carregandoAjax.html' width='100%' height='100%' frameborder='0' style='display: none;'></iframe>";
		novoElemento += "</div>";
		
		$(divPrincipal).after(novoElemento);
		$(divPrincipal).hide();
		$('#Header').hide();
		$('#bannerDIV').append($('#Header').html()); //Movendo BANNER
		$('#iframeURL').css('height', height);
		$('html,body').animate({scrollTop: $("#iframeDIV").offset().top - 55}, 1500);
		$('#iframeURL').fadeIn(1500, function(){
			$('#iframeURL').attr('src', url+parametros);
		});
	}else{
		$('html,body').animate({scrollTop: $("#iframeDIV").offset().top - 55}, 1500);
		$('#iframeURL').attr('src', url+parametros);
		$('#iframeURL').css('height', height);
	}
	
}

/*
	Avise-me Quando Chegar um Produto
*/
function avisemeQuandoChegar(codProd){
var url,
	height,
	parametros,
	novoElemento,
	divPrincipal;
	
	divPrincipal = $('#Wrapper');
	url 	     = urlWebsite + '/fale_conosco/faleconosco.php';
	parametros   = '?codprod=' + codProd + '&urlWebsite=' + urlWebsite;
	height	     = '1300px';
		
	if(!$('#iframeURL')[0]){
		/* Cria IFRAME */
		novoElemento  = "<div id='bannerDIV'></div>";
		novoElemento += "<div id='iframeDIV'>";
		novoElemento += "<iframe id='iframeURL' name='iframeURL' src='" + urlWebsite + "/carregandoAjax.html' width='100%' height='100%' frameborder='0' style='display: none;'></iframe>";
		novoElemento += "</div>";
		
		$(divPrincipal).after(novoElemento);
		$(divPrincipal).hide();
		$('#Header').hide();
		$('#bannerDIV').append($('#Header').html()); //Movendo BANNER
		$('#iframeURL').css('height', height);
		$('html,body').animate({scrollTop: $("#iframeDIV").offset().top - 55}, 1500);
		$('#iframeURL').fadeIn(1500, function(){
			$('#iframeURL').attr('src', url+parametros);
		});
	}else{
		$('html,body').animate({scrollTop: $("#iframeDIV").offset().top - 55}, 1500);
		$('#iframeURL').attr('src', url+parametros);
		$('#iframeURL').css('height', height);
	}

}

function mostraDivComentariosProduto(animation){
	var codigoDivComentarioProdutos = 4;

	$('#divTabs').find('li').each(function(){
		if($(this).attr('id') != 'li' + codigoDivComentarioProdutos){
			$(this).removeClass("on");
		}else{
			$(this).addClass("on");
		}
	});
	
	$('.divTabArea').each(function(){
		$(this).removeClass("on");
	});
	
	if(animation){
		$('#div4').slideDown(1200, function(){
			$(this).addClass("on");
			$(this).removeAttr('style');
		});
	}else{
		$('#div4').addClass("on");
		window.location.href = '#divTC';
	}
}

function trim(str){
	while (str.charAt(0) == " ")
		str = str.substr(1,str.length -1);

	while (str.charAt(str.length-1) == " ")
		str = str.substr(0,str.length-1);

	return str;
}

// RETIRA UM CARACTER ESPEC�FICO DE UMA STRING
function retiraCaracter(string, caracter) {
    var i = 0;
    var final = '';
    while (i < string.length) {
        if (string.charAt(i) == caracter) {
            final += string.substr(0, i);
            string = string.substr(i+1, string.length - (i+1));
            i = 0;
        }
        else {
            i++;
        }
    }
    return final + string;
}

function validaEmail(email){
    var er = new RegExp(/^[A-Za-z0-9_\-\.]+@[A-Za-z0-9_\-\.]{2,}\.[A-Za-z0-9]{2,}(\.[A-Za-z0-9])?/); 
    if(typeof(email) == "string"){ 
    	if(er.test(email)){ return true; } 
    }else if(typeof(email) == "object"){ 
    	if(er.test(email.value)){  
        	return true;  
    	} 
    }else{ 
    	return false; 
    } 
}

/*
	Verifica se o m�todo de pagamento selecionado possui desconto cadastrado
*/
function verificaDescontoMetodoPagamento(metodoPagamento){
	var total, totalDesconto, descontoPercentual, novoElementoTR, novoElementoTD1, novoElementoTD2, qtdeTR, tabelaRecebeResultado;
		
	$.ajax({
		url: 'remote.php',
		data: 'w=discountMethodPaymentEdaz&metodoPagamento=' + metodoPagamento,
		dataType: 'json',
		type: 'post',
		success: function(data){
			/* Altera os Valores Originais da Quota��o */
			total 			   = data.total;
			totalDesconto 	   = data.totalDesconto;
			descontoPercentual = data.descontoPercentual;
			
			if($('#OrderConfirmationForm').length > 0){
				qtdeTR 				  = $('#OrderConfirmationForm .CartContents tfoot tr').size();
				tabelaRecebeResultado = '#OrderConfirmationForm .CartContents tfoot tr';
			}else if($('.OrderContents').length > 0){
				qtdeTR 				  = $('.OrderContents .CartContents tfoot tr').size();
				tabelaRecebeResultado = '.OrderContents .CartContents tfoot tr';
			}
			
			if(totalDesconto != '-R$0,00' || $('#descontoQuotacaoTR').length > 0){
				if($('#descontoQuotacaoTR').length == 0){
					novoElementoTR  = $('<tr></tr>').attr({ id : 'descontoQuotacaoTR' }).addClass('SubTotal').addClass('displayNone');
					novoElementoTD1 = $('<td></td>').attr({ id : 'labelDescontoQuotacao', colspan : '3' });
					novoElementoTD2 = $('<td></td>').attr({ id : 'valorDescontoQuotacao' });
					$(novoElementoTR).append(novoElementoTD1).append(novoElementoTD2);
					
					$(tabelaRecebeResultado).each(function(i, obj){
						//Pega a Penultima Linha
						if(i+1 == (qtdeTR-1)){
							/* Verifica se J� n�o Inseriu */
							if($(this).attr('id') != undefined && $(this).attr('id') != 'descontoQuotacaoTR'){
								$(this).after($(novoElementoTR));
								$(this).next().fadeIn(800);
								return false;
							}
						}
					});
				}
				
				/* Insere os Valores de Desconto */
				$('#labelDescontoQuotacao').fadeOut('fast', function(){
					$(this).html('Desconto (' + descontoPercentual + '%):').fadeIn(800);
				});
				$('#valorDescontoQuotacao').fadeOut('fast', function(){
					$(this).html(totalDesconto).fadeIn(800);
				});
				$(tabelaRecebeResultado + ':last-child td:last-child').fadeOut('fast', function(){
					$(this).html(total).fadeIn(800);
				});
			}
		} 
	});

}