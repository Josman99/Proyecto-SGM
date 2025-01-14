
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
	
	<form role="form" method="Get" action="<%=url%>PacienteController">
	    
	    <input type="hidden" name="op" value="listarHorario" />
	    
	    
	    <input type="hidden" name="id" id="id" value="<%=paciente.getIdPaciente()%>"> 
	    <label>Doc Ident</label> <input type="text" name="docIden" value="<%=paciente.getDocIdent()%>"> 
	    <label> Nombre Completo</label> <input type="text" name="nombres" value="<%=paciente.getNombreCompleto()%>"> 
	    <label>Edad</label> <input type="text" name="apellidos" value="<%=paciente.getEdad()%>"><br>
		<br> 
		
	    <label>Hora</label> <input type="text"><br><br>
	         
	         
	    <label>Especialidad</label>
	    <select name="especialidadId">  
	        <option  >Seleccionar</option>
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
	    <input type="submit" name="buscar" value="buscar">  <label>Cita para:</label> <input value=""   >
	    
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
		        </tr>
		    </thead>
		    <tbody>
		        <%
		        // Obtener la lista de horarios pasada desde el controlador
		        List<Horario> horarios = (List<Horario>) request.getAttribute("horarios");
		        
		        if (horarios != null && !horarios.isEmpty()) {
		            // Recorrer la lista y mostrar cada horario en una fila de la tabla
		            for (Horario horario : horarios) {
		        %>
			        <tr>
			            <td><%= horario.getId() %></td>
			            <td><%= horario.getDoctor() %></td>
			            <td><%= horario.getEspecialidad() %></td>
			            <td><%= horario.getFecha() %></td>
			            <td><%=horario.getHorario()%></td>
			            <td><%= horario.getTotcupos() %></td>
			            <td><%= horario.getCupos() %></td>
			        </tr>
		        <%
		            }
		        } else {
		        %>
		        <tr>
		            <td colspan="8">No hay horarios disponibles para esta especialidad.</td>
		        </tr>
		        <%
		        }
		        %>
		    </tbody>
		</table>
	    
	    
	    <a href="<%=url%>PacienteController?op=listar">volver</a>
	    
	    <input type="submit" name="guardar" value="guardar"><br>
	</form>
	
         

</body>
</html>