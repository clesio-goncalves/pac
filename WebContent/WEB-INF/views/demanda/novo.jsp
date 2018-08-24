<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Demanda</title>
<c:import url="../componentes/cabecalho.jsp" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/jquery-ui.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/demanda.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/demanda/bootstrap-select.min.css" />">

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Cadastrar Demanda</h1>
		<p class="lead">Preencha o formul�rio abaixo para realizar a
			formaliza��o do cadastro da demanda no sistema.</p>
	</div>
</div>

<div class="container">
	<form action="adiciona" method="POST">
		<input type="hidden" name="usuario.id" value="${usuario.id}">

		<h3 align="left">Informa��es do Item</h3>
		<hr />
		<fieldset class="form-group">
			<!-- Tipo do item: -->
			<div class="form-group">
				<label for="tipo" class="col-form-label">Tipo do item<span
					class="obrigatorio">*</span></label>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio1" name="tipo"
						class="custom-control-input" checked required
						value="Material de Consumo"> <label
						class="custom-control-label" for="customRadio1">Material
						de Consumo</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio2" name="tipo"
						class="custom-control-input" value="Material Permanente">
					<label class="custom-control-label" for="customRadio2">Material
						Permanente</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio3" name="tipo"
						class="custom-control-input" value="Servi�o N�O Continuado">
					<label class="custom-control-label" for="customRadio3">Servi�o
						N�O Continuado</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio4" name="tipo"
						class="custom-control-input" value="Servi�o Continuado"> <label
						class="custom-control-label" for="customRadio4">Servi�o
						Continuado</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio5" name="tipo"
						class="custom-control-input"
						value="Servi�o de Prazo Indeterminado"> <label
						class="custom-control-label" for="customRadio5">Servi�o de
						Prazo Indeterminado**</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio6" name="tipo"
						class="custom-control-input" value="Obras"> <label
						class="custom-control-label" for="customRadio6">Obras</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio7" name="tipo"
						class="custom-control-input" value="Servi�os de Engenharia">
					<label class="custom-control-label" for="customRadio7">Servi�os
						de Engenharia</label>
				</div>
			</div>

			<div class="row">
				<div class="col-3">
					<!-- C�digo do item -->
					<div class="form-group">
						<label for="codigo" class="col-form-label">C�digo do item<span
							class="obrigatorio">*</span></label> <input type="text"
							class="form-control maskCodigo" name="codigo" required>
					</div>
				</div>

				<div class="col-9">
					<!-- Descri��o -->
					<div class="form-group">
						<label for="descricao" class="col-form-label">Descri��o<span
							class="obrigatorio">*</span></label> <input type="text"
							class="form-control" name="descricao" MAXLENGTH="255" required>
					</div>
				</div>
			</div>

			<!-- Descri��o Detalhada -->
			<div class="form-group">
				<label for="descricao_detalhada">Descri��o Detalhada<span
					class="obrigatorio">*</span></label>
				<textarea class="form-control" name="descricao_detalhada" rows="3"
					required maxlength="3000"></textarea>
			</div>

			<div class="row">
				<div class="col-6">
					<!-- Unidade de Fornecimento -->
					<div class="form-group">
						<label for="unidade_fornecimento" class="col-form-label">Unidade
							de fornecimento<span class="obrigatorio">*</span>
						</label><input type="text" class="form-control"
							name="unidade_fornecimento" MAXLENGTH="255" required>
					</div>
				</div>

				<div class="col-6">
					<!-- Quantidade -->
					<div class="form-group">
						<label for="quantidade" class="col-form-label">Quantidade<span
							class="obrigatorio">*</span></label><input type="text"
							class="form-control maskQuantidade" name="quantidade"
							id="quantidade" required>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-6">
					<!-- Valor unit�rio estimado (R$) -->
					<div class="form-group">
						<label for="valor_unitario" class="col-form-label">Valor
							unit�rio estimado (R$)<span class="obrigatorio">*</span>
						</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">R$</span>
							</div>
							<input type="text" class="form-control maskDinheiro"
								name="valor_unitario" id="valor_unitario_estimado" required>
							<input type="hidden" name="valor_unitario_estimado"
								id="valor_unit">
						</div>
					</div>
				</div>

				<div class="col-6">
					<!-- Valor total estimado (R$) -->
					<div class="form-group">
						<label for="valor_total_estimado" class="col-form-label">Valor
							total estimado (R$)<span class="obrigatorio">*</span>
						</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">R$</span>
							</div>
							<input type="text" class="form-control maskDinheiro"
								name="valor_total_estimado" id="valor_total_estimado"
								readonly="readonly">
						</div>
					</div>
				</div>
			</div>

			<!-- Informa��es Or�ament�rias -->
			<div class="form-group">
				<label for="informacoes_orcamentarias" class="col-form-label">Informa��es
					Or�ament�rias</label> <input type="text" class="form-control"
					name="informacoes_orcamentarias" MAXLENGTH="255">
			</div>

			<!-- Vincular ao grupo -->
			<div class="form-group">
				<label for="grupo.id" class="col-form-label">Vincular ao
					grupo</label> <select name="grupo.id"
					class="selectpicker show-tick form-control" data-live-search="true"
					multiple data-max-options="1" title="Selecione um grupo"
					data-live-search-placeholder="Pesquisar">
					<c:forEach var="grupo" items="${grupos}">
						<option value="${grupo.id}">${grupo.nome}</option>
					</c:forEach>
				</select>
			</div>

			<fieldset class="form-group">
				<legend>INFORMA��ES GERENCIAIS</legend>

				<!-- Grau de prioridade da aquisi��o: -->
				<div class="form-group">
					<label for="grau_prioridade" class="col-form-label">Grau de
						prioridade da aquisi��o<span class="obrigatorio">*</span>
					</label>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio8" name="grau_prioridade"
							class="custom-control-input" checked required value="Baixa">
						<label class="custom-control-label" for="customRadio8">Baixa</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio9" name="grau_prioridade"
							class="custom-control-input" value="M�dia"> <label
							class="custom-control-label" for="customRadio9">M�dia</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio10" name="grau_prioridade"
							class="custom-control-input" value="Alta"> <label
							class="custom-control-label" for="customRadio10">Alta</label>
					</div>
				</div>

				<!-- Data estimada para a necessidade do item -->
				<div class="row">
					<div class="form-group col-6">
						<label for="data_estimada" class="col-form-label">Data
							estimada para a necessidade do item<span class="obrigatorio">*</span>
						</label> <input type="text" class="form-control maskData"
							name="data_estimada" required>
					</div>
				</div>

				<!-- Informa��es adicionais -->
				<div class="form-group">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck1" name="contratacao_emergencial"> <label
							class="custom-control-label" for="customCheck1">Contrata��o
							emergencial ou remanescente (Lei n� 8.666/93, art. 24, incisos IV
							e XI)</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck2" name="dispensa" checked="checked"> <label
							class="custom-control-label" for="customCheck2">Dispensa
							nos termos da Lei n� 8.666/93, art. 24, incisos I e II</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck3" name="renovacao_contrato"> <label
							class="custom-control-label" for="customCheck3">Renova��o
							de contrato no exerc�cio subsequente, na forma do art. 57 da Lei
							n� 8.666, de 1993</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck4" name="capacitacao_servidores"> <label
							class="custom-control-label" for="customCheck4">Necessidade
							de capacita��o de servidores</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck5" name="vinculacao_outro_item"> <label
							class="custom-control-label" for="customCheck5">Vincula��o
							ou depend�ncia com outro item</label>
					</div>
				</div>
				<div>
					<p>(*) Campos obrigat�rios</p>
					<p>(**) Nota: para servi�os que podem ter vig�ncia
						indeterminada nos termos da Orienta��o Normativa AGU n� 36, de
						2011, dentre eles: energia el�trica, �gua e esgoto, servi�os
						postais da ECT e ajustes firmados com a Imprensa Nacional.</p>
				</div>

				<div>
					<button type="reset" class="btn btn-secondary btn-lg" id="limpar">
						<span class="glyphicon glyphicon-erase"></span> Limpar
					</button>
					<button type="submit" class="btn btn-primary btn-lg"
						onclick="alteraValoresNumericos()">
						<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
					</button>
				</div>
			</fieldset>

			<security:csrfInput />
		</fieldset>
	</form>
</div>

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.mask.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/demanda.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/bootstrap-select.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/defaults-pt_BR.min.js" />"></script>

<c:import url="../componentes/rodape.jsp" />