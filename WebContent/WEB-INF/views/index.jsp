<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Inicio</title>
<c:import url="componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<security:authorize access="isAuthenticated()">
			<security:authentication property="principal" var="usuario" />
			<c:set var="nome_completo" value="${fn:split(usuario.nome, ' ')}" />
			<h1 class="display-3">Bem-vindo, ${nome_completo[0]}</h1>
			<c:if test="${qnt_item_pendente > 0}">
				<div class="modal fade" id="modal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Notificação de Pendências</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<c:if test="${qnt_item_pendente == 1}">
									<p>
										Há <b>${qnt_item_pendente}</b> item pendente que necessita ser
										aprovado!
									</p>
								</c:if>
								<c:if test="${qnt_item_pendente > 1}">
									<p>
										Há <b>${qnt_item_pendente}</b> itens pendentes que necessitam
										ser aprovados!
									</p>
								</c:if>
							</div>
							<div class="modal-footer">
								<a href="<c:url value="/demanda/lista" />" class="btn btn-info"><span
									class="glyphicon glyphicon-search"></span> Exibir</a>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">
									<span class="glyphicon glyphicon-log-out"></span> Fechar
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</security:authorize>
		<p class="lead">Este é o protótipo do Sistema PAC-CAPAU
			(Planejamento Anual de Contratações do Campus Paulistana)</p>
		<hr class="my-4">
		<p class="lead">
			Esse sistema segue a <a
				href="https://www.comprasgovernamentais.gov.br/index.php/legislacao/instrucoes-normativas/861-pgc-in">Instrução
				Normativa nº 1, de 29 de março de 2018</a>, que dispõe sobre o Sistema
			de Planejamento e Gerenciamento de Contratações e sobre a elaboração
			do Plano Anual de Contratações de bens, serviços, obras e soluções de
			tecnologia da informação e comunicações no âmbito da Administração
			Pública federal direta, autárquica e fundacional.
		</p>
		<p class="lead">
			<a class="btn btn-primary btn-lg"
				href="https://www.comprasgovernamentais.gov.br/index.php/legislacao/instrucoes-normativas/861-pgc-in"
				role="button">Leia mais</a>
		</p>
	</div>
</div>

<script type="text/javascript">
	$(window).on('load', function() {
		$('#modal').modal('show');
	});
</script>
<c:import url="componentes/rodape.jsp" />