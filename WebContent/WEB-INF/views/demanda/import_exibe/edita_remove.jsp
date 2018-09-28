<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Editar -->
<a href="<c:url value="/demanda/edita?id=${item.id}" />"
	class="btn btn-warning btn-lg"><span
	class="glyphicon glyphicon-edit"></span> Editar </a>
<!-- Excluir -->
<button type="button" class="btn btn-danger btn-lg" data-toggle="modal"
	data-target="#excluir${item.id}">
	<span class="glyphicon glyphicon-trash"></span> Excluir
</button>
<!-- Modal -->
<div class="modal fade" id="excluir${item.id}" align="left">
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
				<p>
					Deseja realmente excluir a demanda de <br>ID (${item.id}) ->
					Demandate (${item.usuario.nome})?
				</p>
			</div>
			<div class="modal-footer">
				<a href="<c:url value="/demanda/remove?id=${item.id}" />"
					class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>
					Excluir</a>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					<span class="glyphicon glyphicon-log-out"></span> Fechar
				</button>
			</div>
		</div>
	</div>
</div>