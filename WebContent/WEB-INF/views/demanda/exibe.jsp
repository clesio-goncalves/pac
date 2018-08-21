<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados da demanda</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Exibe os dados da demanda</div>
		<!-- Table -->
		<div class="card-body">
			<h3 align="left">Informa��es da Demanda</h3>
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
			<hr />
			<h3 align="left">Informa��es do Item</h3>
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
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
						<td>${item.valor_unitario_estimado}</td>
					</tr>

					<tr>
						<th>Valor total estimado (R$)</th>
						<td>${item.quantidade*item.valor_unitario_estimado}</td>
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
			<hr />
			<h3 align="left">Informa��es Gerenciais</h3>
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
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
						<th>Dispensa nos termos da Lei n� 8.666/93, art. 24, incisos
							I e II</th>
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
			<hr />
			<h3 align="left">Estudos Preliminares</h3>
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
					<tr>
						<th width="300">1. Necessidade da contrata��o*</th>
						<td>${estudo_preliminar.necessidade_contratacao}</td>
					</tr>

					<tr>
						<th>2. Refer�ncia a outros instrumentos de planejamento do
							�rg�o ou entidade, se houver</th>
						<td>${estudo_preliminar.ref_outros_instrumentos}</td>
					</tr>

					<tr>
						<th>3. Requisitos da contrata��o</th>
						<td>${estudo_preliminar.requisitos_contratacao}</td>
					</tr>

					<tr>
						<th>4. Estimativa das quantidades, acompanhadas das mem�rias
							de c�lculo e dos documentos que lhe d�o suporte*</th>
						<td>${estudo_preliminar.estimativa_quantidades}</td>
					</tr>

					<tr>
						<th>5. Levantamento de mercado e justificativa da escolha do
							tipo de solu��o a contratar</th>
						<td>${estudo_preliminar.levantamento_mercado}</td>
					</tr>

					<tr>
						<th>6. Defini��o do m�todo para estimativas de pre�os ou dos
							meios de previs�o de pre�os referenciais*</th>
						<td>${estudo_preliminar.metodo_estimativa_preco}</td>
					</tr>

					<tr>
						<th>7. Descri��o da solu��o como um todo</th>
						<td>${estudo_preliminar.descricao_solucao}</td>
					</tr>

					<tr>
						<th>8. Justificativas para o parcelamento ou n�o da solu��o,
							quando necess�ria para a individualiza��o do objeto*</th>
						<td>${estudo_preliminar.justificativa_parcelamento}</td>
					</tr>

					<tr>
						<th>9. Demonstrativo dos resultados pretendidos em termos de
							economicidade e de melhor aproveitamento dos recursos humanos,
							materiais ou financeiros dispon�veis</th>
						<td>${estudo_preliminar.resultados_pretendidos}</td>
					</tr>

					<tr>
						<th>10. Provid�ncias para adequa��o do ambiente do �rg�o</th>
						<td>${estudo_preliminar.providencias_adequacao}</td>
					</tr>

					<tr>
						<th>11. Contrata��es correlatas e/ou interdependentes</th>
						<td>${estudo_preliminar.contratacoes_correlatas}</td>
					</tr>

					<tr>
						<th>12. Declara��o da viabilidade ou n�o da contrata��o*</th>
						<td>${estudo_preliminar.declaracao_viabilidade}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<security:authorize access="hasRole('ROLE_Administrador')">
		<div align="center">
			<!-- Cadastrar -->
			<a href="<c:url value="/demanda/nova" />"
				class="btn btn-primary btn-lg"><span
				class="glyphicon glyphicon-plus"></span> Cadastrar</a>
			<!-- Editar -->
			<a href="<c:url value="/demanda/edita?id=${item.id}" />"
				class="btn btn-info btn-lg"><span
				class="glyphicon glyphicon-edit"></span> Editar </a>
			<!-- Excluir -->
			<button type="button" class="btn btn-danger btn-lg"
				data-toggle="modal" data-target="#modal${item.id}">
				<span class="glyphicon glyphicon-trash"></span> Excluir
			</button>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modal${item.id}">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Exclus�o da demanda</h5>
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
	<a class="btn btn-success" href="<c:url value="/demanda/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>

<c:import url="../componentes/rodape.jsp" />