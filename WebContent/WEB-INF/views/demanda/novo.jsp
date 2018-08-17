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
		<p class="lead">Preencha o formul�rio abaixo para realizar a
			formaliza��o do cadastro da demanda no sistema.</p>
	</div>
</div>
<div class="container">
	<form id="regForm" action="adiciona" method="POST">

		<!-- One "tab" for each step in the form: -->
		<div class="tab">

			<h3 align="center">Informa��es do Item</h3>
			<hr />

			<!-- Tipo do item: -->
			<div class="form-group">
				<label for="tipo" class="col-form-label">Tipo do item*</label>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio1" name="tipo"
						class="custom-control-input required" checked="" required>
					<label class="custom-control-label" for="customRadio1">Material
						de Consumo</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio2" name="tipo"
						class="custom-control-input" required> <label
						class="custom-control-label" for="customRadio2">Material
						Permanente</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio3" name="tipo"
						class="custom-control-input"> <label
						class="custom-control-label" for="customRadio3">Servi�o
						N�O Continuado</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio4" name="tipo"
						class="custom-control-input"> <label
						class="custom-control-label" for="customRadio4">Servi�o
						Continuado</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio5" name="tipo"
						class="custom-control-input"> <label
						class="custom-control-label" for="customRadio5">Servi�o de
						Prazo Indeterminado**</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio6" name="tipo"
						class="custom-control-input"> <label
						class="custom-control-label" for="customRadio6">Obras</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio7" name="tipo"
						class="custom-control-input"> <label
						class="custom-control-label" for="customRadio7">Servi�os
						de Engenharia</label>
				</div>
			</div>

			<div class="row">
				<div class="col-3">
					<!-- C�digo do item -->
					<div class="form-group">
						<label for="codigo" class="col-form-label">C�digo do item*</label>
						<input type="text" class="form-control required" name="codigo"
							MAXLENGTH="10" required oninput="this.className = 'form-control'"
							onkeypress='return SomenteNumero(event)'>
					</div>
				</div>

				<div class="col-9">
					<!-- Descri��o -->
					<div class="form-group">
						<label for="descricao" class="col-form-label">Descri��o*</label> <input
							type="text" class="form-control required" name="descricao"
							MAXLENGTH="255" required
							oninput="this.className = 'form-control'">
					</div>
				</div>
			</div>

			<!-- Descri��o Detalhada -->
			<div class="form-group">
				<label for="descricao_detalhada">Descri��o Detalhada*</label>
				<textarea class="form-control required" name="descricao_detalhada"
					rows="3" oninput="this.className = 'form-control'" required></textarea>
			</div>

			<div class="row">
				<div class="col-6">
					<!-- Unidade de Fornecimento -->
					<div class="form-group">
						<label for="unidade_fornecimento" class="col-form-label">Unidade
							de fornecimento*</label><input type="text" class="form-control required"
							name="unidade_fornecimento" MAXLENGTH="255" required
							oninput="this.className = 'form-control'">
					</div>
				</div>

				<div class="col-6">
					<!-- Quantidade -->
					<div class="form-group">
						<label for="quantidade" class="col-form-label">Quantidade*</label><input
							type="text" class="form-control required" name="quantidade"
							MAXLENGTH="10" required oninput="this.className = 'form-control'"
							onkeypress='return SomenteNumero(event)'>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-6">
					<!-- Valor unit�rio estimado (R$) -->
					<div class="form-group">
						<label for="valor_unitario_estimado" class="col-form-label">Valor
							unit�rio estimado (R$)*</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">R$</span>
							</div>
							<input type="text" class="form-control required"
								name="valor_unitario_estimado" MAXLENGTH="10" required
								oninput="this.className = 'form-control'">
						</div>
					</div>
				</div>

				<div class="col-6">
					<!-- Valor total estimado (R$) -->
					<div class="form-group">
						<label for="valor_total_estimado" class="col-form-label">Valor
							total estimado (R$)*</label>
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

			<!-- Informa��es Or�ament�rias -->
			<div class="form-group">
				<label for="informacoes_orcamentarias" class="col-form-label">Informa��es
					Or�ament�rias</label> <input type="text" class="form-control"
					name="informacoes_orcamentarias" MAXLENGTH="255"
					oninput="this.className = 'form-control'">
			</div>

			<!-- Vincular ao grupo -->
			<div class="form-group">
				<label for="vincular_grupo" class="col-form-label">Vincular
					ao grupo</label> <input type="text" class="form-control"
					name="vincular_grupo" MAXLENGTH="255"
					oninput="this.className = 'form-control'">
			</div>
			<div>
				<p>(*) Campos obrigat�rios</p>
				<p>(**) Nota: para servi�os que podem ter vig�ncia indeterminada
					nos termos da Orienta��o Normativa AGU n� 36, de 2011, dentre eles:
					energia el�trica, �gua e esgoto, servi�os postais da ECT e ajustes
					firmados com a Imprensa Nacional.</p>
			</div>
		</div>

		<div class="tab">
			<h3 align="center">Informa��es Gerenciais</h3>
			<hr />

			<!-- Grau de prioridade da aquisi��o: -->
			<div class="form-group">
				<label for="grau_prioridade" class="col-form-label">Grau de
					prioridade da aquisi��o*</label>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio1" name="grau_prioridade"
						class="custom-control-input required" checked="" required>
					<label class="custom-control-label" for="customRadio1">Baixa</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio2" name="grau_prioridade"
						class="custom-control-input" required> <label
						class="custom-control-label" for="customRadio2">M�dia</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio3" name="grau_prioridade"
						class="custom-control-input"> <label
						class="custom-control-label" for="customRadio3">Alta</label>
				</div>
			</div>

			<!-- Data estimada para a necessidade do item -->
			<div class="form-group">
				<label for="data_estimada" class="col-form-label">Data
					estimada para a necessidade do item*</label> <input type="text"
					class="form-control data" name="data_estimada"
					oninput="this.className = 'form-control'" data-mask="99/99/9999">
			</div>


			<p>
				<input placeholder="E-mail..." oninput="this.className = ''">
			</p>
			<p>
				<input placeholder="Phone..." oninput="this.className = ''">
			</p>
		</div>

		<div class="tab">
			Birthday:
			<p>
				<input placeholder="dd" oninput="this.className = ''">
			</p>
			<p>
				<input placeholder="mm" oninput="this.className = ''">
			</p>
			<p>
				<input placeholder="yyyy" oninput="this.className = ''">
			</p>
		</div>

		<div class="tab">
			Login Info:
			<p>
				<input placeholder="Username..." oninput="this.className = ''">
			</p>
			<p>
				<input placeholder="Password..." oninput="this.className = ''">
			</p>
		</div>

		<div style="overflow: auto;">
			<div style="float: right;">
				<button type="button" class="btn btn-secondary" id="prevBtn"
					onclick="nextPrev(-1)">Voltar</button>
				<button type="button" class="btn btn-primary" id="nextBtn"
					onclick="nextPrev(1)">Avan�ar</button>
			</div>
		</div>

		<!-- Circles which indicates the steps of the form: -->
		<div style="text-align: center; margin-top: 40px;">
			<span class="step"></span> <span class="step"></span> <span
				class="step"></span> <span class="step"></span>
		</div>
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