
<%@page import="Proyecto_SGM.beans.Paciente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SISTEMA DE GESTION DE MEDICA</title>
</head>
<body>

Generar Cita

<%
String url = "http://localhost:8080/ProyectoSGM/";
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

	<form role="form" action="<%=url%>PacienteController?op=modificar" method="POST">
		<input  type="hidden" name="id" id="id" value="<%=paciente.getIdPaciente()%>">
		<label>Ingrese Doc Ident</label><br>
		<input type="text" name="docIden"  value="<%=paciente.getDocIdent()%>"><br>
		<label>Ingrese Nombres</label><br>
		<input type="text" name="nombres" value="<%=paciente.getNombres()%>"><br>
		<label>Ingrese Apellidos</label><br>
		<input type="text" name="apellidos" value="<%=paciente.getApellidos()%>"><br>
		<label>Ingrese Fecha Nacimiento</label><br>
		<input type="date" name="fechNaci" value="<%=paciente.getFechNaci()%>"><br>
		<label>Ingrese Direccion</label><br>
		<input type="text" name="direccion" value="<%=paciente.getDireccion()%>"><br>
		<label>Ingrese Telefono</label><br>
		<input type="text" name="telefono" value="<%=paciente.getTelefono()%>"><br>
		<label>Ingrese Apoderado</label><br>
		<input type="text" name="apoderado" value="<%=paciente.getApoder()%>"><br>
		
		<input type="submit" name="guardar" value="guardar"><br>
		<a href="<%=url%>PacienteController?op=listar">volver</a>
	</form>

</body>
</html>