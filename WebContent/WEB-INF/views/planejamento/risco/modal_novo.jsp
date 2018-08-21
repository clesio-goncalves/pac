<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<div class="modal fade" id="modal_novo">
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

				<!-- Descri��o -->
				<div class="form-group" id="form-group">
					<label for="descricao" class="col-form-label col-form-label-sm">Descri��o<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm" name="descricao"
						MAXLENGTH="255" required>
				</div>

				<!-- Probabilidade -->
				<div class="row">
					<div class="form-group col" id="form-group">
						<label for="probabilidade"
							class="col-form-label col-form-label-sm">Probabilidade<span
							class="obrigatorio">*</span>
						</label> <select class="form-control form-control-sm" name="probabilidade"
							required>
							<option value="Baixa">Baixa</option>
							<option value="M�dia">M�dia</option>
							<option value="Alta">Alta</option>
						</select>
					</div>

					<!-- Impacto -->
					<div class="form-group col" id="form-group">
						<label for="impacto" class="col-form-label col-form-label-sm">Impacto<span
							class="obrigatorio">*</span>
						</label> <select class="form-control form-control-sm" name="impacto"
							required>
							<option value="Baixo">Baixo</option>
							<option value="M�dio">M�dio</option>
							<option value="Alto">Alto</option>
						</select>
					</div>
				</div>

				<!-- A��o preventiva -->
				<div class="form-group" id="form-group">
					<label for="acao_preventiva"
						class="col-form-label col-form-label-sm">A��o Preventiva<span
						class="obrigatorio">*</span>
					</label>
					<textarea class="form-control form-control-sm"
						name="acao_preventiva" rows="2" required maxlength="3000"></textarea>
				</div>

				<!-- Respons�vel -->
				<div class="form-group" id="form-group">
					<label for="responsavel_acao_preventiva"
						class="col-form-label col-form-label-sm">Respons�vel<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm"
						name="responsavel_acao_preventiva" MAXLENGTH="255" required>
				</div>

				<!-- A��o de contig�ncia -->
				<div class="form-group" id="form-group">
					<label for="acao_contingencia"
						class="col-form-label col-form-label-sm">A��o de
						Conting�ncia<span class="obrigatorio">*</span>
					</label>
					<textarea class="form-control form-control-sm"
						name="acao_contingencia" rows="2" required maxlength="3000"></textarea>
				</div>

				<!-- Respons�vel -->
				<div class="form-group" id="form-group">
					<label for="responsavel_acao_contingencia"
						class="col-form-label col-form-label-sm">Respons�vel<span
						class="obrigatorio">*</span></label> <input type="text"
						class="form-control form-control-sm"
						name="responsavel_acao_contingencia" MAXLENGTH="255" required>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="button_salvar"
					data-dismiss="modal">
					<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
				</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					<span class="glyphicon glyphicon-log-out"></span> Fechar
				</button>
			</div>
		</div>
	</div>
</div>