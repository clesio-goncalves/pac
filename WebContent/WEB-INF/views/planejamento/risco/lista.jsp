<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="contexto" />
<legend>GERENCIAMENTO DE RISCOS</legend>

<button type="button" class="btn btn-info btn-lg" onclick="adicionar()"
	data-toggle="modal" data-target="#modal_novo">
	<span class="glyphicon glyphicon-plus-sign"></span> Adicionar risco
</button>
<div class="table-responsive">
	<table class="table table-hover table-bordered dt-responsive nowrap"
		style="width: 100%; margin-top: 20px;">
		<thead>
			<tr>
				<th>ID</th>
				<th>Descri??o</th>
				<th>Probabilidade</th>
				<th>Impacto</th>
				<th>A??es</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="risco" items="${riscos}">
				<tr>
					<td>${risco.id}</td>
					<td>${risco.descricao}</td>
					<td>${risco.probabilidade}</td>
					<td>${risco.impacto}</td>

					<td>
						<!-- Editar -->
						<button type="button" class="btn btn-warning btn-sm"
							onclick="editar(${contexto}, ${risco.id})" data-tooltip="tooltip"
							data-placement="bottom" title="Editar">
							<span class="glyphicon glyphicon-pencil"></span>
						</button>
						<button type="button" class="btn btn-danger btn-sm"
							data-toggle="modal" data-target="#modal${risco.id}"
							data-tooltip="tooltip" data-placement="bottom" title="Excluir">
							<span class="glyphicon glyphicon-trash"></span>
						</button>
						<div class="modal fade" id="modal${risco.id}">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Exclus?o do risco</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>Deseja realmente excluir o risco ID (${risco.id})?</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-danger"
											onclick="excluir(${contexto}, ${empty risco.item ? 0 : risco.item.id}, ${empty risco.grupo ? 0 : risco.grupo.id}, ${risco.id})">
											<span class="glyphicon glyphicon-trash"></span> Excluir
										</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">
											<span class="glyphicon glyphicon-log-out"></span> Fechar
										</button>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>