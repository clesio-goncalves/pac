<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Editar -->
<a href="<c:url value="/grupo/edita?id=${grupo.id}" />"
	class="btn btn-warning btn-lg"><span
	class="glyphicon glyphicon-edit"></span> Editar </a>
<!-- Excluir -->
<button type="button" class="btn btn-danger btn-lg" data-toggle="modal"
	data-target="#modal${grupo.id}">
	<span class="glyphicon glyphicon-trash"></span> Excluir
</button>

<!-- Modal -->
<div class="modal fade" id="modal${grupo.id}" align="left">
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
					Deseja realmente excluir o grupo<br> ID (${grupo.id}) ->
					${grupo.nome}?
				</p>
				<strong>A exclusão não é permitida caso haja itens
					vinculados a este grupo</strong> <br>
			</div>
			<div class="modal-footer">
				<a href="<c:url value="/grupo/remove?id=${grupo.id}" />"
					class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>
					Excluir</a>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					<span class="glyphicon glyphicon-log-out"></span> Fechar
				</button>
			</div>
		</div>
	</div>
</div>