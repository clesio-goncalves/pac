var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(document).ready(function() {
	$('#button_salvar').click(function() {
		$.ajax({
			type : "POST",
			url : "risco/adiciona",
			cache : false,
			data : {
				descricao : $("input[name='descricao']").val(),
				probabilidade : $("select[name='probabilidade']").val(),
				impacto : $("select[name='impacto']").val(),
				acao_preventiva : $("textarea[name='acao_preventiva']").val(),
				responsavel_acao_preventiva : $("input[name='responsavel_acao_preventiva']").val(),
				acao_contingencia : $("textarea[name='acao_contingencia']").val(),
				responsavel_acao_contingencia : $("input[name='responsavel_acao_contingencia']").val()
			},
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	        },
			success : function(response) {
				$('#tabela_lista_riscos').html(response);
			},
			error : function() {
				alert("Ocorreu um erro");
			}
		});
	});
	$('#button_adicionar').click(function() {
		$("input[name='descricao']").val(""),
		$("select[name='probabilidade'] :selected").val("Baixa"),
		$("select[name='impacto'] :selected").val("Baixo"),
		$("textarea[name='acao_preventiva']").val(""),
		$("input[name='responsavel_acao_preventiva']").val(""),
		$("textarea[name='acao_contingencia']").val(""),
		$("input[name='responsavel_acao_contingencia']").val("")
	});
});

//Ao clicar no botão excluir da tabela lista de riscos
function excluir(id) {
	$("#modal" + id).modal('hide');
	$('body').removeClass('modal-open');
	$('.modal-backdrop').remove();
	
	$.ajax({
		type : "POST",
		url : "risco/remove",
		cache : false,
		data : {
			risco_id : id
		},
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success : function(response) {
			$('#tabela_lista_riscos').html(response);
		},
		error : function() {
			alert("Ocorreu um erro");
		}
	});
}

// Ao clicar no botão editar da tabela lista de riscos
function editar(id) {
	$.ajax({
		type : "POST",
		url : "risco/edita",
		cache : false,
		data : {
			risco_id : id
		},
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success : function(response) {
			$('#div_modal_editar').html(response);
			$('#modal_edita').modal('show');
		},
		error : function() {
			alert("Ocorreu um erro");
		}
	});
}