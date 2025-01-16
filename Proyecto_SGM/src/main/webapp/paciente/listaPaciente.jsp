<%@page import="Proyecto_SGM.beans.Paciente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min.js">
</script>


<script>
	function eliminar(id) {
		if (confirm("¿Desea eliminar el registro?") == true) {
			location.href = "PacienteController?op=eliminar&id="+id;
		} else {

		}
	}
</script>

</head>
<body>
<%@ include file='/cabeceraMenu.jsp' %>
	
	<div class="container">
	
		<h3 class="text-center mt-3">LISTA PACIENTES</h3>
		
		<a class="btn btn-success mt-2" href="<%=url%>PacienteController?op=nuevo"><i class="fa-solid fa-plus"></i> Nuevo</a><br>
		<br>
		<table class="table">
			<thead>
				<tr class="text-center">
					<th scope="col">Id</th>
					<th scope="col">DNI</th>
					<th scope="col">Nombres</th>
					<th scope="col">Apellidos</th>
					<th scope="col">Fecha N.</th>
					<th scope="col">Direccion</th>
					<th scope="col">Telefono</th>
					<th scope="col">Apoderado</th>
					<th scope="col">Acciones</th>
					
				</tr>
			</thead>
			<tbody >
			<%
				List<Paciente> listaPacientes =(List<Paciente>) request.getAttribute("listaPacientes");
				//verificamos si la lista esta vacia
				if(listaPacientes != null){
					//creamos un iterador sobre la lista
					for(Paciente paciente: listaPacientes){
						%>
						<tr class="text-center">
							<td><%=paciente.getIdPaciente()%></td>
							<td><%=paciente.getDocIdent()%></td>
							<td><%=paciente.getNombres()%></td>
							<td><%=paciente.getApellidos()%></td>
							<td><%=paciente.getFechNaci()%></td>
							<td><%=paciente.getDireccion()%></td>
							<td><%=paciente.getTelefono()%></td>
							<td><%=paciente.getApoder()%></td>
							<td class="d-flex justify-content-center align-items-center" >
							<a type="button" class="btn btn-warning d-flex mr-1"
						href="<%=url%>PacienteController?op=obtener&id=<%=paciente.getIdPaciente()%>"><i class="fa-solid fa-pen-to-square"></i></a>
						<a type="button" class="btn btn-danger d-flex mr-1" 
						href="javascript:eliminar('<%=paciente.getIdPaciente()%>')"><i class="fa-solid fa-trash"></i></a>
						<a type="button" class="btn btn-primary d-flex "
						href="<%=url%>PacienteController?op=cita&id=<%=paciente.getIdPaciente()%>"><i class="fa-solid fa-file-medical"></i></a>
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
	
	</div>
	

</body>
</html>