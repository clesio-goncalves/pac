<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar Grupos</title>
<c:import url="../componentes/css_data_table.jsp" />
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">

	<div class="card border-light mb-3">
		<div class="card-header">Listagem de Grupos</div>

		<!-- Table -->
		<div class="card-body">
			<table id="tabela_id"
				class="table table-striped table-bordered dt-responsive nowrap"
				style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>Responsável</th>
						<th>Total de Itens</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<!-- percorre grupos montando as linhas da tabela -->
					<c:forEach var="grupo" items="${grupos}">
						<tr>
							<td>${grupo.id}</td>
							<td>${grupo.nome}</td>
							<td>${grupo.usuario.nome}</td>
							<td>${grupo.total_itens}</td>
							<td>
								<!-- Exibir --> <a
								href="<c:url value="/grupo/exibe?id=${grupo.id}" />"
								class="btn btn-info btn-sm" data-tooltip="tooltip"
								data-placement="bottom" title="Exibir"><span
									class="glyphicon glyphicon-search"></span></a> <security:authorize
									access="hasRole('ROLE_Demandante')">
									<security:authentication property="principal"
										var="usuario_logado" />
									<c:if test="${usuario_logado.id == grupo.usuario.id}">
										<!-- Editar -->
										<a href="<c:url value="/grupo/edita?id=${grupo.id}" />"
											class="btn btn-warning btn-sm" data-tooltip="tooltip"
											data-placement="bottom" title="Editar"><span
											class="glyphicon glyphicon-pencil"></span> </a>
										<!-- Excluir -->
										<button type="button" class="btn btn-danger btn-sm"
											data-tooltip="tooltip" data-placement="bottom"
											title="Excluir" data-toggle="modal"
											data-target="#modal${grupo.id}">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
										<div class="modal fade" id="modal${grupo.id}">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Exclusão do grupo</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<p>
															Deseja realmente excluir o grupo<br> ID
															(${grupo.id}) -> ${grupo.nome}?
														</p>
														<strong>A exclusão não é permitida caso haja
															itens vinculados a este grupo</strong> <br>
													</div>

													<div class="modal-footer">
														<a href="<c:url value="/grupo/remove?id=${grupo.id}" />"
															class="btn btn-danger"><span
															class="glyphicon glyphicon-trash"></span> Excluir</a>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">
															<span class="glyphicon glyphicon-log-out"></span> Fechar
														</button>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</security:authorize> <security:authorize
									access="hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')">
									<!-- Editar -->
									<a href="<c:url value="/grupo/edita?id=${grupo.id}" />"
										class="btn btn-warning btn-sm" data-tooltip="tooltip"
										data-placement="bottom" title="Editar"><span
										class="glyphicon glyphicon-pencil"></span> </a>
									<!-- Excluir -->
									<button type="button" class="btn btn-danger btn-sm"
										data-tooltip="tooltip" data-placement="bottom" title="Excluir"
										data-toggle="modal" data-target="#modal${grupo.id}">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
									<div class="modal fade" id="modal${grupo.id}">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclusão do grupo</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														Deseja realmente excluir o grupo<br> ID (${grupo.id})
														-> ${grupo.nome}?
													</p>
													<strong>A exclusão não é permitida caso haja itens
														vinculados a este grupo</strong> <br>
												</div>

												<div class="modal-footer">
													<a href="<c:url value="/grupo/remove?id=${grupo.id}" />"
														class="btn btn-danger"><span
														class="glyphicon glyphicon-trash"></span> Excluir</a>
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">
														<span class="glyphicon glyphicon-log-out"></span> Fechar
													</button>
												</div>
											</div>
										</div>
									</div>
								</security:authorize>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div align="center">
		<a href="<c:url value="/grupo/novo" />" class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
	</div>
</div>

<c:import url="../componentes/js_data_table.jsp" />
<c:import url="../componentes/rodape.jsp" />