<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<legend>INFORMA��ES DO ITEM</legend>
<div class="table-responsive">
	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th width="300">Tipo do item</th>
			<td>${item.tipo}</td>
		</tr>

		<tr>
			<th>C�digo do item</th>
			<td>${item.codigo}</td>
		</tr>

		<tr>
			<th>Descri��o</th>
			<td>${item.descricao}</td>
		</tr>

		<tr>
			<th>Descri��o detalhada</th>
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
			<th>Valor unit�rio estimado (R$)</th>
			<td><fmt:formatNumber type="currency"
					value="${item.valor_unitario_estimado}" /></td>
		</tr>

		<tr>
			<th>Valor total estimado (R$)</th>
			<td><fmt:formatNumber type="currency"
					value="${item.quantidade*item.valor_unitario_estimado}" /></td>
		</tr>

		<tr>
			<th>Informa��es Or�ament�rias</th>
			<td>${item.informacoes_orcamentarias}</td>
		</tr>

		<tr>
			<th>Vincular ao grupo</th>
			<td>${item.vincular_grupo}</td>
		</tr>
	</table>
</div>