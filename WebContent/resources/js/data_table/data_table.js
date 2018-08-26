$(document).ready(function() {
	$('#tabela_id').DataTable({
		"language" : {
			"url" : "../resources/idioma/Portuguese-Brasil.json"
		}
	});
	$('[data-tooltip="tooltip"]').tooltip()
});