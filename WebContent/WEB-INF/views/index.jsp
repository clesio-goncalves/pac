<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<h1 class="display-3">Bem-vindo, ${usuario.email}</h1>
		</security:authorize>
		<p class="lead">Este é o protótipo do Sistema PAC-CAPAU
			(Planejamento e Gerenciamento de Contratações do Campus Paulistana)</p>
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

<c:import url="componentes/rodape.jsp" />