<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<legend>INFORMA��ES GERENCIAIS</legend>
<div class="table-responsive">
	<table class="table table-striped table-bordered dt-responsive nowrap">
		<tr>
			<th width="300">Grau de prioridade da aquisi��o</th>
			<td>${item.informacoes_gerenciais.grau_prioridade}</td>
		</tr>

		<tr>
			<th>Data estimada para a necessidade do item</th>
			<td><fmt:formatDate
					value="${item.informacoes_gerenciais.data_estimada.time}" /></td>
		</tr>

		<tr>
			<th>Contrata��o emergencial ou remanescente (Lei n� 8.666/93,
				art. 24, incisos IV e XI)</th>
			<c:if
				test="${item.informacoes_gerenciais.contratacao_emergencial eq true}">
				<td>Sim</td>
			</c:if>
			<c:if
				test="${item.informacoes_gerenciais.contratacao_emergencial eq false}">
				<td>N�o</td>
			</c:if>
		</tr>

		<tr>
			<th>Dispensa nos termos da Lei n� 8.666/93, art. 24, incisos I e
				II</th>
			<c:if test="${item.informacoes_gerenciais.dispensa eq true}">
				<td>Sim</td>
			</c:if>
			<c:if test="${item.informacoes_gerenciais.dispensa eq false}">
				<td>N�o</td>
			</c:if>
		</tr>

		<tr>
			<th>Renova��o de contrato</th>
			<c:if
				test="${item.informacoes_gerenciais.renovacao_contrato eq true}">
				<td>Sim</td>
			</c:if>
			<c:if
				test="${item.informacoes_gerenciais.renovacao_contrato eq false}">
				<td>N�o</td>
			</c:if>
		</tr>

		<tr>
			<th>Necessidade de capacita��o de servidores</th>
			<c:if
				test="${item.informacoes_gerenciais.capacitacao_servidores eq true}">
				<td>Sim</td>
			</c:if>
			<c:if
				test="${item.informacoes_gerenciais.capacitacao_servidores eq false}">
				<td>N�o</td>
			</c:if>
		</tr>

		<tr>
			<th>Vincula��o ou depend�ncia com outro item</th>
			<c:if
				test="${item.informacoes_gerenciais.vinculacao_outro_item eq true}">
				<td>Sim</td>
			</c:if>
			<c:if
				test="${item.informacoes_gerenciais.vinculacao_outro_item eq false}">
				<td>N�o</td>
			</c:if>
		</tr>
	</table>
</div>