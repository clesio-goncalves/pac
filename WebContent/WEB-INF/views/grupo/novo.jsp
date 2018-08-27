<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Grupo</title>

<c:import url="../componentes/cabecalho.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Cadastrar Grupo</h1>
		<p class="lead">
			Preencha o formulário abaixo para realizar o cadastro do grupo no
			sistema. Possibilita <strong style="font-weight: bold;">agrupar
				vários itens para o registro de um único planejamento</strong> (Estudo
			preliminar e Gerenciamento de risco em comum). Ex: <strong
				style="font-weight: bold;">Materiais de limpeza</strong>.
	</div>
</div>
<div class="container">
	<form action="adiciona" method="POST">
		<input type="hidden" name="usuario.id" value="${usuario.id}">

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required>
		</div>

		<security:csrfInput />

		<!-- OBTIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<div>
			<button type="reset" class="btn btn-secondary btn-lg">
				<span class="glyphicon glyphicon-erase"></span> Limpar
			</button>
			<button type="submit" class="btn btn-primary btn-lg">
				<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
			</button>
		</div>
	</form>
</div>

<c:import url="../componentes/rodape.jsp" />