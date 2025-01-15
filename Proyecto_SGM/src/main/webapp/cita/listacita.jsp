
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

Citas

	<%
String url = "http://localhost:8080/Proyecto_SGM/";
%>

	<table border=1>

		<thead>

			<tr>


				<td>Id</td>
				<td>Fecha Creacion</td>
				<td>Dni</td>
				<td>Paciente</td>
				<td>Horario</td>
				<td>Fecha de Cita</td>

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

			<tr>

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

















	









</body>
</html>