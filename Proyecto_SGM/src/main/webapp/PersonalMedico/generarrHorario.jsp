<%@page import="Proyecto_SGM.beans.PersonalMedico"%>
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

	PersonalMedico personalm;
	HttpSession sesion = request.getSession();
	if (request.getAttribute("personalMe") == null) {
		personalm = new PersonalMedico();
	} else {
		personalm = (PersonalMedico) request.getAttribute("personalMe");
		System.out.println(personalm.getId());
		System.out.println(personalm.getDni());
		System.out.println(personalm.getNombre());
		System.out.println(personalm.getApellido());
		System.out.println(personalm.getFechaN());
		System.out.println(personalm.getDireccion());
		System.out.println(personalm.getTelefono());
		System.out.println(personalm.getNumeroCole());
		System.out.println(personalm.getPersonal());
		System.out.println(personalm.getEspecialidad());
	}
	%>


	<form role="form"
		action="<%=url%>PersonalMedicosController?op=insertarhorario"
		method="post">
		<input type="hidden" name="id" id="id" value="<%=personalm.getId()%>">
		<label>Dni</label> <input type="text" name="dni" id="dni"
			value="<%=personalm.getDni()%>"><br>
		<br> <label>Nombres</label> <input type="text" name="nombre"
			id="nombre" value="<%=personalm.getNombre()%>"><br>
		<br> <label>Apellidos</label> <input type="text" name="apellido"
			id="apellido" value="<%=personalm.getApellido()%>"><br>
		<br> <label>Fecha</label> <input type="date" id="fecha"
			name="fecha"> <label>Hora de inicio</label> <input
			type="time" id="horainicio" name="horainicio">
			 <label>Hora de fin</label> <input
			type="time" id="horafin" name="horafin">
			 <label>Cupos</label> <input
			type="text" id="cupo" name="cupo"> <br><br> <input type="submit"
			name="guardar" id="guardar" value="Guardar"> <a
			href="<%=url%>PersonalMedicosController?op=listar">Volver</a>


	</form>










</body>
</html>