<%@page import="Proyecto_SGM.beans.Cita"%>
<%@page import="Proyecto_SGM.beans.Paciente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file='/cabeceraMenu.jsp' %>


	<div class="container">
	
		<h3 class="text-center mt-3 mb-3">LISTA CITAS</h3>
		
		<table class="table">

			<thead>
	
				<tr class="text-center">
	
	
					<th>Id</th>
					<th>Fecha Creacion</th>
					<th>Dni</th>
					<th>Paciente</th>
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
	
				</tr>
	
	
				<%
				}
				%>
	
	
			</tbody>
	
	
	
	
	
	
		</table>
		
	</div>

</body>
</html>