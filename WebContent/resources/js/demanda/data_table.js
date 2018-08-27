$(document).ready(function() {
	atualizaListagemItens();
});

// Atualiza data table
function atualizaListagemItens() {
	$('[data-tooltip="tooltip"]').tooltip();
	$('#tabela_id').DataTable({
		"order": [[ 0, "desc" ]],
		"columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            },
        ],
		"language" : {
			"url" : "../resources/idioma/Portuguese-Brasil.json"
		}
	});
}