
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

	Generar Cita

	<%
String url = "http://localhost:8080/Proyecto_SGM/";
%>


	<%
	List<Paciente> listaPacientes = (List<Paciente>) request.getAttribute("listacita");
	//verificamos si la lista esta vacia
	if (listaPacientes != null) {
		//creamos un iterador sobre la lista
		for (Paciente paciente : listaPacientes) {
	%>
	
	<label>id Paciente</label> <input  value="<%=paciente.getIdPaciente()%>"   >
	
	
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
		<td></td>
	</tr>

	<%
	}
	%>












</body>
</html>