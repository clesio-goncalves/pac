<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="contexto" />
<div class="modal fade" id="modal_exibe">
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

				<!-- ID ITEM -->
				<input type="hidden" name="exibe_item_id" value="${risco.item.id}" />

				<!-- ID GRUPO-->
				<input type="hidden" name="exibe_grupo_id" value="${risco.grupo.id}" />

				<!-- ID -->
				<input type="hidden" name="exibe_risco_id" value="${risco.id}">

				<!-- Descrição -->
				<div class="form-group" id="form-group">
					<label for="exibe_descricao"
						class="col-form-label col-form-label-sm">Descrição<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm" name="exibe_descricao"
						MAXLENGTH="255" value="${risco.descricao}" readonly="readonly">
				</div>

				<!-- Probabilidade -->
				<div class="row">
					<div class="form-group col" id="form-group">
						<label for="exibe_probabilidade"
							class="col-form-label col-form-label-sm">Probabilidade<span
							class="obrigatorio">*</span>
						</label> <select class="form-control form-control-sm"
							name="exibe_probabilidade" readonly="readonly">
							<option value="Baixa"
								${risco.probabilidade eq "Baixa" ? 'selected' : ''}>Baixa</option>
							<option value="Média"
								${risco.probabilidade eq "Média" ? 'selected' : ''}>Média</option>
							<option value="Alta"
								${risco.probabilidade eq "Alta" ? 'selected' : ''}>Alta</option>
						</select>
					</div>

					<!-- Impacto -->
					<div class="form-group col" id="form-group">
						<label for="exibe_impacto"
							class="col-form-label col-form-label-sm">Impacto<span
							class="obrigatorio">*</span>
						</label> <select class="form-control form-control-sm" name="exibe_impacto"
							readonly="readonly">
							<option value="Baixo"
								${risco.impacto eq "Baixo" ? 'selected' : ''}>Baixo</option>
							<option value="Médio"
								${risco.impacto eq "Médio" ? 'selected' : ''}>Médio</option>
							<option value="Alto" ${risco.impacto eq "Alto" ? 'selected' : ''}>Alto</option>
						</select>
					</div>
				</div>

				<!-- Ação preventiva -->
				<div class="form-group" id="form-group">
					<label for="exibe_acao_preventiva"
						class="col-form-label col-form-label-sm">Ação Preventiva<span
						class="obrigatorio">*</span>
					</label>
					<textarea class="form-control form-control-sm"
						name="exibe_acao_preventiva" rows="2" maxlength="3000"
						readonly="readonly">${risco.acao_preventiva}</textarea>
				</div>

				<!-- Responsável -->
				<div class="form-group" id="form-group">
					<label for="exibe_responsavel_acao_preventiva"
						class="col-form-label col-form-label-sm">Responsável<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm"
						name="exibe_responsavel_acao_preventiva" MAXLENGTH="255"
						value="${risco.responsavel_acao_preventiva}" readonly="readonly">
				</div>

				<!-- Ação de contigência -->
				<div class="form-group" id="form-group">
					<label for="exibe_acao_contingencia"
						class="col-form-label col-form-label-sm">Ação de
						Contingência<span class="obrigatorio">*</span>
					</label>
					<textarea class="form-control form-control-sm"
						name="exibe_acao_contingencia" rows="2" maxlength="3000"
						readonly="readonly">${risco.acao_contingencia}</textarea>
				</div>

				<!-- Responsável -->
				<div class="form-group" id="form-group">
					<label for="exibe_responsavel_acao_contingencia"
						class="col-form-label col-form-label-sm">Responsável<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm"
						name="exibe_responsavel_acao_contingencia" MAXLENGTH="255"
						value="${risco.responsavel_acao_contingencia}" readonly="readonly">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					<span class="glyphicon glyphicon-log-out"></span> Fechar
				</button>
			</div>
		</div>
	</div>
</div>