$(document).ready(function() {
	jqueryMask();
	configDatePicker();
	atualizarTotal();
	$(document).on('focusout', '#quantidade', atualizarTotal);
	$(document).on('focusout', '#valor_unitario_estimado', atualizarTotal);
});

/**
 * Função para máscara dos formulários
 * @returns {undefined}
 */
function jqueryMask() {
	$('.maskData').mask('00/00/0000');
	$('.maskDinheiro').mask('000.000.000.000.000,00', {
		reverse : true
	});
	$('.maskCodigo').mask('99999999999');
	$('.maskQuantidade').mask('99999999999');
}

/**
 * Seta uma configuração padrão para os datepicker
 * @returns {undefined}
 */
function configDatePicker() {
	$(".maskData").datepicker(
			{
				dateFormat : 'dd/mm/yy',
				dayNames : [ 'Domingo', 'Segunda', 'Ter&ccedil;a', 'Quarta',
						'Quinta', 'Sexta', 'S&aacute;bado' ],
				dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D' ],
				dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex',
						'Sáb', 'Dom' ],
				monthNames : [ 'Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril',
						'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro',
						'Outubro', 'Novembro', 'Dezembro' ],
				monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
						'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
				nextText : 'Pr&oacute;ximo',
				prevText : 'Anterior',
				language : 'pt-BR',
			});
}

/**
 * Atualiza o valor_total_estimado
 * @returns {undefined}
 */
function atualizarTotal() {
	var quantidade = $('#quantidade');
	var total = $('#valor_total_estimado');
	var unitario = $('#valor_unitario_estimado');

	if (quantidade.val() < 1) {
		quantidade.val('');
		quantidade.val('');
		total.val('');
		return;
	}

	if (quantidade != '' && unitario != '') {
		var quantidadeLimpo = desformatar(quantidade.val());
		var unitarioLimpo = desformatar(unitario.val());
		var totalLimpo = parseFloat(quantidadeLimpo)
				* parseFloat(unitarioLimpo);

		total.val(totalLimpo.formatMoney(2, ',', '.'));
	} else {
		total.val(unitario);
	}
}

/**
 * Desformata o valor com mascaras
 * @param {valor}
 * @returns {numero}
 */
function desformatar(valor) {
    var retorno = 0;
    if (typeof valor === 'string') {
        var removeBRFormat = valor.replace(/[\R$.]/g, '');
        retorno = removeBRFormat.replace(/[\,]/g, '.') * 1;
    }
    if (typeof valor === 'number') {
        retorno = valor;
    }

    return retorno;
}

/**
 * Formata numero em dinheiro
 * @param integer c Valor
 * @param string  d Centena
 * @param string  t Decimal
 * @returns {String}
 */
Number.prototype.formatMoney = function (c, d, t) {
    var n = this,
            c = isNaN(c = Math.abs(c)) ? 2 : c,
            d = d == undefined ? "." : d,
            t = t == undefined ? "," : t,
            s = n < 0 ? "-" : "",
            i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
            j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};

/**
 * Formata dinheiro em numero ao clicar
 * no botao salvar ou atualizar
 * @returns {undefined}
 */
function alteraValoresNumericos() {
	$('#valor_unit').val(desformatar($('#valor_unitario_estimado').val()));
}
