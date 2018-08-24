<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="contexto" />
<legend>GERENCIAMENTO DE RISCOS</legend>
<table class="table table-hover table-bordered dt-responsive nowrap"
	style="width: 100%; margin-top: 20px;">
	<thead>
		<tr>
			<th>ID</th>
			<th>Descrição</th>
			<th>Probabilidade</th>
			<th>Impacto</th>
			<th>Ações</th>
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
					<!-- Exibir -->
					<button type="button" class="btn btn-secondary btn-sm"
						onclick="exibir(${contexto}, ${risco.id})">
						<span class="glyphicon glyphicon-eye-open"></span> Exibir
					</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>