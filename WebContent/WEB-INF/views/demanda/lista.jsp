<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar Demandas</title>
<c:import url="../componentes/css_data_table.jsp" />
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">

	<div class="card border-light mb-3">
		<div class="card-header">Listagem de Demandas</div>

		<!-- Table -->
		<div class="card-body">
			<table id="tabela_id"
				class="table table-striped table-bordered dt-responsive nowrap"
				style="width: 100%">
				<thead>
					<tr>
						<th>Demandante</th>
						<th>Tipo Item</th>
						<th>Valor Total</th>
						<th>Data da Solicitação</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${itens}">
						<tr>
							<td>${item.usuario.nome}</td>
							<td>${item.tipo}</td>
							<td><fmt:formatNumber type="currency"
									value="${item.quantidade*item.valor_unitario_estimado}" /></td>
							<td><fmt:formatDate
									value="${item.informacoes_gerenciais.data_solicitacao.time}"
									pattern="dd/MM/yyyy HH:mm:ss" /></td>

							<td>
								<!-- Exibir --> <a
								href="<c:url value="/demanda/exibe?id=${item.id}" />"
								class="btn btn-secondary btn-sm"><span
									class="glyphicon glyphicon-eye-open"></span> Exibir</a> <security:authorize
									access="hasRole('ROLE_Administrador')">
									<!-- Editar -->
									<a href="<c:url value="/demanda/edita?id=${item.id}" />"
										class="btn btn-info btn-sm"><span
										class="glyphicon glyphicon-edit"></span> Editar </a>
									<!-- Button to Open the Modal -->
									<button type="button" class="btn btn-danger btn-sm"
										data-toggle="modal" data-target="#modal${item.id}">
										<span class="glyphicon glyphicon-trash"></span> Excluir
									</button>
									<div class="modal fade" id="modal${item.id}">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclusão da demanda</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<p>Deseja realmente excluir este item?</p>
												</div>
												<div class="modal-footer">
													<a href="<c:url value="/demanda/remove?id=${item.id}" />"
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
		<security:authorize access="hasRole('ROLE_Administrador')">
			<a href="<c:url value="/demanda/nova" />"
				class="btn btn-primary btn-lg"><span
				class="glyphicon glyphicon-plus"></span> Cadastrar</a>
		</security:authorize>
	</div>
</div>
<c:import url="../componentes/js_data_table.jsp" />
<c:import url="../componentes/rodape.jsp" />