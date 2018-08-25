<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar Setores</title>
<c:import url="../componentes/css_data_table.jsp" />
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Listagem de Setores</div>

		<!-- Table -->
		<div class="card-body">
			<table id="tabela_id"
				class="table table-striped table-bordered dt-responsive nowrap"
				style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<!-- percorre setors montando as linhas da tabela -->
					<c:forEach var="setor" items="${setors}">
						<tr>
							<td>${setor.id}</td>
							<td>${setor.nome}</td>
							<td>
								<!-- Exibir --> <a
								href="<c:url value="/setor/exibe?id=${setor.id}" />"
								class="btn btn-secondary btn-sm"><span
									class="glyphicon glyphicon-eye-open"></span> Exibir</a> <!-- Editar -->
								<a href="<c:url value="/setor/edita?id=${setor.id}" />"
								class="btn btn-info btn-sm"><span
									class="glyphicon glyphicon-edit"></span> Editar </a>
								<button type="button" class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#modal${setor.id}">
									<span class="glyphicon glyphicon-trash"></span> Excluir
								</button>
								<div class="modal fade" id="modal${setor.id}">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">Exclusão do setor</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">

												<p>
													Deseja realmente excluir o setor<br> ID (${setor.id})
													-> ${setor.nome}?
												</p>
												<strong>A exclusão não é permitida caso haja
													usuários vinculados a este setor</strong> <br>
											</div>

											<div class="modal-footer">
												<a href="<c:url value="/setor/remove?id=${setor.id}" />"
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
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div align="center">
		<a href="<c:url value="/setor/novo" />" class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
	</div>
</div>

<c:import url="../componentes/js_data_table.jsp" />
<c:import url="../componentes/rodape.jsp" />