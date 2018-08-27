<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="total_geral" value="${0}" />
<c:set var="total" value="${0}" />
<table id="tabela_id"
	class="table table-striped table-bordered dt-responsive nowrap"
	style="width: 100%">
	<thead>
		<tr>
			<th>Solicitação</th>
			<th>Grupo</th>
			<th>Tipo Item</th>
			<th>Descrição</th>
			<th>Valor Total</th>
			<th>Setor</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${itens}">
			<tr>
				<td><fmt:formatDate
						value="${item.informacoes_gerenciais.data_solicitacao.time}"
						pattern="dd/MM/yyyy HH:mm:ss" /></td>
				<td>${item.grupo.nome}</td>
				<td>${item.tipo}</td>
				<td>${item.descricao}</td>
				<td><c:set var="total"
						value="${item.quantidade*item.valor_unitario_estimado}" /> <fmt:formatNumber
						type="currency" value="${total}" /> <c:set var="total_geral"
						value="${total_geral + total}" /></td>
				<td>${item.usuario.setor.nome}</td>
				<td>
					<!-- Exibir --> <a
					href="<c:url value="/demanda/exibe?id=${item.id}" />"
					class="btn btn-info btn-sm" data-tooltip="tooltip"
					data-placement="bottom" title="Exibir"><span
						class="glyphicon glyphicon-search"></span> </a> <security:authorize
						access="hasRole('ROLE_Demandante')">
						<security:authentication property="principal" var="usuario_logado" />
						<c:if test="${usuario_logado.id == item.usuario.id}">
							<!-- Editar -->
							<a href="<c:url value="/demanda/edita?id=${item.id}" />"
								class="btn btn-warning btn-sm" data-tooltip="tooltip"
								data-placement="bottom" title="Editar"><span
								class="glyphicon glyphicon-pencil"></span> </a>
							<!-- Excluir -->
							<button type="button" class="btn btn-danger btn-sm"
								data-tooltip="tooltip" data-placement="bottom" title="Excluir"
								data-toggle="modal" data-target="#modal${item.id}">
								<span class="glyphicon glyphicon-trash"></span>
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
						</c:if>
					</security:authorize> <security:authorize
						access="hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')">
						<!-- Editar -->
						<a href="<c:url value="/demanda/edita?id=${item.id}" />"
							class="btn btn-warning btn-sm" data-tooltip="tooltip"
							data-placement="bottom" title="Editar"><span
							class="glyphicon glyphicon-pencil"></span> </a>
						<!-- Excluir -->
						<button type="button" class="btn btn-danger btn-sm"
							data-tooltip="tooltip" data-placement="bottom" title="Excluir"
							data-toggle="modal" data-target="#modal${item.id}">
							<span class="glyphicon glyphicon-trash"></span>
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
	<tr style="background-color: #fff; font-weight: bold;">
		<td colspan="6" align="center">Valor Total Geral: <fmt:formatNumber
				type="currency" value="${total_geral}" />
		</td>
	</tr>
</table>