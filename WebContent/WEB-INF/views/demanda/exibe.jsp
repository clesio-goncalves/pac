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
			<h3 align="left">Informações da Demanda</h3>
			<div class="table-responsive">
				<table class="table table-hover table-bordered dt-responsive nowrap">
					<tr>
						<th width="300">ID Responsável pela deamdna</th>
						<td>${item.usuario.id}</td>
					</tr>

					<tr>
						<th>Nome/Responsável pela demanda</th>
						<td>${item.usuario.nome}</td>
					</tr>

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
			<hr />
			<h3 align="left">Informações do Item</h3>
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
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
						<td>${item.valor_unitario_estimado}</td>
					</tr>

					<tr>
						<th>Valor total estimado (R$)</th>
						<td>${item.quantidade*item.valor_unitario_estimado}</td>
					</tr>

					<tr>
						<th>Informações Orçamentárias</th>
						<td>${item.informacoes_orcamentarias}</td>
					</tr>

					<tr>
						<th>Vincular ao grupo</th>
						<td>${item.vincular_grupo}</td>
					</tr>
				</table>
			</div>
			<hr />
			<h3 align="left">Informações Gerenciais</h3>
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
					<tr>
						<th width="300">Grau de prioridade da aquisição</th>
						<td>${item.informacoes_gerenciais.grau_prioridade}</td>
					</tr>

					<tr>
						<th>Data estimada para a necessidade do item</th>
						<td><fmt:formatDate
								value="${item.informacoes_gerenciais.data_estimada.time}" /></td>
					</tr>

					<tr>
						<th>Contratação emergencial ou remanescente (Lei n° 8.666/93,
							art. 24, incisos IV e XI)</th>
						<c:if
							test="${item.informacoes_gerenciais.contratacao_emergencial eq true}">
							<td>Sim</td>
						</c:if>
						<c:if
							test="${item.informacoes_gerenciais.contratacao_emergencial eq false}">
							<td>Não</td>
						</c:if>
					</tr>

					<tr>
						<th>Dispensa nos termos da Lei n° 8.666/93, art. 24, incisos
							I e II</th>
						<c:if test="${item.informacoes_gerenciais.dispensa eq true}">
							<td>Sim</td>
						</c:if>
						<c:if test="${item.informacoes_gerenciais.dispensa eq false}">
							<td>Não</td>
						</c:if>
					</tr>

					<tr>
						<th>Renovação de contrato</th>
						<c:if
							test="${item.informacoes_gerenciais.renovacao_contrato eq true}">
							<td>Sim</td>
						</c:if>
						<c:if
							test="${item.informacoes_gerenciais.renovacao_contrato eq false}">
							<td>Não</td>
						</c:if>
					</tr>

					<tr>
						<th>Necessidade de capacitação de servidores</th>
						<c:if
							test="${item.informacoes_gerenciais.capacitacao_servidores eq true}">
							<td>Sim</td>
						</c:if>
						<c:if
							test="${item.informacoes_gerenciais.capacitacao_servidores eq false}">
							<td>Não</td>
						</c:if>
					</tr>

					<tr>
						<th>Vinculação ou dependência com outro item</th>
						<c:if
							test="${item.informacoes_gerenciais.vinculacao_outro_item eq true}">
							<td>Sim</td>
						</c:if>
						<c:if
							test="${item.informacoes_gerenciais.vinculacao_outro_item eq false}">
							<td>Não</td>
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
						<th width="300">1. Necessidade da contratação*</th>
						<td>${estudo_preliminar.necessidade_contratacao}</td>
					</tr>

					<tr>
						<th>2. Referência a outros instrumentos de planejamento do
							órgão ou entidade, se houver</th>
						<td>${estudo_preliminar.ref_outros_instrumentos}</td>
					</tr>

					<tr>
						<th>3. Requisitos da contratação</th>
						<td>${estudo_preliminar.requisitos_contratacao}</td>
					</tr>

					<tr>
						<th>4. Estimativa das quantidades, acompanhadas das memórias
							de cálculo e dos documentos que lhe dão suporte*</th>
						<td>${estudo_preliminar.estimativa_quantidades}</td>
					</tr>

					<tr>
						<th>5. Levantamento de mercado e justificativa da escolha do
							tipo de solução a contratar</th>
						<td>${estudo_preliminar.levantamento_mercado}</td>
					</tr>

					<tr>
						<th>6. Definição do método para estimativas de preços ou dos
							meios de previsão de preços referenciais*</th>
						<td>${estudo_preliminar.metodo_estimativa_preco}</td>
					</tr>

					<tr>
						<th>7. Descrição da solução como um todo</th>
						<td>${estudo_preliminar.descricao_solucao}</td>
					</tr>

					<tr>
						<th>8. Justificativas para o parcelamento ou não da solução,
							quando necessária para a individualização do objeto*</th>
						<td>${estudo_preliminar.justificativa_parcelamento}</td>
					</tr>

					<tr>
						<th>9. Demonstrativo dos resultados pretendidos em termos de
							economicidade e de melhor aproveitamento dos recursos humanos,
							materiais ou financeiros disponíveis</th>
						<td>${estudo_preliminar.resultados_pretendidos}</td>
					</tr>

					<tr>
						<th>10. Providências para adequação do ambiente do órgão</th>
						<td>${estudo_preliminar.providencias_adequacao}</td>
					</tr>

					<tr>
						<th>11. Contratações correlatas e/ou interdependentes</th>
						<td>${estudo_preliminar.contratacoes_correlatas}</td>
					</tr>

					<tr>
						<th>12. Declaração da viabilidade ou não da contratação*</th>
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