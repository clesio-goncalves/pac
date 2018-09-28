<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${item.status == 'Pendente'}">
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#aprovar${item.id}">
		<span class="glyphicon glyphicon-ok"></span> Aprovar
	</button>
	<!-- Modal -->
	<div class="modal fade" id="aprovar${item.id}" align="left">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Aprovação da demanda</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						Deseja realmente aprovar a demanda de <br>ID (${item.id}) ->
						Demandate (${item.usuario.nome})?
					</p>
				</div>
				<div class="modal-footer">
					<a href="<c:url value="/demanda/aprova?id=${item.id}" />"
						class="btn btn-info"><span class="glyphicon glyphicon-ok"></span>
						Aprovar</a>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-log-out"></span> Fechar
					</button>
				</div>
			</div>
		</div>
	</div>
</c:if>