<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Editar Planejamento</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Editar Planejamento do ${view}</h1>
		<p class="lead">Preencha o formul�rio abaixo para realizar a
			altera��o do planejamento do ${view} no sistema.</p>
	</div>
</div>

<div class="container">
	<form action="<c:url value="/demanda/planejamento/altera" />"
		method="POST">

		<!-- ESTUDO PRELIMINAR ID -->
		<input type="hidden" name="id" value="${estudo_preliminar.id}" />

		<fieldset class="form-group">
			<legend>ESTUDOS PRELIMINARES</legend>

			<!-- 1. Necessidade da contrata��o* -->
			<div class="form-group">
				<label for="necessidade_contratacao" class="col-form-label">1.Necessidade
					da contrata��o<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="necessidade_contratacao"
					rows="3" required maxlength="3000" autofocus>${estudo_preliminar.necessidade_contratacao}</textarea>
			</div>

			<!-- 2. Refer�ncia a outros instrumentos de planejamento do �rg�o ou entidade, se houver -->
			<div class="form-group">
				<label for="ref_outros_instrumentos" class="col-form-label">2.
					Refer�ncia a outros instrumentos de planejamento do �rg�o ou
					entidade, se houver</label>
				<textarea class="form-control" name="ref_outros_instrumentos"
					rows="3" maxlength="3000">${estudo_preliminar.ref_outros_instrumentos}</textarea>
			</div>

			<!-- 3. Requisitos da contrata��o -->
			<div class="form-group">
				<label for="requisitos_contratacao" class="col-form-label">3.
					Requisitos da contrata��o</label>
				<textarea class="form-control" name="requisitos_contratacao"
					rows="3" maxlength="3000">${estudo_preliminar.requisitos_contratacao}</textarea>
			</div>

			<!-- 4. Estimativa das quantidades, acompanhadas das mem�rias de c�lculo e dos documentos que lhe d�o suporte* -->
			<div class="form-group">
				<label for="estimativa_quantidades" class="col-form-label">4.
					Estimativa das quantidades, acompanhadas das mem�rias de c�lculo e
					dos documentos que lhe d�o suporte<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="estimativa_quantidades"
					rows="3" required maxlength="3000">${estudo_preliminar.estimativa_quantidades}</textarea>
			</div>

			<!-- 5. Levantamento de mercado e justificativa da escolha do tipo de solu��o a contratar -->
			<div class="form-group">
				<label for="levantamento_mercado" class="col-form-label">5.
					Levantamento de mercado e justificativa da escolha do tipo de
					solu��o a contratar</label>
				<textarea class="form-control" name="levantamento_mercado" rows="3"
					maxlength="3000">${estudo_preliminar.levantamento_mercado}</textarea>
			</div>

			<!-- 6. Defini��o do m�todo para estimativas de pre�os ou dos meios de previs�o de pre�os referenciais* -->
			<div class="form-group">
				<label for="metodo_estimativa_preco" class="col-form-label">6.
					Defini��o do m�todo para estimativas de pre�os ou dos meios de
					previs�o de pre�os referenciais<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="metodo_estimativa_preco"
					rows="3" required maxlength="3000">${estudo_preliminar.metodo_estimativa_preco}</textarea>
			</div>

			<!-- 7. Descri��o da solu��o como um todo -->
			<div class="form-group">
				<label for="descricao_solucao" class="col-form-label">7.
					Descri��o da solu��o como um todo</label>
				<textarea class="form-control" name="descricao_solucao" rows="3"
					maxlength="3000">${estudo_preliminar.descricao_solucao}</textarea>
			</div>

			<!-- 8. Justificativas para o parcelamento ou n�o da solu��o, quando necess�ria para a individualiza��o do objeto* -->
			<div class="form-group">
				<label for="justificativa_parcelamento" class="col-form-label">8.
					Justificativas para o parcelamento ou n�o da solu��o, quando
					necess�ria para a individualiza��o do objeto<span
					class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="justificativa_parcelamento"
					rows="3" required maxlength="3000">${estudo_preliminar.justificativa_parcelamento}</textarea>
			</div>

			<!-- 9. Demonstrativo dos resultados pretendidos em termos de economicidade e de melhor aproveitamento dos recursos humanos, materiais ou financeiros dispon�veis -->
			<div class="form-group">
				<label for="resultados_pretendidos" class="col-form-label">9.
					Demonstrativo dos resultados pretendidos em termos de economicidade
					e de melhor aproveitamento dos recursos humanos, materiais ou
					financeiros dispon�veis</label>
				<textarea class="form-control" name="resultados_pretendidos"
					rows="3" maxlength="3000">${estudo_preliminar.resultados_pretendidos}</textarea>
			</div>

			<!-- 10. Provid�ncias para adequa��o do ambiente do �rg�o -->
			<div class="form-group">
				<label for="providencias_adequacao" class="col-form-label">10.
					Provid�ncias para adequa��o do ambiente do �rg�o</label>
				<textarea class="form-control" name="providencias_adequacao"
					rows="3" maxlength="3000">${estudo_preliminar.providencias_adequacao}</textarea>
			</div>

			<!-- 11. Contrata��es correlatas e/ou interdependentes -->
			<div class="form-group">
				<label for="contratacoes_correlatas" class="col-form-label">11.
					Contrata��es correlatas e/ou interdependentes</label>
				<textarea class="form-control" name="contratacoes_correlatas"
					rows="3" maxlength="3000">${estudo_preliminar.contratacoes_correlatas}</textarea>
			</div>

			<!-- 12. Declara��o da viabilidade ou n�o da contrata��o* -->
			<div class="form-group">
				<label for="declaracao_viabilidade" class="col-form-label">12.
					Declara��o da viabilidade ou n�o da contrata��o<span
					class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="declaracao_viabilidade"
					rows="3" required maxlength="3000">${estudo_preliminar.declaracao_viabilidade}</textarea>
			</div>

			<fieldset class="form-group">
				<!-- TABELA GERENCIAMENTO RISCOS -->
				<div id="tabela_lista_riscos">
					<jsp:include page="risco/lista.jsp"></jsp:include>
				</div>

				<div>
					<p>(*) Campos obrigat�rios</p>
				</div>
			</fieldset>
		</fieldset>

		<security:csrfInput />

		<div>
			<c:if test="${view eq 'item'}">
				<input type="hidden" name="item.id" value="${item.id}" />
				<a class="btn btn-success btn-lg"
					href="<c:url value="/demanda/edita?id=${item.id}" />"><span
					class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
				<a href="<c:url value="/demanda/lista" />"
					class="btn btn-secondary btn-lg"> <span
					class="glyphicon glyphicon-remove"></span> Cancelar
				</a>
			</c:if>
			<c:if test="${view eq 'grupo'}">
				<input type="hidden" name="grupo.id" value="${grupo.id}" />
				<a class="btn btn-success btn-lg"
					href="<c:url value="/grupo/edita?id=${grupo.id}" />"><span
					class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
				<a href="<c:url value="/grupo/lista" />"
					class="btn btn-secondary btn-lg"> <span
					class="glyphicon glyphicon-remove"></span> Cancelar
				</a>
			</c:if>
			<button type="submit" class="btn btn-primary btn-lg">
				<span class="glyphicon glyphicon-refresh"></span> Atualizar
			</button>
		</div>
	</form>

	<!-- MODAL ADICIONA RISCO -->
	<jsp:include page="risco/modal_novo.jsp"></jsp:include>

	<!-- MODAL EDITA RISCO -->
	<div id="div_modal_editar">
		<jsp:include page="risco/modal_edita.jsp"></jsp:include>
	</div>

</div>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/risco.js" />"></script>

<c:import url="../componentes/rodape.jsp" />