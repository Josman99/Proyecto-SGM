<%@page import="Proyecto_SGM.beans.Horario"%>
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

Horario


<%
String url = "http://localhost:8080/Proyecto_SGM/";


%>


 <table border=1>

		<thead>

			<tr>


				<td>Id</td>
				<td>Personal</td>
				<td>Fecha</td>
				<td>Hora Incio</td>
				<td>Hora Fin</td>
				<td>Total cupos</td>
				<td>Cupos disponibles</td>
				
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

			<tr>

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







</body>
</html>