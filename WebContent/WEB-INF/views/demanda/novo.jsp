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
					<input type="radio" id="customRadio8" name="grau_prioridade"
						class="custom-control-input required" checked="" required>
					<label class="custom-control-label" for="customRadio8">Baixa</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio9" name="grau_prioridade"
						class="custom-control-input" required> <label
						class="custom-control-label" for="customRadio9">M�dia</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="customRadio10" name="grau_prioridade"
						class="custom-control-input"> <label
						class="custom-control-label" for="customRadio10">Alta</label>
				</div>
			</div>

			<!-- Data estimada para a necessidade do item -->
			<div class="row">
				<div class="form-group col-6">
					<label for="data_estimada" class="col-form-label">Data
						estimada para a necessidade do item*</label> <input type="text"
						class="form-control data required" name="data_estimada"
						oninput="this.className = 'form-control'" data-mask="99/99/9999"
						required>
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
						id="customCheck2" name="dispensa" checked> <label
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

			<!-- Vincula��o ou depend�ncia com outro item -->
			<div class="row">
				<div class="form-group col-6">
					<label for="data_estimada" class="col-form-label">Outro
						item a ser vinculado*</label> <input type="text"
						class="form-control required" name="outro_item_vinculado"
						oninput="this.className = 'form-control'" required maxlength="255">
				</div>
			</div>
			<div>
				<p>(*) Campos obrigat�rios</p>
			</div>
		</div>

		<div class="tab">

			<h3 align="center">Estudos Preliminares</h3>
			<hr />

			<!-- 1. Necessidade da contrata��o* -->
			<div class="form-group">
				<label for="necessidade_contratacao" class="col-form-label">1.
					Necessidade da contrata��o*</label>
				<textarea class="form-control required"
					name="necessidade_contratacao" rows="3"
					oninput="this.className = 'form-control'" required></textarea>
			</div>

			<!-- 2. Refer�ncia a outros instrumentos de planejamento do �rg�o ou entidade, se houver -->
			<div class="form-group">
				<label for="ref_outros_instrumentos" class="col-form-label">2.
					Refer�ncia a outros instrumentos de planejamento do �rg�o ou
					entidade, se houver</label> <input type="text" class="form-control"
					name="ref_outros_instrumentos" MAXLENGTH="255"
					oninput="this.className = 'form-control'">
			</div>

			<!-- 3. Requisitos da contrata��o -->
			<div class="form-group">
				<label for="requisitos_contratacao" class="col-form-label">3.
					Requisitos da contrata��o</label> <input type="text" class="form-control"
					name="requisitos_contratacao" MAXLENGTH="255"
					oninput="this.className = 'form-control'">
			</div>

			<!-- 4. Estimativa das quantidades, acompanhadas das mem�rias de c�lculo e dos documentos que lhe d�o suporte* -->
			<div class="form-group">
				<label for="estimativa_quantidades" class="col-form-label">4.
					Estimativa das quantidades, acompanhadas das mem�rias de c�lculo e
					dos documentos que lhe d�o suporte*</label> <input type="text"
					class="form-control required" name="estimativa_quantidades"
					MAXLENGTH="10" oninput="this.className = 'form-control'"
					onkeypress='return SomenteNumero(event)' required>
			</div>

			<!-- 5. Levantamento de mercado e justificativa da escolha do tipo de solu��o a contratar -->
			<div class="form-group">
				<label for="levantamento_mercado" class="col-form-label">5.
					Levantamento de mercado e justificativa da escolha do tipo de
					solu��o a contratar</label> <input type="text" class="form-control"
					name="levantamento_mercado" MAXLENGTH="255"
					oninput="this.className = 'form-control'">
			</div>

			<!-- 6. Defini��o do m�todo para estimativas de pre�os ou dos meios de previs�o de pre�os referenciais* -->
			<div class="form-group">
				<label for="metodo_estimativa_preco" class="col-form-label">6.
					Defini��o do m�todo para estimativas de pre�os ou dos meios de
					previs�o de pre�os referenciais*</label> <input type="text"
					class="form-control required" name="metodo_estimativa_preco"
					MAXLENGTH="255" oninput="this.className = 'form-control'" required>
			</div>

			<!-- 7. Descri��o da solu��o como um todo -->
			<div class="form-group">
				<label for="descricao_solucao" class="col-form-label">7.
					Descri��o da solu��o como um todo</label>
				<textarea class="form-control" name="descricao_solucao" rows="3"
					oninput="this.className = 'form-control'"></textarea>
			</div>

			<!-- 8. Justificativas para o parcelamento ou n�o da solu��o, quando necess�ria para a individualiza��o do objeto* -->
			<div class="form-group">
				<label for="justificativa_parcelamento" class="col-form-label">8.
					Justificativas para o parcelamento ou n�o da solu��o, quando
					necess�ria para a individualiza��o do objeto*</label>
				<textarea class="form-control required"
					name="justificativa_parcelamento" rows="3"
					oninput="this.className = 'form-control'" required></textarea>
			</div>

			<!-- 9. Demonstrativo dos resultados pretendidos em termos de economicidade e de melhor aproveitamento dos recursos humanos, materiais ou financeiros dispon�veis -->
			<div class="form-group">
				<label for="resultados_pretendidos" class="col-form-label">9.
					Demonstrativo dos resultados pretendidos em termos de economicidade
					e de melhor aproveitamento dos recursos humanos, materiais ou
					financeiros dispon�veis</label> <input type="text" class="form-control"
					name="resultados_pretendidos" MAXLENGTH="255"
					oninput="this.className = 'form-control'">
			</div>

			<!-- 10. Provid�ncias para adequa��o do ambiente do �rg�o -->
			<div class="form-group">
				<label for="providencias_adequacao" class="col-form-label">10.
					Provid�ncias para adequa��o do ambiente do �rg�o</label> <input type="text"
					class="form-control" name="providencias_adequacao" MAXLENGTH="255"
					oninput="this.className = 'form-control'">
			</div>

			<!-- 11. Contrata��es correlatas e/ou interdependentes -->
			<div class="form-group">
				<label for="contratacoes_correlatas" class="col-form-label">11.
					Contrata��es correlatas e/ou interdependentes</label> <input type="text"
					class="form-control" name="contratacoes_correlatas" MAXLENGTH="255"
					oninput="this.className = 'form-control'">
			</div>

			<!-- 12. Declara��o da viabilidade ou n�o da contrata��o* -->
			<div class="form-group">
				<label for="declaracao_viabilidade" class="col-form-label">12.
					Declara��o da viabilidade ou n�o da contrata��o*</label>
				<textarea class="form-control required"
					name="declaracao_viabilidade" rows="3"
					oninput="this.className = 'form-control'" required></textarea>
			</div>

			<div>
				<p>(*) Nota: itens obrigat�rios conforme � 1� do art. 7� da
					Instru��o Normativa n� 1, de 29 de mar�o de 2018.</p>
			</div>
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