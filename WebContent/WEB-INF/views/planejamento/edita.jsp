<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Cadastrar Planejamento</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Cadastrar Planejamento do item</h1>
		<p class="lead">Preencha o formulário abaixo para realizar o
			cadastro do planejamento do item da demanda no sistema.</p>
	</div>
</div>

<div class="container">
	<form action="adiciona" method="POST">

		<!-- ID -->
		<input type="hidden" name="item.id" value="${item.id}" />

		<fieldset class="form-group">
			<legend>ESTUDOS PRELIMINARES</legend>

			<!-- 1. Necessidade da contratação* -->
			<div class="form-group">
				<label for="necessidade_contratacao" class="col-form-label">1.Necessidade
					da contratação<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="necessidade_contratacao"
					rows="3" required maxlength="3000" autofocus></textarea>
			</div>

			<!-- 2. Referência a outros instrumentos de planejamento do órgão ou entidade, se houver -->
			<div class="form-group">
				<label for="ref_outros_instrumentos" class="col-form-label">2.
					Referência a outros instrumentos de planejamento do órgão ou
					entidade, se houver</label>
				<textarea class="form-control" name="ref_outros_instrumentos"
					rows="3" maxlength="3000"></textarea>
			</div>

			<!-- 3. Requisitos da contratação -->
			<div class="form-group">
				<label for="requisitos_contratacao" class="col-form-label">3.
					Requisitos da contratação</label>
				<textarea class="form-control" name="requisitos_contratacao"
					rows="3" maxlength="3000"></textarea>
			</div>

			<!-- 4. Estimativa das quantidades, acompanhadas das memórias de cálculo e dos documentos que lhe dão suporte* -->
			<div class="form-group">
				<label for="estimativa_quantidades" class="col-form-label">4.
					Estimativa das quantidades, acompanhadas das memórias de cálculo e
					dos documentos que lhe dão suporte<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="estimativa_quantidades"
					rows="3" required maxlength="3000"></textarea>
			</div>

			<!-- 5. Levantamento de mercado e justificativa da escolha do tipo de solução a contratar -->
			<div class="form-group">
				<label for="levantamento_mercado" class="col-form-label">5.
					Levantamento de mercado e justificativa da escolha do tipo de
					solução a contratar</label>
				<textarea class="form-control" name="levantamento_mercado" rows="3"
					maxlength="3000"></textarea>
			</div>

			<!-- 6. Definição do método para estimativas de preços ou dos meios de previsão de preços referenciais* -->
			<div class="form-group">
				<label for="metodo_estimativa_preco" class="col-form-label">6.
					Definição do método para estimativas de preços ou dos meios de
					previsão de preços referenciais<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="metodo_estimativa_preco"
					rows="3" required maxlength="3000"></textarea>
			</div>

			<!-- 7. Descrição da solução como um todo -->
			<div class="form-group">
				<label for="descricao_solucao" class="col-form-label">7.
					Descrição da solução como um todo</label>
				<textarea class="form-control" name="descricao_solucao" rows="3"
					maxlength="3000"></textarea>
			</div>

			<!-- 8. Justificativas para o parcelamento ou não da solução, quando necessária para a individualização do objeto* -->
			<div class="form-group">
				<label for="justificativa_parcelamento" class="col-form-label">8.
					Justificativas para o parcelamento ou não da solução, quando
					necessária para a individualização do objeto<span
					class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="justificativa_parcelamento"
					rows="3" required maxlength="3000"></textarea>
			</div>

			<!-- 9. Demonstrativo dos resultados pretendidos em termos de economicidade e de melhor aproveitamento dos recursos humanos, materiais ou financeiros disponíveis -->
			<div class="form-group">
				<label for="resultados_pretendidos" class="col-form-label">9.
					Demonstrativo dos resultados pretendidos em termos de economicidade
					e de melhor aproveitamento dos recursos humanos, materiais ou
					financeiros disponíveis</label>
				<textarea class="form-control" name="resultados_pretendidos"
					rows="3" maxlength="3000"></textarea>
			</div>

			<!-- 10. Providências para adequação do ambiente do órgão -->
			<div class="form-group">
				<label for="providencias_adequacao" class="col-form-label">10.
					Providências para adequação do ambiente do órgão</label>
				<textarea class="form-control" name="providencias_adequacao"
					rows="3" maxlength="3000"></textarea>
			</div>

			<!-- 11. Contratações correlatas e/ou interdependentes -->
			<div class="form-group">
				<label for="contratacoes_correlatas" class="col-form-label">11.
					Contratações correlatas e/ou interdependentes</label>
				<textarea class="form-control" name="contratacoes_correlatas"
					rows="3" maxlength="3000"></textarea>
			</div>

			<!-- 12. Declaração da viabilidade ou não da contratação* -->
			<div class="form-group">
				<label for="declaracao_viabilidade" class="col-form-label">12.
					Declaração da viabilidade ou não da contratação<span
					class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="declaracao_viabilidade"
					rows="3" required maxlength="3000"></textarea>
			</div>

			<fieldset class="form-group">
				<!-- TABELA GERENCIAMENTO RISCOS -->
				<div id="tabela_lista_riscos">
					<jsp:include page="risco/lista.jsp"></jsp:include>
				</div>

				<div>
					<p>(*) Campos obrigatórios</p>
				</div>

				<div>
					<a href="<c:url value="/demanda/lista" />"
						class="btn btn-secondary btn-lg"> <span
						class="glyphicon glyphicon-remove"></span> Cancelar
					</a>
					<button type="submit" class="btn btn-primary btn-lg">
						<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
					</button>
				</div>
			</fieldset>

			<security:csrfInput />
		</fieldset>
	</form>

	<!-- MODAL ADICIONA RISCO -->
	<jsp:include page="risco/modal_novo.jsp"></jsp:include>

	<!-- MODAL EDITA RISCO -->
	<div id="div_modal_editar">
		<jsp:include page="risco/modal_edita.jsp"></jsp:include>
	</div>

</div>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/demanda.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/demanda/risco.js" />"></script>

<c:import url="../componentes/rodape.jsp" />