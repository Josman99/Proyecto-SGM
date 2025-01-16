<%@page import="Proyecto_SGM.beans.Horario"%>
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
	
		<h3 class="text-center mt-3 mb-3">LISTA DE HORARIOS</h3>
		
		<table class="table">

			<thead>
	
				<tr class="text-center">
	
	
					<th>Id</th>
					<th>Personal</th>
					<th>Fecha</th>
					<th>Hora Incio</th>
					<th>Hora Fin</th>
					<th>Total cupos</th>
					<th>Cupos disponibles</th>
					
				</tr>
			</thead>
	
	
			<tbody>
	
	
				<%
				List<Horario> listaHorario = (List<Horario>) request.getAttribute("listahorario");
				//verificamos si la lista esta vacia
				if (listaHorario != null) {
					//creamos un iterador sobre la lista
					for (Horario hora : listaHorario) {
				%>
	
				<tr class="text-center">
	
					<td><%=hora.getId()%></td>
					<td><%=hora.getPersonalmedico()%></td>
					<td><%=hora.getFecha()%></td>
					<td><%=hora.getInicio()%></td>
					<td><%=hora.getFin() %></td>
					<td><%=hora.getTotcupos()%></td>
					<td><%=hora.getDisponible()%></td>
	
	
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
		
	
	</div>

</body>
</html>