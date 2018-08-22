<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<legend style="margin-top: 0;">INFORMA��ES DA DEMANDA</legend>
<div class="table-responsive">
	<table class="table table-hover table-bordered dt-responsive nowrap">
		<tr>
			<th width="300">ID Respons�vel pela deamdna</th>
			<td>${item.usuario.id}</td>
		</tr>

		<tr>
			<th>Nome/Respons�vel pela demanda</th>
			<td>${item.usuario.nome}</td>
		</tr>

		<tr>
			<th>�rg�o/Entidade</th>
			<td>${item.usuario.orgao}</td>
		</tr>

		<tr>
			<th>Setor Requisitante (Unidade/Setor/Departamento)</th>
			<td>${item.usuario.setor.nome}</td>
		</tr>

		<tr>
			<th>Data da Solicita��o</th>
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