<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
						<tr>
							<th>Usuário Responsável</th>
							<td><a
								href="<c:url value="/usuario/exibe?id=${grupo.usuario.id}" />">${grupo.usuario.nome}</a></td>
						</tr>
						<tr>
							<th>Total de itens</th>
							<td>${grupo.total_itens}</td>
						</tr>
					</table>
				</div>
			</fieldset>

			<!-- ESTUDOS PRELIMINARES -->
			<jsp:include page="../demanda/import_exibe/estudo_preliminar.jsp"></jsp:include>

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
		<security:authorize access="hasRole('ROLE_Demandante')">
			<security:authentication property="principal" var="usuario_logado" />
			<c:if test="${usuario_logado.id == grupo.usuario.id}">
				<jsp:include page="import_exibe/edita_remove.jsp"></jsp:include>
			</c:if>
		</security:authorize>
		<security:authorize
			access="hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')">
			<jsp:include page="import_exibe/edita_remove.jsp"></jsp:include>
		</security:authorize>
	</div>
	<a class="btn btn-success" href="<c:url value="/grupo/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/risco.js" />"></script>
<c:import url="../componentes/rodape.jsp" />