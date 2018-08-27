<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card border-success mb-3">
	<div class="card-header text-white bg-success" data-toggle="collapse"
		data-target="#accordion">
		<div class="row">
			<div class="col-6">
				<span class="glyphicon glyphicon-filter"></span>Filtros
			</div>
			<div class="col-6" style="text-align: right;">clique para
				expandir</div>
		</div>
	</div>

	<div class="card-body collapse hide" id="accordion">

		<div class="row">
			<div class="col-3">
				<!-- Data inicial solicitação -->
				<div class="form-group">
					<label for="data_inicial_solicitacao" class="col-form-label">Data
						<strong>inicial</strong> da solicitação
					</label> <input type="text" class="form-control maskData"
						name="data_inicial_solicitacao">
				</div>
			</div>
			<div class="col-3">
				<!-- Data final solicitação -->
				<div class="form-group">
					<label for="data_final_solicitacao" class="col-form-label">Data
						<strong>final</strong> da solicitação
					</label> <input type="text" class="form-control maskData"
						name="data_final_solicitacao">
				</div>
			</div>

			<div class="col-3">
				<!-- Data inicial necessidade -->
				<div class="form-group">
					<label for="data_inicial_necessidade" class="col-form-label">Data
						<strong>inicial</strong> da necessidade do item
					</label> <input type="text" class="form-control maskData"
						name="data_inicial_necessidade">
				</div>
			</div>

			<div class="col-3">
				<!-- Data final solicitação -->
				<div class="form-group">
					<label for="data_final_necessidade" class="col-form-label">Data
						<strong>final</strong> da necessidade do item
					</label> <input type="text" class="form-control maskData"
						name="data_final_necessidade">
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-4">
				<!-- Grupo -->
				<div class="form-group">
					<label for="grupo" class="col-form-label">Grupo</label> <select
						name="grupo" class="selectpicker show-tick form-control"
						data-live-search="true" multiple data-max-options="1"
						title="Selecione um grupo"
						data-live-search-placeholder="Pesquisar" id="grupo">
						<c:forEach var="grupo" items="${grupos}">
							<option value="${grupo.id}">${grupo.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="col-8">
				<!-- Descrição -->
				<div class="form-group">
					<label for="descricao" class="col-form-label">Descrição</label> <input
						type="text" class="form-control" name="descricao" MAXLENGTH="255">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-3">
				<!-- Tipo do Item -->
				<div class="form-group">
					<label for="tipo" class="col-form-label">Tipo do item</label> <select
						class="custom-select" name="tipo">
						<option value="">Selecione</option>
						<option value="Material de Consumo">Material de Consumo</option>
						<option value="Material Permanente">Material Permanente</option>
						<option value="Serviço NÃO Continuado">Serviço NÃO
							Continuado</option>
						<option value="Serviço Continuado">Serviço Continuado</option>
						<option value="Serviço de Prazo Indeterminado">Serviço de
							Prazo Indeterminado</option>
						<option value="Obras">Obras</option>
						<option value="Serviços de Engenharia">Serviços de
							Engenharia</option>
					</select>
				</div>
			</div>

			<div class="col-4">
				<!-- Setor Requisitante -->
				<div class="form-group">
					<label for="setor" class="col-form-label">Setor
						Requisitante</label> <select class="custom-select" name="setor">
						<option value="">Selecione</option>
						<c:forEach var="setor" items="${setores}">
							<option value="${setor.id}">${setor.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="col-5">
				<!-- Nome/Responsável pela demanda -->
				<div class="form-group">
					<label for="responsavel" class="col-form-label">Nome/Responsável
						pela demanda</label> <select name="responsavel"
						class="selectpicker show-tick form-control"
						data-live-search="true" multiple data-max-options="1"
						title="Selecione um responsável"
						data-live-search-placeholder="Pesquisar">
						<c:forEach var="responsavel" items="${responsaveis}">
							<option value="${responsavel.id}">${responsavel.siape}-${responsavel.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-4">
				<!-- Valor total abaixo de (R$) -->
				<div class="form-group">
					<label for="valor" class="col-form-label">Valor total
						abaixo de: </label>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">R$ (menor que)</span>
						</div>
						<input type="text" class="form-control maskDinheiro" name="valor">
						<input type="hidden" name="valor_numerico">
					</div>
				</div>
			</div>

			<div class="col-3">
				<!-- Contratação emergencial -->
				<div class="form-group">
					<label for="contratacao_emergencial" class="col-form-label">Contratação
						emergencial </label> <select class="custom-select"
						name="contratacao_emergencial">
						<option value="Sim">Sim</option>
						<option value="Nao" selected="selected">Não</option>
					</select>
				</div>
			</div>

			<div class="col-5">
				<div class="form-group" align="right">
					<br>
					<button type="reset" class="btn btn-secondary btn-lg"
						onclick="limpar()">
						<span class="glyphicon glyphicon-erase"></span> Limpar
					</button>
					<button type="submit" class="btn btn-success btn-lg"
						onclick="filtrar()">
						<span class="glyphicon glyphicon-search"></span> Pesquisar
					</button>
				</div>
			</div>
		</div>


	</div>
</div>
