<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<legend style="margin-top: 0;">INFORMAÇÕES DA DEMANDA</legend>
<div class="table-responsive">
	<table class="table table-hover table-bordered dt-responsive nowrap">
		<tr>
			<th width="300">Nome/Responsável pela demanda</th>
			<td style="color: blue; font-weight: bold"><a
				href="<c:url value="/usuario/exibe?id=${item.usuario.id}" />">${item.usuario.nome}</a></td>
		</tr>
		<tr>
			<th>Perfil responsável pela demanda</th>
			<td style="color: blue; font-weight: bold">${item.usuario.perfil.nome}</td>
		</tr>
		<c:if test="${item.usuario.perfil.nome == 'Demandante'}">
			<tr>
				<th>Coordenador Demandante</th>
				<td><a
					href="<c:url value="/usuario/exibe?id=${item.usuario.coordenador.id}" />">${item.usuario.coordenador.nome}</a></td>
			</tr>
		</c:if>
		<tr>
			<th>Órgão/Entidade</th>
			<td>${item.usuario.orgao}</td>
		</tr>
		<tr>
			<th>Setor Requisitante (Unidade/Setor/Departamento)</th>
			<td>${item.usuario.setor.nome}</td>
		</tr>
		<tr>
			<th>Data da Solicitação</th>
			<td><fmt:formatDate
					value="${item.informacoes_gerenciais.data_solicitacao.time}"
					pattern="dd/MM/yyyy HH:mm:ss" /></td>
		</tr>
		<tr>
			<th>SIAPE</th>
			<td>${item.usuario.siape}</td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td>${item.usuario.email}</td>
		</tr>
		<tr>
			<th>Telefone</th>
			<td>${item.usuario.telefone}</td>
		</tr>
	</table>
</div>