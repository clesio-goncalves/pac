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
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Cadastrar Demanda</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			formalização do cadastro da demanda no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="adiciona" method="POST">

		<input type="hidden" name="usuario.id" value="${usuario.id}">

		<h3 align="left">Informações do Item</h3>
		<hr />
		<fieldset class="form-group">
			<!-- Tipo do item: -->
			<div class="form-group">
				<label for="tipo" class="col-form-label">Tipo do item<span
					class="obrigatorio">*</span></label>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio1" name="tipo"
						class="custom-control-input" checked="" required
						value="Material de Consumo"> <label
						class="custom-control-label" for="customRadio1">Material
						de Consumo</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio2" name="tipo"
						class="custom-control-input" value="Material
						Permanente">
					<label class="custom-control-label" for="customRadio2">Material
						Permanente</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio3" name="tipo"
						class="custom-control-input" value="Serviço
						NÃO Continuado">
					<label class="custom-control-label" for="customRadio3">Serviço
						NÃO Continuado</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio4" name="tipo"
						class="custom-control-input" value="Serviço
						Continuado">
					<label class="custom-control-label" for="customRadio4">Serviço
						Continuado</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio5" name="tipo"
						class="custom-control-input"
						value="Serviço de
						Prazo Indeterminado"> <label
						class="custom-control-label" for="customRadio5">Serviço de
						Prazo Indeterminado**</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio6" name="tipo"
						class="custom-control-input" value="Obras"> <label
						class="custom-control-label" for="customRadio6">Obras</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio7" name="tipo"
						class="custom-control-input" value="Serviços
						de Engenharia">
					<label class="custom-control-label" for="customRadio7">Serviços
						de Engenharia</label>
				</div>
			</div>

			<div class="row">
				<div class="col-3">
					<!-- Código do item -->
					<div class="form-group">
						<label for="codigo" class="col-form-label">Código do item<span
							class="obrigatorio">*</span></label> <input type="text"
							class="form-control required" name="codigo" MAXLENGTH="10"
							required onkeypress='return SomenteNumero(event)'>
					</div>
				</div>

				<div class="col-9">
					<!-- Descrição -->
					<div class="form-group">
						<label for="descricao" class="col-form-label">Descrição<span
							class="obrigatorio">*</span></label> <input type="text"
							class="form-control required" name="descricao" MAXLENGTH="255"
							required>
					</div>
				</div>
			</div>

			<!-- Descrição Detalhada -->
			<div class="form-group">
				<label for="descricao_detalhada">Descrição Detalhada<span
					class="obrigatorio">*</span></label>
				<textarea class="form-control required" name="descricao_detalhada"
					rows="3" required maxlength="3000"></textarea>
			</div>

			<div class="row">
				<div class="col-6">
					<!-- Unidade de Fornecimento -->
					<div class="form-group">
						<label for="unidade_fornecimento" class="col-form-label">Unidade
							de fornecimento<span class="obrigatorio">*</span>
						</label><input type="text" class="form-control required"
							name="unidade_fornecimento" MAXLENGTH="255" required>
					</div>
				</div>

				<div class="col-6">
					<!-- Quantidade -->
					<div class="form-group">
						<label for="quantidade" class="col-form-label">Quantidade<span
							class="obrigatorio">*</span></label><input type="text"
							class="form-control required" name="quantidade" MAXLENGTH="10"
							required onkeypress='return SomenteNumero(event)'>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-6">
					<!-- Valor unitário estimado (R$) -->
					<div class="form-group">
						<label for="valor_unitario_estimado" class="col-form-label">Valor
							unitário estimado (R$)<span class="obrigatorio">*</span>
						</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">R$</span>
							</div>
							<input type="text" class="form-control required"
								name="valor_unitario_estimado" MAXLENGTH="10" required>
						</div>
					</div>
				</div>

				<div class="col-6">
					<!-- Valor total estimado (R$) -->
					<div class="form-group">
						<label for="valor_total_estimado" class="col-form-label">Valor
							total estimado (R$)</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">R$</span>
							</div>
							<input type="text" class="form-control"
								name="valor_total_estimado" MAXLENGTH="10" disabled="disabled">
						</div>
					</div>
				</div>
			</div>

			<!-- Informações Orçamentárias -->
			<div class="form-group">
				<label for="informacoes_orcamentarias" class="col-form-label">Informações
					Orçamentárias</label> <input type="text" class="form-control"
					name="informacoes_orcamentarias" MAXLENGTH="255">
			</div>

			<!-- Vincular ao grupo -->
			<div class="form-group">
				<label for="vincular_grupo" class="col-form-label">Vincular
					ao grupo</label> <input type="text" class="form-control"
					name="vincular_grupo" MAXLENGTH="255">
			</div>

			<h3>Informações Gerenciais</h3>
			<hr />

			<!-- Grau de prioridade da aquisição: -->
			<div class="form-group">
				<label for="grau_prioridade" class="col-form-label">Grau de
					prioridade da aquisição<span class="obrigatorio">*</span>
				</label>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio8" name="grau_prioridade"
						class="custom-control-input" checked="" required value="Baixa">
					<label class="custom-control-label" for="customRadio8">Baixa</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio9" name="grau_prioridade"
						class="custom-control-input" value="Média"> <label
						class="custom-control-label" for="customRadio9">Média</label>
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
					</label> <input type="text" class="form-control data" name="data_estimada"
						data-mask="99/99/9999" required>
				</div>
			</div>

			<!-- Informações adicionais -->
			<div class="form-group">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck1" name="contratacao_emergencial"> <label
						class="custom-control-label" for="customCheck1">Contratação
						emergencial ou remanescente (Lei n° 8.666/93, art. 24, incisos IV
						e XI)</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck2" name="dispensa"> <label
						class="custom-control-label" for="customCheck2">Dispensa
						nos termos da Lei n° 8.666/93, art. 24, incisos I e II</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck3" name="renovacao_contrato"> <label
						class="custom-control-label" for="customCheck3">Renovação
						de contrato no exercício subsequente, na forma do art. 57 da Lei
						nº 8.666, de 1993</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck4" name="capacitacao_servidores"> <label
						class="custom-control-label" for="customCheck4">Necessidade
						de capacitação de servidores</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck5" name="vinculacao_outro_item"> <label
						class="custom-control-label" for="customCheck5">Vinculação
						ou dependência com outro item</label>
				</div>
			</div>
			<div>
				<p>(*) Campos obrigatórios</p>
				<p>(**) Nota: para serviços que podem ter vigência indeterminada
					nos termos da Orientação Normativa AGU n° 36, de 2011, dentre eles:
					energia elétrica, água e esgoto, serviços postais da ECT e ajustes
					firmados com a Imprensa Nacional.</p>
			</div>

			<security:csrfInput />

		</fieldset>
	</form>
</div>

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.mask.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/SomenteNumero.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda.js" />"></script>

<c:import url="../componentes/rodape.jsp" />