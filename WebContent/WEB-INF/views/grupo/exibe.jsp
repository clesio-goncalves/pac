<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados do grupo</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Exibe os dados do grupo</div>
		<!-- Table -->
		<div class="card-body">
			<fieldset class="form-group">
				<legend style="margin-top: 0;">INFORMAÇÕES DO GRUPO</legend>
				<div class="table-responsive">
					<table
						class="table table-hover table-bordered dt-responsive nowrap">
						<tr>
							<th width="300">ID</th>
							<td>${grupo.id}</td>
						</tr>

						<tr>
							<th>Nome</th>
							<td>${grupo.nome}</td>
						</tr>
					</table>
				</div>
			</fieldset>
			<!-- ESTUDOS PRELIMINARES -->
			<jsp:include page="../demanda/imports_exibe/estudo_preliminar.jsp"></jsp:include>

			<!-- TABELA GERENCIAMENTO RISCOS -->
			<div id="tabela_lista_riscos">
				<jsp:include page="../planejamento/risco/lista.jsp"></jsp:include>
			</div>

			<!-- MODAL ADICIONA RISCO -->
			<jsp:include page="../planejamento/risco/modal_novo.jsp"></jsp:include>

			<!-- MODAL EDITA RISCO -->
			<div id="div_modal_editar">
				<jsp:include page="../planejamento/risco/modal_edita.jsp"></jsp:include>
			</div>


		</div>
	</div>
	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/grupo/novo" />" class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/grupo/edita?id=${grupo.id}" />"
			class="btn btn-info btn-lg"><span
			class="glyphicon glyphicon-edit"></span> Editar </a>
		<!-- Excluir -->
		<button type="button" class="btn btn-danger btn-lg"
			data-toggle="modal" data-target="#modal${grupo.id}">
			<span class="glyphicon glyphicon-trash"></span> Excluir
		</button>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="modal${grupo.id}">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Exclusão do grupo</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						Deseja realmente excluir o grupo<br> ID (${grupo.id}) ->
						${grupo.nome}?
					</p>
				</div>
				<div class="modal-footer">
					<a href="<c:url value="/grupo/remove?id=${grupo.id}" />"
						class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>
						Excluir</a>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-log-out"></span> Fechar
					</button>
				</div>
			</div>
		</div>
	</div>
	<a class="btn btn-success" href="<c:url value="/grupo/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>

<c:import url="../componentes/rodape.jsp" />