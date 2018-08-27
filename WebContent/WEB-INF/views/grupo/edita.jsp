<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Grupo</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Editar Grupo</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			alteração do grupo no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="altera" method="POST">
		<input type="hidden" name="usuario.id" value="${usuario.id}">
		<!-- ID -->
		<input type="hidden" name="id" value="${grupo.id}">

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required value="${grupo.nome}">
		</div>

		<security:csrfInput />

		<!-- OBTIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<div>
			<a href="<c:url value="/grupo/lista" />"
				class="btn btn-secondary btn-lg"> <span
				class="glyphicon glyphicon-remove"></span> Cancelar
			</a>
			<button type="submit" class="btn btn-primary btn-lg">
				<span class="glyphicon glyphicon-refresh"></span> Atualizar
			</button>
			<a
				href="<c:url value="/demanda/planejamento/grupo/edita?id=${grupo.id}" />"
				class="btn btn-warning btn-lg"> <span
				class="glyphicon glyphicon-list-alt"></span> Planejamento
			</a>
		</div>
	</form>
</div>

<c:import url="../componentes/rodape.jsp" />