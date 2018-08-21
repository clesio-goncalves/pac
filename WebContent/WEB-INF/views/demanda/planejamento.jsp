<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Planejamento</title>
<c:import url="../componentes/cabecalho.jsp" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/jquery-ui.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/demanda.css" />">

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">Cadastrar Planejamento do item</h1>
		<p class="lead">Preencha o formulário abaixo para realizar o
			cadastro do planejamento do item da demanda no sistema.</p>
	</div>
</div>

<div class="container">
	<form action="adiciona-planejamento" method="POST">

		<!-- ID -->
		<input type="hidden" name="item.id" value="${item}" />

		<fieldset class="form-group">
			<legend>ESTUDOS PRELIMINARES</legend>

			<!-- 1. Necessidade da contratação* -->
			<div class="form-group">
				<label for="necessidade_contratacao" class="col-form-label">1.Necessidade
					da contratação<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="necessidade_contratacao"
					rows="3" oninput="this.className = 'form-control'" required
					maxlength="3000" autofocus></textarea>
			</div>

			<!-- 2. Referência a outros instrumentos de planejamento do órgão ou entidade, se houver -->
			<div class="form-group">
				<label for="ref_outros_instrumentos" class="col-form-label">2.
					Referência a outros instrumentos de planejamento do órgão ou
					entidade, se houver</label>
				<textarea class="form-control" name="ref_outros_instrumentos"
					rows="3" oninput="this.className = 'form-control'" maxlength="3000"></textarea>
			</div>

			<!-- 3. Requisitos da contratação -->
			<div class="form-group">
				<label for="requisitos_contratacao" class="col-form-label">3.
					Requisitos da contratação</label>
				<textarea class="form-control" name="requisitos_contratacao"
					rows="3" oninput="this.className = 'form-control'" maxlength="3000"></textarea>
			</div>

			<!-- 4. Estimativa das quantidades, acompanhadas das memórias de cálculo e dos documentos que lhe dão suporte* -->
			<div class="form-group">
				<label for="estimativa_quantidades" class="col-form-label">4.
					Estimativa das quantidades, acompanhadas das memórias de cálculo e
					dos documentos que lhe dão suporte<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="estimativa_quantidades"
					rows="3" oninput="this.className = 'form-control'" required
					maxlength="3000"></textarea>
			</div>

			<!-- 5. Levantamento de mercado e justificativa da escolha do tipo de solução a contratar -->
			<div class="form-group">
				<label for="levantamento_mercado" class="col-form-label">5.
					Levantamento de mercado e justificativa da escolha do tipo de
					solução a contratar</label>
				<textarea class="form-control" name="levantamento_mercado" rows="3"
					oninput="this.className = 'form-control'" maxlength="3000"></textarea>
			</div>

			<!-- 6. Definição do método para estimativas de preços ou dos meios de previsão de preços referenciais* -->
			<div class="form-group">
				<label for="metodo_estimativa_preco" class="col-form-label">6.
					Definição do método para estimativas de preços ou dos meios de
					previsão de preços referenciais<span class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="metodo_estimativa_preco"
					rows="3" oninput="this.className = 'form-control'" required
					maxlength="3000"></textarea>
			</div>

			<!-- 7. Descrição da solução como um todo -->
			<div class="form-group">
				<label for="descricao_solucao" class="col-form-label">7.
					Descrição da solução como um todo</label>
				<textarea class="form-control" name="descricao_solucao" rows="3"
					oninput="this.className = 'form-control'" maxlength="3000"></textarea>
			</div>

			<!-- 8. Justificativas para o parcelamento ou não da solução, quando necessária para a individualização do objeto* -->
			<div class="form-group">
				<label for="justificativa_parcelamento" class="col-form-label">8.
					Justificativas para o parcelamento ou não da solução, quando
					necessária para a individualização do objeto<span
					class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="justificativa_parcelamento"
					rows="3" oninput="this.className = 'form-control'" required
					maxlength="3000"></textarea>
			</div>

			<!-- 9. Demonstrativo dos resultados pretendidos em termos de economicidade e de melhor aproveitamento dos recursos humanos, materiais ou financeiros disponíveis -->
			<div class="form-group">
				<label for="resultados_pretendidos" class="col-form-label">9.
					Demonstrativo dos resultados pretendidos em termos de economicidade
					e de melhor aproveitamento dos recursos humanos, materiais ou
					financeiros disponíveis</label>
				<textarea class="form-control" name="resultados_pretendidos"
					rows="3" oninput="this.className = 'form-control'" maxlength="3000"></textarea>
			</div>

			<!-- 10. Providências para adequação do ambiente do órgão -->
			<div class="form-group">
				<label for="providencias_adequacao" class="col-form-label">10.
					Providências para adequação do ambiente do órgão</label>
				<textarea class="form-control" name="providencias_adequacao"
					rows="3" oninput="this.className = 'form-control'" maxlength="3000"></textarea>
			</div>

			<!-- 11. Contratações correlatas e/ou interdependentes -->
			<div class="form-group">
				<label for="contratacoes_correlatas" class="col-form-label">11.
					Contratações correlatas e/ou interdependentes</label>
				<textarea class="form-control" name="contratacoes_correlatas"
					rows="3" oninput="this.className = 'form-control'" maxlength="3000"></textarea>
			</div>

			<!-- 12. Declaração da viabilidade ou não da contratação* -->
			<div class="form-group">
				<label for="declaracao_viabilidade" class="col-form-label">12.
					Declaração da viabilidade ou não da contratação<span
					class="obrigatorio">*</span>
				</label>
				<textarea class="form-control" name="declaracao_viabilidade"
					rows="3" oninput="this.className = 'form-control'" required
					maxlength="3000"></textarea>
			</div>

			<fieldset class="form-group">
				<legend>GERENCIAMENTO DE RISCOS</legend>

				<button type="button" class="btn btn-warning btn-lg"
					data-toggle="modal" data-target="#adicionar_risco">
					<span class="glyphicon glyphicon-plus-sign"></span> Adicionar risco
				</button>
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

	<div class="modal fade" id="adicionar_risco">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Mapa de risco</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="" method="POST">
						<!-- Descrição -->
						<div class="form-group">
							<label for="descricao" class="col-form-label">Descrição<span
								class="obrigatorio">*</span></label> <input type="text"
								class="form-control" name="descricao" MAXLENGTH="255" required>
						</div>

						<!-- Probabilidade -->
						<div class="row">
							<div class="form-group col">
								<label for="probabilidade" class="col-form-label">Probabilidade<span
									class="obrigatorio">*</span>
								</label>
								<div class="custom-control custom-radio">
									<input type="radio" id="customRadio1" name="probabilidade"
										class="custom-control-input" checked required value="Baixa">
									<label class="custom-control-label" for="customRadio1">Baixa</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" id="customRadio9" name="probabilidade"
										class="custom-control-input" value="Média"> <label
										class="custom-control-label" for="customRadio2">Média</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" id="customRadio3" name="probabilidade"
										class="custom-control-input" value="Alta"> <label
										class="custom-control-label" for="customRadio3">Alta</label>
								</div>
							</div>

							<!-- Impacto -->
							<div class="form-group col">
								<label for="probabilidade" class="col-form-label">Impacto<span
									class="obrigatorio">*</span>
								</label>
								<div class="custom-control custom-radio">
									<input type="radio" id="customRadio1" name="probabilidade"
										class="custom-control-input" checked required value="Baixa">
									<label class="custom-control-label" for="customRadio1">Baixa</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" id="customRadio9" name="probabilidade"
										class="custom-control-input" value="Média"> <label
										class="custom-control-label" for="customRadio2">Média</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" id="customRadio3" name="probabilidade"
										class="custom-control-input" value="Alta"> <label
										class="custom-control-label" for="customRadio3">Alta</label>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="#" class="btn btn-primary"><span
						class="glyphicon glyphicon-floppy-disk"></span> Salvar</a>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-log-out"></span> Fechar
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript"
	src="<c:url value="/resources/js/demanda.js" />"></script>

<c:import url="../componentes/rodape.jsp" />