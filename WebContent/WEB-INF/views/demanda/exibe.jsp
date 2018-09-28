<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Exibe os dados da demanda</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Exibe os dados da demanda</div>
		<!-- Table -->
		<div class="card-body">
			<!-- INFORMAÇÕES DA DEMANDA -->
			<jsp:include page="import_exibe/demanda.jsp"></jsp:include>

			<!-- INFORMAÇÕES DO ITEM -->
			<jsp:include page="import_exibe/item.jsp"></jsp:include>

			<!-- INFORMAÇÕES GERENCIAIS -->
			<jsp:include page="import_exibe/gerenciais.jsp"></jsp:include>

			<!-- ESTUDOS PRELIMINARES -->
			<jsp:include page="import_exibe/estudo_preliminar.jsp"></jsp:include>

			<!-- TABELA GERENCIAMENTO RISCOS -->
			<div id="tabela_lista_riscos">
				<jsp:include page="../planejamento/risco/lista_em_exibe_demanda.jsp"></jsp:include>
			</div>

			<!-- MODAL EXIBE RISCO -->
			<div id="div_modal_exibir">
				<jsp:include page="../planejamento/risco/modal_exibe.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/demanda/nova" />"
			class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
		<security:authorize access="hasRole('ROLE_Demandante')">
			<security:authentication property="principal" var="usuario_logado" />
			<c:if test="${usuario_logado.id == item.usuario.id}">
				<jsp:include page="import_exibe/edita_remove.jsp"></jsp:include>
			</c:if>
		</security:authorize>
		<security:authorize access="hasRole('ROLE_Coordenador')">
			<security:authentication property="principal" var="usuario_logado" />
			<c:if
				test="${usuario_logado.id == item.usuario.coordenador.id or usuario_logado.id == item.usuario.id}">
				<jsp:include page="import_exibe/edita_remove.jsp"></jsp:include>
				<jsp:include page="import_exibe/aprova.jsp"></jsp:include>
			</c:if>
		</security:authorize>
		<security:authorize
			access="hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')">
			<jsp:include page="import_exibe/edita_remove.jsp"></jsp:include>
			<jsp:include page="import_exibe/aprova.jsp"></jsp:include>
		</security:authorize>
	</div>
	<a class="btn btn-success" href="<c:url value="/demanda/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/risco.js" />"></script>
<c:import url="../componentes/rodape.jsp" />