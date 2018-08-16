<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Demanda</title>
<c:import url="../componentes/cabecalho.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Cadastrar Demanda</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			formalização do cadastro da demanda no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="adiciona" method="POST">

		<h3>INFORMAÇÕES DO ITEM</h3>
		<hr>

		<!-- Tipo do item: -->
		<div class="form-group">
			<label for="tipo_item" class="col-form-label">Tipo do item*</label>
			<div class="custom-control custom-radio">
				<input type="radio" id="customRadio1" name="tipo_item"
					class="custom-control-input" checked="" required> <label
					class="custom-control-label" for="customRadio1">Material</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" id="customRadio2" name="tipo_item"
					class="custom-control-input"> <label
					class="custom-control-label" for="customRadio2">Serviços</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" id="customRadio3" name="tipo_item"
					class="custom-control-input"> <label
					class="custom-control-label" for="customRadio3">Obras</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" id="customRadio4" name="tipo_item"
					class="custom-control-input"> <label
					class="custom-control-label" for="customRadio4">Serviços de
					Engenharia</label>
			</div>
		</div>

		<!-- Código do item -->
		<div class="form-group">
			<label for="codigo_item" class="col-form-label">Código do item*</label> <input
				type="text" class="form-control" name="orgao" MAXLENGTH="255"
				required autofocus
				value="Instituto Federal do Piaui - Campus Paulistana">
		</div>

		<!-- Setor Requisitante (Unidade/Setor/Departamento): -->
		<div class="form-group">
			<label for="setor" class="col-form-label">Setor Requisitante
				(Unidade/Setor/Departamento)*</label> <select class="custom-select"
				name="setor.id" required>
				<!-- percorre perfil montando as linhas da tabela -->
				<c:forEach var="setor" items="${setores}">
					<option value="${setor.id}">${setor.nome}</option>
				</c:forEach>
			</select>
		</div>

		<!-- Responsável pela demanda: -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome/Responsável
				pela demanda*</label> <input type="text" class="form-control" name="nome"
				MAXLENGTH="255" required>
		</div>

		<div class="row">
			<div class="col-6">

				<!-- SIAPE -->
				<div class="form-group">
					<label for="siape" class="col-form-label">SIAPE*</label> <input
						type="number" class="form-control" name="siape" MAXLENGTH="10"
						required onkeypress='return SomenteNumero(event)'>
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
							pattern="\([0-9]{2}\)[\s][0-9]{4,5}-[0-9]{4}">
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
					required>
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
					<option value="${perfil.id}">${perfil.nome}</option>
				</c:forEach>
			</select>
		</div>

		<!-- ATIVO -->
		<div class="form-group">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input"
					id="customCheck1" name="ativo" checked="checked"> <label
					class="custom-control-label" for="customCheck1">Ativo</label>
			</div>
		</div>

		<security:csrfInput />

		<!-- OBTIGATÓRIO -->
		<label for="obrigatorio">(*) Campos obrigatórios</label>
		<div>
			<button type="reset" class="btn btn-secondary btn-lg">
				<span class="glyphicon glyphicon-trash"></span> Limpar
			</button>
			<button type="submit" class="btn btn-primary btn-lg">
				<span class="glyphicon glyphicon-saved"></span> Salvar
			</button>
		</div>
	</form>
</div>

<script type="text/javascript"
	src="<c:url value="/resources/js/SomenteNumero.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.mask.min.js" />"></script>
<script src="<c:url value="/resources/js/confirma_senha.js" />"></script>
<script type="text/javascript">
	$("#telefone").mask("(00) 90000-0000");
</script>

<c:import url="../componentes/rodape.jsp" />