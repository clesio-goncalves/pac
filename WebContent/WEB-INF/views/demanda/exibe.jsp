<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados da demanda</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Exibe os dados da demanda</div>
		<!-- Table -->
		<div class="card-body">

			<!-- INFORMAÇÕES DA DEMANDA -->
			<jsp:include page="imports_exibe/demanda.jsp"></jsp:include>

			<!-- INFORMAÇÕES DO ITEM -->
			<jsp:include page="imports_exibe/item.jsp"></jsp:include>

			<!-- INFORMAÇÕES GERENCIAIS -->
			<jsp:include page="imports_exibe/gerenciais.jsp"></jsp:include>

			<!-- ESTUDOS PRELIMINARES -->
			<jsp:include page="imports_exibe/estudo_preliminar.jsp"></jsp:include>

			<!-- TABELA GERENCIAMENTO RISCOS -->
			<div id="tabela_lista_riscos">
				<jsp:include page="../planejamento/risco/lista.jsp"></jsp:include>
			</div>

		</div>
	</div>
	<security:authorize access="hasRole('ROLE_Administrador')">
		<div align="center">
			<!-- Cadastrar -->
			<a href="<c:url value="/demanda/nova" />"
				class="btn btn-primary btn-lg"><span
				class="glyphicon glyphicon-plus"></span> Cadastrar</a>
			<!-- Editar -->
			<a href="<c:url value="/demanda/edita?id=${item.id}" />"
				class="btn btn-info btn-lg"><span
				class="glyphicon glyphicon-edit"></span> Editar </a>
			<!-- Excluir -->
			<button type="button" class="btn btn-danger btn-lg"
				data-toggle="modal" data-target="#modal${item.id}">
				<span class="glyphicon glyphicon-trash"></span> Excluir
			</button>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modal${item.id}">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Exclusão da demanda</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							Deseja realmente excluir a demanda de <br>ID (${item.id}) ->
							Demandate (${item.usuario.nome})?
						</p>
					</div>
					<div class="modal-footer">
						<a href="<c:url value="/demanda/remove?id=${item.id}" />"
							class="btn btn-danger"><span
							class="glyphicon glyphicon-trash"></span> Excluir</a>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-log-out"></span> Fechar
						</button>
					</div>
				</div>
			</div>
		</div>
	</security:authorize>
	<a class="btn btn-success" href="<c:url value="/demanda/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>

<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/risco.js" />"></script>
<c:import url="../componentes/rodape.jsp" />