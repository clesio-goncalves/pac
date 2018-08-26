<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar Demandas</title>
<c:import url="../componentes/css_data_table.jsp" />
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Listagem de Demandas</div>

		<!-- Table -->
		<div class="card-body">
			<jsp:include page="import_lista/tabela.jsp"></jsp:include>
		</div>
	</div>
	<div align="center">
		<a href="<c:url value="/demanda/nova" />"
			class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
	</div>
</div>
<c:import url="../componentes/js_data_table.jsp" />
<c:import url="../componentes/rodape.jsp" />