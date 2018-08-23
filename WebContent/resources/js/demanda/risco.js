var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

function adicionar(){
	$("input[name='descricao']").val("");
	$("input[name='descricao']").removeClass('is-invalid');
	$("select[name='probabilidade']").val("Baixa");
	$("select[name='impacto']").val("Baixo");
	$("textarea[name='acao_preventiva']").val("");
	$("textarea[name='acao_preventiva']").removeClass('is-invalid');
	$("input[name='responsavel_acao_preventiva']").val("");
	$("input[name='responsavel_acao_preventiva']").removeClass('is-invalid');
	$("textarea[name='acao_contingencia']").val("");
	$("textarea[name='acao_contingencia']").val("").removeClass('is-invalid');
	$("input[name='responsavel_acao_contingencia']").val("");
	$("input[name='responsavel_acao_contingencia']").removeClass('is-invalid');
}

function salvar(contexto){
	var item_id = $("input[name='item_id']").val();
	var descricao = $("input[name='descricao']").val();
	var probabilidade = $("select[name='probabilidade']").val();
	var impacto = $("select[name='impacto']").val();
	var acao_preventiva = $("textarea[name='acao_preventiva']").val();
	var responsavel_acao_preventiva = $("input[name='responsavel_acao_preventiva']").val();
	var acao_contingencia = $("textarea[name='acao_contingencia']").val();
	var responsavel_acao_contingencia = $("input[name='responsavel_acao_contingencia']").val();
	
	if (item_id != "" && descricao != "" && probabilidade != "" && impacto != "" && acao_preventiva != "" && 
			responsavel_acao_preventiva != "" && acao_contingencia != "" && responsavel_acao_contingencia != "") {
		$.ajax({
			type : "POST",
			url : contexto + "demanda/planejamento/risco/adiciona",
			cache : false,
			data : {
				item_id : item_id,
				descricao : descricao,
				probabilidade : probabilidade,
				impacto : impacto,
				acao_preventiva : acao_preventiva,
				responsavel_acao_preventiva : responsavel_acao_preventiva,
				acao_contingencia : acao_contingencia,
				responsavel_acao_contingencia : responsavel_acao_contingencia
			},
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	        },
			success : function(response) {
				$('#tabela_lista_riscos').html(response);
				$('#modal_novo').modal('hide');
			},
			error : function() {
				alert("Ocorreu um erro");
			}
		});	
	} else {
		if (descricao == "") 
			$("input[name='descricao']").addClass("is-invalid");
		
		if (acao_preventiva == "") 
			$("textarea[name='acao_preventiva']").addClass("is-invalid");
		
		if (responsavel_acao_preventiva == "")
			$("input[name='responsavel_acao_preventiva']").addClass("is-invalid");
		
		if (acao_contingencia == "")
			$("textarea[name='acao_contingencia']").addClass("is-invalid");
		
		if (responsavel_acao_contingencia == "")
			$("input[name='responsavel_acao_contingencia']").addClass("is-invalid");
	}
}

//Ao clicar no botão excluir da tabela lista de riscos
function excluir(contexto, item_id, risco_id) {
	$("#modal" + risco_id).modal('hide');
	$('body').removeClass('modal-open');
	$('.modal-backdrop').remove();
	$.ajax({
		type : "POST",
		url : contexto + "demanda/planejamento/risco/remove",
		cache : false,
		data : {
			item_id : item_id,
			risco_id : risco_id
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
function editar(contexto, id) {
	$.ajax({
		type : "POST",
		url : contexto + "demanda/planejamento/risco/edita",
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

function alterar(contexto){
	
	var item_id = $("input[name='edita_item_id']").val();
	var risco_id = $("input[name='edita_risco_id']").val();
	var descricao = $("input[name='edita_descricao']").val();
	var probabilidade = $("select[name='edita_probabilidade']").val();
	var impacto = $("select[name='edita_impacto']").val();
	var acao_preventiva = $("textarea[name='edita_acao_preventiva']").val();
	var responsavel_acao_preventiva = $("input[name='edita_responsavel_acao_preventiva']").val();
	var acao_contingencia = $("textarea[name='edita_acao_contingencia']").val();
	var responsavel_acao_contingencia = $("input[name='edita_responsavel_acao_contingencia']").val();

	if (item_id != "" && risco_id != "" && descricao != "" && probabilidade != "" && impacto != "" && acao_preventiva != "" && 
			responsavel_acao_preventiva != "" && acao_contingencia != "" && responsavel_acao_contingencia != "") {
		$.ajax({
			type : "POST",
			url : contexto + "demanda/planejamento/risco/altera",
			cache : false,
			data : {
				item_id : item_id,
				risco_id : risco_id,
				descricao :descricao,
				probabilidade : probabilidade,
				impacto : impacto,
				acao_preventiva : acao_preventiva,
				responsavel_acao_preventiva : responsavel_acao_preventiva,
				acao_contingencia : acao_contingencia,
				responsavel_acao_contingencia : responsavel_acao_contingencia
			},
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	        },
			success : function(response) {
				$('#tabela_lista_riscos').html(response);
				$('#modal_edita').modal('hide');
			},
			error : function() {
				alert("Ocorreu um erro");
			}
		});
	} else {
		if (descricao == "") 
			$("input[name='edita_descricao']").addClass("is-invalid");
		
		if (acao_preventiva == "") 
			$("textarea[name='edita_acao_preventiva']").addClass("is-invalid");
		
		if (responsavel_acao_preventiva == "")
			$("input[name='edita_responsavel_acao_preventiva']").addClass("is-invalid");
		
		if (acao_contingencia == "")
			$("textarea[name='edita_acao_contingencia']").addClass("is-invalid");
		
		if (responsavel_acao_contingencia == "")
			$("input[name='edita_responsavel_acao_contingencia']").addClass("is-invalid");
	}
}