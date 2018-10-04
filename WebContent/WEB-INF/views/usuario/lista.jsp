<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar Usu�rios</title>
<c:import url="../componentes/css_data_table.jsp" />
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">

	<div class="card border-light mb-3">
		<div class="card-header">Listagem de Usu�rios</div>

		<!-- Table -->
		<div class="card-body">
			<table id="tabela_id"
				class="table table-striped table-bordered dt-responsive nowrap"
				style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>E-mail</th>
						<th>Setor</th>
						<th>A��es</th>
					</tr>
				</thead>
				<tbody>
					<!-- percorre usuarios montando as linhas da tabela -->
					<c:forEach var="usuario" items="${usuarios}">
						<tr>
							<td>${usuario.id}</td>
							<td>${usuario.nome}</td>
							<td>${usuario.email}</td>
							<td>${usuario.setor.nome}</td>

							<td>
								<!-- Exibir --> <a
								href="<c:url value="/usuario/exibe?id=${usuario.id}" />"
								class="btn btn-info btn-sm" data-tooltip="tooltip"
								data-placement="bottom" title="Exibir"><span
									class="glyphicon glyphicon-search"></span></a>
							<security:authorize
									access="hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')">
									<!-- Editar -->
									<a href="<c:url value="/usuario/edita?id=${usuario.id}" />"
										class="btn btn-warning btn-sm" data-tooltip="tooltip"
										data-placement="bottom" title="Editar"><span
										class="glyphicon glyphicon-pencil"></span> </a>
									<!-- Excluir -->
									<button type="button" class="btn btn-danger btn-sm"
										data-tooltip="tooltip" data-placement="bottom" title="Excluir"
										data-toggle="modal" data-target="#modal${usuario.id}">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
									<div class="modal fade" id="modal${usuario.id}">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclus�o do usu�rio</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														Deseja realmente excluir o usu�rio <br>ID
														(${usuario.id}) -> ${usuario.email}?
													</p>
												</div>
												<div class="modal-footer">
													<a
														href="<c:url value="/usuario/remove?id=${usuario.id}" />"
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
		<security:authorize
			access="hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')">
			<a href="<c:url value="/usuario/novo" />"
				class="btn btn-primary btn-lg"><span
				class="glyphicon glyphicon-plus"></span> Cadastrar</a>
		</security:authorize>
	</div>
</div>

<c:import url="../componentes/js_data_table.jsp" />
<c:import url="../componentes/rodape.jsp" />