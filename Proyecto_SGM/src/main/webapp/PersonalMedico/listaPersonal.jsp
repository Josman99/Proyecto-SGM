<%@page import="Proyecto_SGM.beans.PersonalMedico"%>
<%@page import="oracle.jdbc.oracore.OracleTypeROWID"%>

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
	
	<h1>LISTA DE PERSONAL MEDICO</h1>
	
	<a href="<%=url%>PersonalMedicosController?op=nuevo">Nuevo Personal</a>
 	<br>
	<table border=1>
		<thead>
			<tr>
				<td>Id</td>
				<td>Dni</td>
				<td>Nombres</td>
				<td>Apellidos</td>
				<td>Fecha Nacimiento</td>
				<td>Direccion</td>
				<td>Telefono</td>
				<td>Numero de Colegiatura</td>
				<td>Tipo de Personal</td>
				<td>Especialidad</td>
				<td>Acciones</td>
			</tr>
		</thead>
		<tbody>

			<%
		       
	           List<PersonalMedico> listaPersonal=(List<PersonalMedico>) request.getAttribute("listarPersonal");
			
		       if(listaPersonal !=null){
		    	   
		        for(PersonalMedico personal:listaPersonal){ 
		        %>
		       			<tr>
							<td><%=personal.getId() %></td>
							<td><%=personal.getDni() %></td>
							<td><%=personal.getNombre() %></td>
							<td><%=personal.getApellido() %></td>
							<td><%=personal.getFechaN() %></td>
							<td><%=personal.getDireccion() %></td>
							<td><%=personal.getTelefono() %></td>
							<td><%=personal.getNumeroCole() %></td>
							<td><%=personal.getPersonal() %></td>
							<td><%=personal.getEspecialidad() %></td>
							<td>
								<a type="button" href="<%=url%>PersonalMedicosController?op=obtener&id=<%=personal.getId()%>">Modificar</a>
								<a type="button" href="<%=url%>PersonalMedicosController?op=eliminar&id=<%=personal.getId()%>">Eliminar</a>
								<a type="button" href="<%=url%>PersonalMedicosController?op=obtenerDoctor&id=<%=personal.getId()%>">Horario</a>
							</td>
			
						</tr>
		       			
		       		<%}

		       }else{
			
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