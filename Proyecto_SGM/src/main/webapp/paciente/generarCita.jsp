
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
<title>Insert title here</title>
</head>
<body>

	<h1>NUEVA CITA</h1>
	<%
	String url = "http://localhost:8080/Proyecto_SGM/";
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
	
	
	
	

	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

	<form role="form" method="GET" action="<%=url%>PacienteController">
		<!-- Campo oculto para determinar la operación -->
		<input type="hidden" name="op" id="op" value="listarHorario" /> <input
			type="hidden" name="id" id="id" value="<%=paciente.getIdPaciente()%>" />

		<label>Doc Ident</label> <input type="text" name="docIden"
			value="<%=paciente.getDocIdent()%>" /> <label>Nombre
			Completo</label> <input type="text" name="nombres"
			value="<%=paciente.getNombreCompleto()%>" /> <label>Edad</label> <input
			type="text" name="apellidos" value="<%=paciente.getEdad()%>"><br>
		<br> <label>Especialidad</label> <select name="especialidadId">
			<option>Seleccionar</option>
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
		</select><br> <br> <br> <label>Hora:</label> 
		
		<select 
			name="intervalo">
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
		
		
		
		<br> <br> <label>Fecha</label><input type="date"
			name="fecha"
			value="<%=request.getParameter("fecha") != null ? request.getParameter("fecha") : ""%>"><br>
		<br>

		<!-- Tabla de horarios -->
		<table border="1">
			<thead>
				<tr>
					<td>Id</td>
					<td>Dr</td>
					<td>Especialidad</td>
					<td>Fecha</td>
					<td>Horario</td>
					<td>Total Cupos</td>
					<td>Cupos Disponibles</td>
					<td>Operación</td>
				</tr>
			</thead>
			<tbody>
				<%
				List<Horario> horarios = (List<Horario>) request.getAttribute("horarios");
				if (horarios != null && !horarios.isEmpty()) {
					for (Horario horario : horarios) {
						String fechaFormateada = new SimpleDateFormat("yyyy-MM-dd").format(horario.getFecha());
				%>
				<tr>
					<td><%=horario.getId()%></td>
					<td><%=horario.getDoctor()%></td>
					<td><%=horario.getEspecialidad()%></td>
					<td><%=horario.getFecha()%></td>
					<td><%=horario.getHorario()%></td>
					<td><%=horario.getTotcupos()%></td>
					<td><%=horario.getCupos()%></td>
					<td><a
						href="<%=url%>PacienteController?op=listarAtencion&id=<%=paciente.getIdPaciente()%>&fecha=<%=fechaFormateada%>&especialidadId=<%=request.getParameter("especialidadId")%>&ide=<%=horario.getId()%>">
							Seleccionar </a></td>
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

		<!-- Botones de acción -->
		<input type="submit" name="buscar" value="Buscar"
			onclick="document.getElementById('op').value = 'listarHorario';">
		<input type="submit" name="agregar" value="Agregar"
			onclick="document.getElementById('op').value = 'insertarcita';">
			
			
			
			
	</form>
	
	
	
	

	<a href="<%=url%>PacienteController?op=listar">volver</a>

</body>
</html>