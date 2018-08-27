<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Demanda</title>
<c:import url="../componentes/cabecalho.jsp" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/jquery-ui.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/demanda.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/demanda/bootstrap-select.min.css" />">

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Editar Demanda</h1>
		<p class="lead">Preencha o formul�rio abaixo para realizar a
			formaliza��o da edi��o da demanda no sistema.</p>
	</div>
</div>

<div class="container">
	<form action="altera" method="POST">
		<input type="hidden" name="usuario.id" value="${usuario.id}">

		<!-- ID ITEM -->
		<input type="hidden" name="id" value="${item.id}">

		<h3 align="left">Informa��es do Item</h3>
		<hr />
		<fieldset class="form-group">
			<!-- Tipo do item: -->
			<div class="form-group">
				<label for="tipo" class="col-form-label">Tipo do item<span
					class="obrigatorio">*</span></label>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio1" name="tipo"
						class="custom-control-input" required value="Material de Consumo"
						${item.tipo eq "Material de Consumo" ? 'checked' : ''}> <label
						class="custom-control-label" for="customRadio1">Material
						de Consumo</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio2" name="tipo"
						class="custom-control-input" value="Material Permanente"
						${item.tipo eq "Material Permanente" ? 'checked' : ''}> <label
						class="custom-control-label" for="customRadio2">Material
						Permanente</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio3" name="tipo"
						class="custom-control-input" value="Servi�o N�O Continuado"
						${item.tipo eq "Servi�o N�O Continuado" ? 'checked' : ''}>
					<label class="custom-control-label" for="customRadio3">Servi�o
						N�O Continuado</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio4" name="tipo"
						class="custom-control-input" value="Servi�o Continuado"
						${item.tipo eq "Servi�o Continuado" ? 'checked' : ''}> <label
						class="custom-control-label" for="customRadio4">Servi�o
						Continuado</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio5" name="tipo"
						class="custom-control-input"
						value="Servi�o de Prazo Indeterminado"
						${item.tipo eq "Servi�o de Prazo Indeterminado" ? 'checked' : ''}>
					<label class="custom-control-label" for="customRadio5">Servi�o
						de Prazo Indeterminado**</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio6" name="tipo"
						class="custom-control-input" value="Obras"
						${item.tipo eq "Obras" ? 'checked' : ''}> <label
						class="custom-control-label" for="customRadio6">Obras</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio7" name="tipo"
						class="custom-control-input" value="Servi�os de Engenharia"
						${item.tipo eq "Servi�os de Engenharia" ? 'checked' : ''}>
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
							class="form-control maskCodigo" name="codigo" required
							value="${item.codigo}">
					</div>
				</div>

				<div class="col-9">
					<!-- Descri��o -->
					<div class="form-group">
						<label for="descricao" class="col-form-label">Descri��o<span
							class="obrigatorio">*</span></label> <input type="text"
							class="form-control" name="descricao" MAXLENGTH="255" required
							value="${item.descricao}">
					</div>
				</div>
			</div>

			<!-- Descri��o Detalhada -->
			<div class="form-group">
				<label for="descricao_detalhada">Descri��o Detalhada<span
					class="obrigatorio">*</span></label>
				<textarea class="form-control" name="descricao_detalhada" rows="3"
					required maxlength="3000">${item.descricao_detalhada}</textarea>
			</div>

			<div class="row">
				<div class="col-6">
					<!-- Unidade de Fornecimento -->
					<div class="form-group">
						<label for="unidade_fornecimento" class="col-form-label">Unidade
							de fornecimento<span class="obrigatorio">*</span>
						</label><input type="text" class="form-control"
							name="unidade_fornecimento" MAXLENGTH="255" required
							value="${item.unidade_fornecimento}">
					</div>
				</div>

				<div class="col-6">
					<!-- Quantidade -->
					<div class="form-group">
						<label for="quantidade" class="col-form-label">Quantidade<span
							class="obrigatorio">*</span></label><input type="text"
							class="form-control maskQuantidade" name="quantidade"
							id="quantidade" required value="${item.quantidade}">
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
								name="valor_unitario" id="valor_unitario_estimado" required
								value="${item.valor_unitario_estimado}"> <input
								type="hidden" name="valor_unitario_estimado" id="valor_unit">
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
					name="informacoes_orcamentarias" MAXLENGTH="255"
					value="${item.informacoes_orcamentarias}">
			</div>

			<!-- Vincular ao grupo -->
			<div class="form-group">
				<label for="grupo.id" class="col-form-label">Vincular ao
					grupo</label> <select name="grupo.id"
					class="selectpicker show-tick form-control" data-live-search="true"
					multiple data-max-options="1" title="Selecione um grupo"
					data-live-search-placeholder="Pesquisar">
					<c:forEach var="grupo" items="${grupos}">
						<option value="${grupo.id}"
							${item.grupo.id == grupo.id ? 'selected' : ''}>${grupo.nome}</option>
					</c:forEach>
				</select>
			</div>

			<fieldset class="form-group">
				<legend>INFORMA��ES GERENCIAIS</legend>

				<!-- ID INFORMA��ES GERENCIAIS -->
				<input type="hidden" name="informacoes_gerenciais.id"
					value="${item.informacoes_gerenciais.id}">

				<!-- Grau de prioridade da aquisi��o: -->
				<div class="form-group">
					<label for="informacoes_gerenciais.grau_prioridade"
						class="col-form-label">Grau de prioridade da aquisi��o<span
						class="obrigatorio">*</span>
					</label>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio8"
							name="informacoes_gerenciais.grau_prioridade"
							class="custom-control-input" required value="Baixa"
							${item.informacoes_gerenciais.grau_prioridade eq "Baixa" ? 'checked' : ''}>
						<label class="custom-control-label" for="customRadio8">Baixa</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio9"
							name="informacoes_gerenciais.grau_prioridade"
							class="custom-control-input" value="M�dia"
							${item.informacoes_gerenciais.grau_prioridade eq "M�dia" ? 'checked' : ''}>
						<label class="custom-control-label" for="customRadio9">M�dia</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio10"
							name="informacoes_gerenciais.grau_prioridade"
							class="custom-control-input" value="Alta"
							${item.informacoes_gerenciais.grau_prioridade eq "Alta" ? 'checked' : ''}>
						<label class="custom-control-label" for="customRadio10">Alta</label>
					</div>
				</div>

				<!-- Data estimada para a necessidade do item -->
				<div class="row">
					<div class="form-group col-6">
						<label for="informacoes_gerenciais.data_estimada"
							class="col-form-label">Data estimada para a necessidade
							do item<span class="obrigatorio">*</span>
						</label> <input type="text" class="form-control maskData"
							name="informacoes_gerenciais.data_estimada" required
							value="<fmt:formatDate value='${item.informacoes_gerenciais.data_estimada.time}' />">

					</div>
				</div>

				<!-- Data solicita��o do item -->
				<input type="hidden" name="informacoes_gerenciais.data_solicitacao"
					value="<fmt:formatDate value='${item.informacoes_gerenciais.data_solicitacao.time}' pattern="dd/MM/yyyy HH:mm:ss"/>">

				<!-- Informa��es adicionais -->
				<div class="form-group">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck1"
							name="informacoes_gerenciais.contratacao_emergencial"
							${item.informacoes_gerenciais.contratacao_emergencial eq true ? 'checked' : ''}>
						<label class="custom-control-label" for="customCheck1">Contrata��o
							emergencial ou remanescente (Lei n� 8.666/93, art. 24, incisos IV
							e XI)</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck2" name="informacoes_gerenciais.dispensa"
							${item.informacoes_gerenciais.dispensa eq true ? 'checked' : ''}>
						<label class="custom-control-label" for="customCheck2">Dispensa
							nos termos da Lei n� 8.666/93, art. 24, incisos I e II</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck3"
							name="informacoes_gerenciais.renovacao_contrato"
							${item.informacoes_gerenciais.renovacao_contrato eq true ? 'checked' : ''}>
						<label class="custom-control-label" for="customCheck3">Renova��o
							de contrato no exerc�cio subsequente, na forma do art. 57 da Lei
							n� 8.666, de 1993</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck4"
							name="informacoes_gerenciais.capacitacao_servidores"
							${item.informacoes_gerenciais.capacitacao_servidores eq true ? 'checked' : ''}>
						<label class="custom-control-label" for="customCheck4">Necessidade
							de capacita��o de servidores</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck5"
							name="informacoes_gerenciais.vinculacao_outro_item"
							${item.informacoes_gerenciais.vinculacao_outro_item eq true ? 'checked' : ''}>
						<label class="custom-control-label" for="customCheck5">Vincula��o
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
					<a href="<c:url value="/demanda/lista" />"
						class="btn btn-secondary btn-lg"> <span
						class="glyphicon glyphicon-remove"></span> Cancelar
					</a>
					<button type="submit" class="btn btn-primary btn-lg"
						onclick="alteraValoresNumericos()">
						<span class="glyphicon glyphicon-refresh"></span> Atualizar
					</button>
					<c:if test="${empty item.grupo}">
						<a
							href="<c:url value="/demanda/planejamento/item/edita?id=${item.id}" />"
							class="btn btn-warning btn-lg"> <span
							class="glyphicon glyphicon-list-alt"></span> Planejamento
						</a>
					</c:if>
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