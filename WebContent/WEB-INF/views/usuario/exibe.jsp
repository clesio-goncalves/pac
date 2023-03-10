<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados do usu?rio</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Exibe os dados do usu?rio</div>
		<!-- Table -->
		<div class="card-body">
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
					<tr>
						<th width="300">ID</th>
						<td>${usuario.id}</td>
					</tr>

					<tr>
						<th>Nome/Respons?vel pela demanda</th>
						<td>${usuario.nome}</td>
					</tr>

					<tr>
						<th>?rg?o/Entidade</th>
						<td>${usuario.orgao}</td>
					</tr>

					<tr>
						<th>Setor Requisitante (Unidade/Setor/Departamento)</th>
						<td>${usuario.setor.nome}</td>
					</tr>

					<tr>
						<th>SIAPE</th>
						<td>${usuario.siape}</td>
					</tr>

					<tr>
						<th>E-mail</th>
						<td>${usuario.email}</td>
					</tr>

					<tr>
						<th>Telefone</th>
						<td>${usuario.telefone}</td>
					</tr>

					<tr>
						<th>Ativo</th>
						<c:if test="${usuario.ativo eq true}">
							<td>Sim</td>
						</c:if>
						<c:if test="${usuario.ativo eq false}">
							<td>N?o</td>
						</c:if>
					</tr>
					<tr>
						<th>Perfil</th>
						<td style="color: blue; font-weight: bold">${usuario.perfil.nome}</td>
					</tr>
					<c:if test="${usuario.perfil.nome == 'Demandante'}">
						<tr>
							<th>Coordenador</th>
							<td><a
								href="<c:url value="/usuario/exibe?id=${usuario.coordenador.id}" />">${usuario.coordenador.nome}</a></td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	<security:authorize
		access="hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')">
		<div align="center">
			<!-- Cadastrar -->
			<a href="<c:url value="/usuario/novo" />"
				class="btn btn-primary btn-lg"><span
				class="glyphicon glyphicon-plus"></span> Cadastrar</a>
			<!-- Editar -->
			<a href="<c:url value="/usuario/edita?id=${usuario.id}" />"
				class="btn btn-warning btn-lg"><span
				class="glyphicon glyphicon-edit"></span> Editar </a>
			<!-- Excluir -->
			<button type="button" class="btn btn-danger btn-lg"
				data-toggle="modal" data-target="#modal${usuario.id}">
				<span class="glyphicon glyphicon-trash"></span> Excluir
			</button>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modal${usuario.id}">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Exclus?o do usu?rio</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							Deseja realmente excluir o usu?rio <br>ID (${usuario.id}) ->
							${usuario.email}?
						</p>
					</div>
					<div class="modal-footer">
						<a href="<c:url value="/usuario/remove?id=${usuario.id}" />"
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
	<a class="btn btn-success" href="<c:url value="/usuario/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>

<c:import url="../componentes/rodape.jsp" />