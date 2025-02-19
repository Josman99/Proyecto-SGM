<%@page import="Proyecto_SGM.beans.PersonalMedico"%>
<%@page import="oracle.jdbc.oracore.OracleTypeROWID"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SISTEMA DE GESTION DE MEDICA</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min.js">
</script>
<script src="https://kit.fontawesome.com/273f05f2f3.js" crossorigin="anonymous"></script>

<script>
	function eliminar(id) {
		if (confirm("¿Desea eliminar el registro?") == true) {
			location.href = "PersonalMedicosController?op=eliminar&id="+id;
		} else {

		}
	}
</script>

</head>
<body>
<%@ include file='/cabeceraMenu.jsp' %>
	
	<div class="container">

		<h3 class="text-center mt-3">LISTA DE PERSONAL MEDICO</h3>
	
		<a class="btn btn-success mt-2" href="<%=url%>PersonalMedicosController?op=nuevo"><i class="fa-solid fa-plus"></i> Nuevo</a>
	 	<br>
	 	<br>
	 	
	 	<form role="form" method="GET" action="<%=url%>PersonalMedicosController?">
	 		
	 		<div class="form-group row mb-4">
			    <div class="col-md-6 d-flex align-items-center gap-3">
			        <input type="hidden" name="op" id="op" value="buscarPersonal" />
			        <input class="form-control mb-0 mr-2" type="text" id="dni" name="dni" placeholder="Ingrese DNI">
			        <input class="btn btn-info" type="submit" name="buscar" value="Buscar" onclick="document.getElementById('op').value = 'buscarPersonal';">
			    </div>
			    <div class="col-md-6 d-flex justify-content-end">
			        <input class="btn btn-info" type="submit" name="buscar" value="Todos" onclick="document.getElementById('op').value = 'listar';">
			    </div>
			</div>
	 		
	 		<table class="table">
				<thead>
					<tr class="text-center">
						<th scope="col">Id</th>
						<th scope="col">Dni</th>
						<th scope="col">Nombres</th>
						<th scope="col">Apellidos</th>
						<th scope="col">Edad</th>
						<th scope="col">Teléfono</th>
						<th scope="col">N° Colegiatura</th>
						<th scope="col">Tipo de Personal</th>
						<th scope="col">Especialidad</th>
						<th scope="col">Acciones</th>
					</tr>
				</thead>
				<tbody>
		
					<%
				       
			           List<PersonalMedico> listaPersonal=(List<PersonalMedico>) request.getAttribute("listarPersonal");
					
				       if(listaPersonal !=null){
				    	   
				        for(PersonalMedico personal:listaPersonal){ 
				        %>
				       			<tr class="text-center">
									<td><%=personal.getId() %></td>
									<td><%=personal.getDni() %></td>
									<td><%=personal.getNombre() %></td>
									<td><%=personal.getApellido() %></td>
									<td><%=personal.getEdadP() %></td>
									<td><%=personal.getTelefono() %></td>
									<td><%=personal.getNumeroCole() %></td>
									<td><%=personal.getPersonal() %></td>
									<td><%=personal.getEspecialidad() %></td>
									<td class="d-flex justify-content-center align-items-center">
										<a type="button" class="btn btn-warning d-flex mr-1"
										href="<%=url%>PersonalMedicosController?op=obtener&id=<%=personal.getId()%>"><i class="fa-solid fa-pen-to-square"></i></a>
										<a type="button" class="btn btn-danger d-flex mr-1" 
										href="javascript:eliminar('<%=personal.getId()%>')"><i class="fa-solid fa-trash"></i></a>
										<a type="button" class="btn btn-info d-flex"
										href="<%=url%>PersonalMedicosController?op=obtenerDoctor&id=<%=personal.getId()%>"><i class="fa-solid fa-clock"></i></a>
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
		
	 	
	 	
	 	</form>
	 	
	</div>
	
	

</body>
</html>