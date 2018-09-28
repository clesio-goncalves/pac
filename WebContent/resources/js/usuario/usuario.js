function selecionaPerfil() {
	if ($("select[name='perfil.id']").val() == 2) {
		$('#coordenador').removeAttr('disabled');
		$('#coordenador').selectpicker('refresh');
	} else {
		$('#coordenador').attr('disabled', "disabled");
		$('#coordenador').selectpicker('refresh');
	}
}