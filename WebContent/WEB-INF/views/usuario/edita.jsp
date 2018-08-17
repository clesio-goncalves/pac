<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Usu�rio</title>
<c:import url="../componentes/cabecalho.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Editar Usu�rio</h1>
		<p class="lead">Preencha o formul�rio abaixo para realizar a
			altera��o do usu�rio no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="altera" method="POST">

		<!-- ID -->
		<input type="hidden" name="id" value="${usuario.id}" />

		<!-- �rg�o/Entidade: -->
		<div class="form-group">
			<label for="orgao" class="col-form-label">�rg�o/Entidade*</label> <input
				type="text" class="form-control" name="orgao" MAXLENGTH="255"
				required autofocus value="${usuario.orgao}">
		</div>

		<!-- Setor Requisitante (Unidade/Setor/Departamento): -->
		<div class="form-group">
			<label for="setor" class="col-form-label">Setor Requisitante
				(Unidade/Setor/Departamento)*</label> <select class="custom-select"
				name="setor.id" required>
				<!-- percorre perfil montando as linhas da tabela -->
				<c:forEach var="setor" items="${setores}">
					<option value="${setor.id}"
						${setor.id==usuario.setor.id ? 'selected' : ''}>${setor.nome}</option>
				</c:forEach>
			</select>
		</div>

		<!-- Respons�vel pela demanda: -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome/Respons�vel
				pela demanda*</label> <input type="text" class="form-control" name="nome"
				MAXLENGTH="255" required value="${usuario.nome}">
		</div>

		<div class="row">
			<div class="col-6">

				<!-- SIAPE -->
				<div class="form-group">
					<label for="siape" class="col-form-label">SIAPE*</label> <input
						type="number" class="form-control" name="siape" MAXLENGTH="10"
						required onkeypress='return SomenteNumero(event)'
						value="${usuario.siape}">
				</div>
			</div>
			<div class="col-6">
				<!-- telefone -->
				<div class="form-group">
					<label for="telefone" class="col-form-label">Telefone*</label>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><span
								class="glyphicon glyphicon-earphone"></span></span>
						</div>
						<input type="text" class="form-control" name="telefone"
							id="telefone" MAXLENGTH="20" required
							pattern="\([0-9]{2}\)[\s][0-9]{4,5}-[0-9]{4}"
							data-mask="(00) 90000-0000" value="${usuario.telefone}">
					</div>
				</div>
			</div>
		</div>

		<!-- EMAIL -->
		<div class="form-group">
			<label for="email" class="col-form-label">E-mail*</label>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">@</span>
				</div>
				<input type="email" class="form-control" name="email" MAXLENGTH="50"
					required value="${usuario.email}">
			</div>
		</div>

		<!-- SENHA -->
		<div class="form-group">
			<label for="senha" class="col-form-label">Senha*</label> <input
				type="password" class="form-control" name="senha" id="senha"
				MAXLENGTH="50" required>
		</div>

		<!-- REPETIR SENHA -->
		<div class="form-group">
			<label for="repetir_senha" class="col-form-label">Repetir
				Senha*</label> <input type="password" class="form-control"
				name="repetir_senha" id="repetir_senha" MAXLENGTH="50" required>
		</div>

		<!-- PERFIL -->
		<div class="form-group">
			<label for="perfil" class="col-form-label">Perfil*</label> <select
				class="custom-select" name="perfil.id" required>
				<!-- percorre perfil montando as linhas da tabela -->
				<c:forEach var="perfil" items="${perfis}">
					<option value="${perfil.id}"
						${perfil.id==usuario.perfil.id ? 'selected' : ''}>${perfil.nome}</option>
				</c:forEach>
			</select>
		</div>

		<!-- ATIVO -->
		<div class="form-group">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input"
					id="customCheck1" name="ativo" ${usuario.ativo ? 'checked' : ''}>
				<label class="custom-control-label" for="customCheck1">Ativo</label>
			</div>
		</div>

		<security:csrfInput />

		<!-- OBTIGAT�RIO -->
		<label for="obrigatorio">(*) Campos obrigat�rios</label>
		<div>
			<a href="<c:url value="/usuario/lista" />"
				class="btn btn-secondary btn-lg"> <span
				class="glyphicon glyphicon-remove"></span> Cancelar
			</a>
			<button type="submit" class="btn btn-primary btn-lg">
				<span class="glyphicon glyphicon-refresh"></span> Atualizar
			</button>
		</div>
	</form>
</div>

<script type="text/javascript"
	src="<c:url value="/resources/js/SomenteNumero.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.mask.min.js" />"></script>
<script src="<c:url value="/resources/js/confirma_senha.js" />"></script>

<c:import url="../componentes/rodape.jsp" />