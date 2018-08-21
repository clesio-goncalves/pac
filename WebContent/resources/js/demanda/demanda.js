$(function() {
	$(".data").datepicker(
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
				prevText : 'Anterior'
			});
});

$(document).ready(function() {
	$("#quantidade, #valor_unitario_estimado").focusout(function() {
		var q = $("#quantidade").val();
		var v = $("#valor_unitario_estimado").val();
		if ((q != '') && (v != '')) {
			$("#valor_total_estimado").val(q * parseFloat(v));
		} else {
			$("#valor_total_estimado").val('');
		}
	});
});

