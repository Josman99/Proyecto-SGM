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
	<%
	String url = "http://localhost:8080/Proyecto_SGM/";
	%>
	<h1>LISTA PACIENTES</h1>
	<a href="<%=url%>PacienteController?op=nuevo">Nuevo</a>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Doc Identidad</th>
				<th>Nombres</th>
				<th>Apellidos</th>
				<th>Fech Nacimiento</th>
				<th>Direccion</th>
				<th>Telefono</th>
				<th>Apoderado</th>
				<th>operaciones</th>
			</tr>
		</thead>
		<tbody>
		<%
			List<Paciente> listaPacientes =(List<Paciente>) request.getAttribute("listaPacientes");
			//verificamos si la lista esta vacia
			if(listaPacientes != null){
				//creamos un iterador sobre la lista
				for(Paciente paciente: listaPacientes){
					%>
					<tr>
						<td><%=paciente.getIdPaciente()%></td>
						<td><%=paciente.getDocIdent()%></td>
						<td><%=paciente.getNombres()%></td>
						<td><%=paciente.getApellidos()%></td>
						<td><%=paciente.getFechNaci()%></td>
						<td><%=paciente.getDireccion()%></td>
						<td><%=paciente.getTelefono()%></td>
						<td><%=paciente.getApoder()%></td>
						<td>
						<a type="button"
					href="<%=url%>PacienteController?op=obtener&id=<%=paciente.getIdPaciente()%>">Modificar</a>
					<a type="button" href="<%=url%>PacienteController?op=eliminar&id=<%=paciente.getIdPaciente()%>">Eliminar</a>
					<a type="button"
					href="<%=url%>PacienteController?op=cita&id=<%=paciente.getIdPaciente()%>">Generar Cita</a>
						</td>
					</tr>
					<%
				}
			} else { %>
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
		</tbody>
	</table>

</body>
</html>