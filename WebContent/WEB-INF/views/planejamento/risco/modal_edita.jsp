<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="contexto" />
<div class="modal fade" id="modal_edita">
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

				<!-- ID -->
				<input type="hidden" name="edita_risco_id" value="${risco.id}">

				<!-- Descri��o -->
				<div class="form-group" id="form-group">
					<label for="edita_descricao"
						class="col-form-label col-form-label-sm">Descri��o<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm" name="edita_descricao"
						MAXLENGTH="255" required value="${risco.descricao}">
				</div>

				<!-- Probabilidade -->
				<div class="row">
					<div class="form-group col" id="form-group">
						<label for="edita_probabilidade"
							class="col-form-label col-form-label-sm">Probabilidade<span
							class="obrigatorio">*</span>
						</label> <select class="form-control form-control-sm"
							name="edita_probabilidade" required>
							<option value="Baixa"
								${risco.probabilidade eq "Baixa" ? 'selected' : ''}>Baixa</option>
							<option value="M�dia"
								${risco.probabilidade eq "M�dia" ? 'selected' : ''}>M�dia</option>
							<option value="Alta"
								${risco.probabilidade eq "Alta" ? 'selected' : ''}>Alta</option>
						</select>
					</div>

					<!-- Impacto -->
					<div class="form-group col" id="form-group">
						<label for="edita_impacto"
							class="col-form-label col-form-label-sm">Impacto<span
							class="obrigatorio">*</span>
						</label> <select class="form-control form-control-sm" name="edita_impacto"
							required>
							<option value="Baixo"
								${risco.impacto eq "Baixo" ? 'selected' : ''}>Baixo</option>
							<option value="M�dio"
								${risco.impacto eq "M�dio" ? 'selected' : ''}>M�dio</option>
							<option value="Alto" ${risco.impacto eq "Alto" ? 'selected' : ''}>Alto</option>
						</select>
					</div>
				</div>

				<!-- A��o preventiva -->
				<div class="form-group" id="form-group">
					<label for="edita_acao_preventiva"
						class="col-form-label col-form-label-sm">A��o Preventiva<span
						class="obrigatorio">*</span>
					</label>
					<textarea class="form-control form-control-sm"
						name="edita_acao_preventiva" rows="2" required maxlength="3000">${risco.acao_preventiva}</textarea>
				</div>

				<!-- Respons�vel -->
				<div class="form-group" id="form-group">
					<label for="edita_responsavel_acao_preventiva"
						class="col-form-label col-form-label-sm">Respons�vel<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm"
						name="edita_responsavel_acao_preventiva" MAXLENGTH="255" required
						value="${risco.responsavel_acao_preventiva}">
				</div>

				<!-- A��o de contig�ncia -->
				<div class="form-group" id="form-group">
					<label for="edita_acao_contingencia"
						class="col-form-label col-form-label-sm">A��o de
						Conting�ncia<span class="obrigatorio">*</span>
					</label>
					<textarea class="form-control form-control-sm"
						name="edita_acao_contingencia" rows="2" required maxlength="3000">${risco.acao_contingencia}</textarea>
				</div>

				<!-- Respons�vel -->
				<div class="form-group" id="form-group">
					<label for="edita_responsavel_acao_contingencia"
						class="col-form-label col-form-label-sm">Respons�vel<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm"
						name="edita_responsavel_acao_contingencia" MAXLENGTH="255"
						required value="${risco.responsavel_acao_contingencia}">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="alterar(${contexto})">
					<span class="glyphicon glyphicon-refresh"></span> Atualizar
				</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					<span class="glyphicon glyphicon-log-out"></span> Fechar
				</button>
			</div>
		</div>
	</div>
</div>