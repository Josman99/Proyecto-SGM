<%@page import="Proyecto_SGM.beans.Cita"%>
<%@page import="Proyecto_SGM.beans.Paciente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SISTEMA DE GESTION DE MEDICA</title>
</head>
<body>
<%@ include file='/cabeceraMenu.jsp' %>


	<div class="container">
	
		<h3 class="text-center mt-3 mb-3">LISTA CITAS</h3>
		
		<form role="form" method="GET" action="<%=url%>CitaController?">
		
			<div class="form-group row mb-4">
			    <div class="col-md-6 d-flex align-items-center gap-3">
			        <input type="hidden" name="op" id="op" value="buscarcita" />
			        <input class="form-control mb-0 mr-2" type="text" id="dni" name="dni" placeholder="Ingrese DNI">
			        <input class="btn btn-info" type="submit" name="buscar" value="Buscar" onclick="document.getElementById('op').value = 'buscarcita';">
			    </div>
			    <div class="col-md-6 d-flex justify-content-end">
			        <input class="btn btn-info" type="submit" name="buscar" value="Todos" onclick="document.getElementById('op').value = 'listar';">
			    </div>
			</div>
					
			<table class="table">

				<thead>
		
					<tr class="text-center">
		
		
						<th>Id</th>
						<th>Fecha Creacion</th>
						<th>Dni</th>
						<th>Paciente</th>
						<th>Doctor</th>
						<th>Especialidad</th>
						<th>Horario</th>
						<th>Fecha de Cita</th>
		
					</tr>
				</thead>
		
		
				<tbody>
		
		
					<%
					List<Cita> listaCita = (List<Cita>) request.getAttribute("listacita");
					//verificamos si la lista esta vacia
					if (listaCita != null) {
						//creamos un iterador sobre la lista
						for (Cita cita : listaCita) {
					%>
		
					<tr class="text-center">
		
						<td><%=cita.getId()%></td>
						<td><%=cita.getFechacreacion()%></td>
						<td><%=cita.getDocumento()%></td>
						<td><%=cita.getPaciente()%></td>
						<td><%=cita.getNombreDoc() %></td>
						<td><%=cita.getEspecialidad() %></td>
						<td><%=cita.getHora()%></td>
						<td><%=cita.getFechacita()%></td>
		
		
					</tr>
		
					<%
					}
					} else {
					%>
					<tr>
		
						<td>No hay datos</td>
						<td>No hay datos</td>
						<td>No hay datos</td>
						<td>No hay datos</td>
						<td>No hay datos</td>
						<td>No hay datos</td>
						<td>No hay datos</td>
						<td>No hay datos</td>
		
					</tr>
		
					<%
					}
					%>
		
				</tbody>

			</table>	
		
		</form>
		
		
	</div>

</body>
</html>