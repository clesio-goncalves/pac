<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/glyphicons.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/sistema.css" />">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/popper.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<a class="navbar-brand" href="<c:url value="/" />">PAC CAPAU</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Cadastro</a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 40px, 0px);">
						<security:authorize
							access="hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')">
							<a class="dropdown-item" href="<c:url value="/usuario/novo" />">Usuário</a>
							<a class="dropdown-item" href="<c:url value="/setor/novo" />">Setor</a>
						</security:authorize>
						<a class="dropdown-item" href="<c:url value="/grupo/novo" />">Grupo</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="<c:url value="/demanda/nova" />">Formalização
							Demanda</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Relatórios</a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 40px, 0px);">
						<a class="dropdown-item" href="<c:url value="/usuario/lista" />">Usuários</a>
						<a class="dropdown-item" href="<c:url value="/setor/lista" />">Setores</a>
						<a class="dropdown-item" href="<c:url value="/grupo/lista" />">Grupos</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="<c:url value="/demanda/lista" />">Demandas</a>
					</div></li>
			</ul>
			<security:authorize access="isAuthenticated()">
				<ul class="navbar-nav navbar-right">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false"><security:authentication
								property="principal" var="user" /> ${user.email}</a>
						<div class="dropdown-menu" x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 40px, 0px);">
							<a class="dropdown-item"
								href="<c:url value="/usuario/exibe?id=${user.id}" />"><span
								class="glyphicon glyphicon-info-sign"></span> Perfil</a> <a
								class="dropdown-item" href="<c:url value="/logout" />"><span
								class="glyphicon glyphicon-log-out"></span> Sair</a>
						</div></li>
				</ul>
			</security:authorize>
		</div>
	</nav>