var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

// Reset
function limpar(){
	$("input[name='data_inicial_solicitacao']").val(""), 
	$("input[name='data_final_solicitacao']").val(""),
	$("input[name='data_inicial_necessidade']").val(""), 
	$("input[name='data_final_necessidade']").val(""),
	$("select[name='grupo']").val("").selectpicker("refresh"),
	$("input[name='descricao']").val(""),
	$("select[name='tipo']").val(""),
	$("select[name='setor']").val(""),
	$("select[name='responsavel']").val("").selectpicker("refresh"),
	$("input[name='valor']").val(""),
	$("select[name='contratacao_emergencial']").val("Nao")
}

function alteraValoresNumericos() {
	$("input[name='valor_numerico']").val(desformatar($("input[name='valor']").val()));
}

// Filtro
function filtrar(){
	alteraValoresNumericos();
	$.ajax({
		type : "POST",
		url : "filtrar",
		cache : false,
		data : {
			data_inicial_solicitacao : $("input[name='data_inicial_solicitacao']").val(), 
			data_final_solicitacao : $("input[name='data_final_solicitacao']").val(),
			data_inicial_necessidade : $("input[name='data_inicial_necessidade']").val(), 
			data_final_necessidade : $("input[name='data_final_necessidade']").val(),
			grupo : $("select[name='grupo'] :selected").val(),
			descricao : $("input[name='descricao']").val(),
			tipo : $("select[name='tipo']").val(),
			setor : $("select[name='setor']").val(),
			responsavel : $("select[name='responsavel'] :selected").val(),
			valor : $("input[name='valor_numerico']").val(),
			contratacao_emergencial : $("select[name='contratacao_emergencial']").val()
		},
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success : function(response) {
			$('#tabela').html(response);
			atualizaListagemItens();
		},
		error : function() {
			alert("Ocorreu um erro");
		}
	});
}
