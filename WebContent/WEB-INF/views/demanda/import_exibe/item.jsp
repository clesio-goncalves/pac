<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<legend>INFORMAÇÕES DO ITEM</legend>
<div class="table-responsive">
	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th width="300">Tipo do item</th>
			<td>${item.tipo}</td>
		</tr>

		<tr>
			<th>Código do item</th>
			<td>${item.codigo}</td>
		</tr>

		<tr>
			<th>Descrição</th>
			<td>${item.descricao}</td>
		</tr>

		<tr>
			<th>Descrição detalhada</th>
			<td>${item.descricao_detalhada}</td>
		</tr>

		<tr>
			<th>Unidade de fornecimento</th>
			<td>${item.unidade_fornecimento}</td>
		</tr>

		<tr>
			<th>Quantidade total</th>
			<td>${item.quantidade}</td>
		</tr>

		<tr>
			<th>Valor unitário estimado (R$)</th>
			<td><fmt:formatNumber type="currency"
					value="${item.valor_unitario_estimado}" /></td>
		</tr>

		<tr>
			<th>Valor total estimado (R$)</th>
			<td><fmt:formatNumber type="currency"
					value="${item.quantidade*item.valor_unitario_estimado}" /></td>
		</tr>

		<tr>
			<th>Informações Orçamentárias</th>
			<td>${item.informacoes_orcamentarias}</td>
		</tr>

		<tr>
			<th>Vincular ao grupo</th>
			<c:if test="${empty item.grupo}">
				<td style="color: blue; font-weight: bold">Não informado</td>
			</c:if>
			<c:if test="${not empty item.grupo}">
				<td><a
					href="<c:url value="/grupo/exibe?id=${item.grupo.id}" />">${item.grupo.nome}</a></td>
			</c:if>
		</tr>
		<tr>
			<th>Status</th>
			<c:if test="${item.status == 'Pendente'}">
				<td><span class="badge badge-warning">Pendente</span></td>
			</c:if>

			<c:if test="${item.status == 'Enviado'}">
				<td><span class="badge badge-success">Enviado</span></td>
			</c:if>
		</tr>
		<c:if
			test="${item.status == 'Enviado' and item.usuario.perfil.nome == 'Demandante'}">
			<tr>
				<th>Data da Aprovação</th>
				<td><fmt:formatDate value="${item.data_aprovacao.time}"
						pattern="dd/MM/yyyy HH:mm:ss" /></td>
			</tr>
			<tr>
				<th>Usuário da Aprovação</th>
				<td><a
					href="<c:url value="/usuario/exibe?id=${item.usuario_aprovacao.id}" />">${item.usuario_aprovacao.nome}</a></td>
			</tr>
		</c:if>
	</table>
</div>