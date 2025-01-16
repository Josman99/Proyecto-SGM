<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Proyecto_SGM.models.IntervaloModel"%>
<%@page import="Proyecto_SGM.beans.Intervalo"%>
<%@page import="Proyecto_SGM.beans.Horario"%>
<%@page import="Proyecto_SGM.beans.Especialidad"%>
<%@page import="java.util.List"%>
<%@page import="Proyecto_SGM.models.EspecialidadModel"%>
<%@page import="Proyecto_SGM.beans.Paciente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SISTEMA DE GESTION DE MEDICA</title>
<script src="https://kit.fontawesome.com/273f05f2f3.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file='/cabeceraMenu.jsp' %>

	<%
		Paciente paciente;
		HttpSession sesion = request.getSession();
		if (request.getAttribute("paciente") == null) {
			paciente = new Paciente();
		} else {
			paciente = (Paciente) request.getAttribute("paciente");
			System.out.println(paciente.getIdPaciente());
			System.out.println(paciente.getDocIdent());
			System.out.println(paciente.getNombres());
			System.out.println(paciente.getApellidos());
			System.out.println(paciente.getFechNaci());
			System.out.println(paciente.getDireccion());
			System.out.println(paciente.getTelefono());
			System.out.println(paciente.getApoder());
		}
	%>

<div class="container">

	<h3 class="text-center mt-3">NUEVA CITA</h3>
	
	<form role="form" method="GET" action="<%=url%>PacienteController">
	
		<!-- Campo oculto para determinar la operación -->
		<input type="hidden" name="op" id="op" value="listarHorario" /> 
		
		<input type="hidden" name="id" id="id" value="<%=paciente.getIdPaciente()%>" />

		<div class="form-group row mb-4">
			<div class="col-md-4 mt-4">
		        <label class="form-label">DNI :</label>
				<input type="text" class="form-control" name="docIden" value="<%=paciente.getDocIdent()%>" disabled="disabled">
		    </div>
		    <div class="col-md-4 mt-4">
		        <label class="form-label">PACIENTE :</label>
				<input type="text" class="form-control" name="nombres" value="<%=paciente.getNombreCompleto()%>" disabled="disabled">
		    </div>
		    <div class="col-md-4 mt-4">
		        <label class="form-label">Edad :</label>
				<input type="text" class="form-control" name="apellidos" value="<%=paciente.getEdad()%>" disabled="disabled">
		    </div>
		    
		    <div class="col-md-6 mt-4 d-flex align-items-center gap-3">
			    <label class="form-label mb-0 mr-2">Especialidad:</label>
			    
			    <select class="form-control" name="especialidadId" id="especialidadId" style="width: 200px;">
			        <%
			        EspecialidadModel modelo = new EspecialidadModel();
			        List<Especialidad> listas = modelo.listarEspecialidad();
			        if (listas != null) {
			            for (Especialidad especial : listas) {
			        %>
			        <option value="<%=especial.getId()%>"><%=especial.getDescripcion()%></option>
			        <%
			            }
			        } else {
			        %>
			        <option>No hay datos</option>
			        <%
			        }
			        %>
			    </select>
			    
		        <input type="submit" class="btn btn-primary ml-2 mr-2" name="buscar" value="Buscar" 
		        onclick="document.getElementById('op').value = 'listarHorario';">        
			</div>
			
			
			<!-- Tabla de horarios -->
			<table class="table mt-3">
				<thead>
					<tr class="text-center">
						<th>Id</th>
						<th>Dr</th>
						<th>Especialidad</th>
						<th>Fecha</th>
						<th>Horario</th>
						<th>Total Cupos</th>
						<th>Cupos Disponibles</th>
						<th>Operación</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Horario> horarios = (List<Horario>) request.getAttribute("horarios");
					if (horarios != null && !horarios.isEmpty()) {
						for (Horario horario : horarios) {
							String fechaFormateada = new SimpleDateFormat("yyyy-MM-dd").format(horario.getFecha());
					%>
					<tr class="text-center">
						<td><%=horario.getId()%></td>
						<td><%=horario.getDoctor()%></td>
						<td><%=horario.getEspecialidad()%></td>
						<td><%=horario.getFecha()%></td>
						<td><%=horario.getHorario()%></td>
						<td><%=horario.getTotcupos()%></td>
						<td><%=horario.getCupos()%></td>
						<td><a class="btn btn-info"
							href="<%=url%>PacienteController?op=listarAtencion&id=<%=paciente.getIdPaciente()%>&fecha=<%=fechaFormateada%>
							&especialidadId=<%=request.getParameter("especialidadId")%>&ide=<%=horario.getId()%>"><i class="fa-solid fa-calendar-check"></i></a></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="8">No hay horarios disponibles para esta
							especialidad.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<br>
			
			<div class="col-md-6 mt-4 d-flex align-items-center gap-3">
				<label class="form-label mb-0 mr-2">Hora:</label>
				<select  class="form-control ml-2 mr-2" name="intervalo">
					
					<%
					List<Intervalo> lista = (List<Intervalo>) request.getAttribute("intervalos");
					if (lista != null && !lista.isEmpty()) {
						for (Intervalo inter : lista) {
					%>
					<option id="intervalo" name="intervalo" value="<%=inter.getId()%>"><%=inter.getHora()%></option>
					<%
					}
					} else {
					%>
					<option>No hay horarios</option>
					<%
					}
					%>
				</select>
				
				<label class="form-label mb-0 ml-2 mr-2">Fecha</label>
				<input class="form-control ml-2" type="date" name="fecha" value="<%=request.getParameter("fecha") != null ? request.getParameter("fecha") : ""%>"><br>
				<br>
			</div>
			
			<!-- Botones de acción -->
			<div class="col-md-12 mt-4 d-flex justify-content-between align-items-center">
			    <a href="<%=url%>PacienteController?op=listar" class="btn btn-secondary">Volver</a>
			    
			    <input type="submit" class="btn btn-success" name="agregar" value="Agregar" 
			        onclick="document.getElementById('op').value = 'insertarcita';" >
			</div>		
			
		</div>
			
	</form>

</div>
	

</body>
</html>