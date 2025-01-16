<%@page import="Proyecto_SGM.beans.Paciente"%>
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
<script>
 function validarFormulario() {
	const docIden = document.getElementById('docIden').value.trim();
	const nombres = document.getElementById('nombres').value.trim();
	const apellidos = document.getElementById('apellidos').value.trim();
	const fechNaci = document.getElementById('fechNaci').value.trim();
	const direc = document.getElementById('direccion').value.trim();
	const tele = document.getElementById('telefono').value.trim();

	if(docIden === ''){
		alert('Ingrese documento de identidad del paciente');
		document.getElementById('docIden').focus();
		return false;
	}
	if(nombres === ''){
		alert('Ingrese nombres del paciente');
		document.getElementById('nombres').focus();
		return false;
	}
	if(apellidos === ''){
		alert('Ingrese apellidos del paciente');
		document.getElementById('apellidos').focus();
		return false;
	}
	if(fechNaci === ''){
		alert('Ingrese fecha de nacimiento del paciente');
		document.getElementById('fechNaci').focus();
		return false;
	}
	if(direc === ''){
		alert('Ingrese direccion del paciente');
		document.getElementById('direccion').focus();
		return false;
	}
	if(tele === ''){
		alert('Ingrese telefono del paciente');
		document.getElementById('telefono').focus();
		return false;
	}
	return true;
}
</script>

	<div class="container">
	
		<h3 class="text-center mt-3">MODIFICAR PACIENTE</h3>
		
		<form role="form" action="<%=url%>PacienteController?op=modificar" method="POST" onclick="return validarFormulario()">
			
			<input  type="hidden" name="id" id="id" value="<%=paciente.getIdPaciente()%>">
			
			<div class="form-group row mb-4">
			      <div class="col-md-6 mt-4">
			        <label class="form-label">INGRESE DNI</label>
					<input type="number" class="form-control" name="docIden" id="docIden" value="<%=paciente.getDocIdent()%>"
					oninput="if(this.value.length > 8) this.value = this.value.slice(0, 8);" >
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">NOMBRES</label>
					<input type="text" class="form-control" name="nombres" id="nombres" value="<%=paciente.getNombres()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">APELLIDOS</label>
			        <input type="text" class="form-control" name="apellidos" id="apellidos" value="<%=paciente.getApellidos()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">FECHA DE NACIMIENTO</label>
					<input type="date" class="form-control" name="fechNaci" id="fechNaci" value="<%=paciente.getFechNaci()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">DIRECCIÓN</label>
					<input type="text" class="form-control" name="direccion" id="direccion" value="<%=paciente.getDireccion()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">TELÉFONO</label>
					<input type="text" class="form-control" name="telefono" id="telefono" value="<%=paciente.getTelefono()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">APODERADO</label>
					<input type="text" class="form-control" name="apoderado" id="apoderado" value="<%=paciente.getApoder()%>">
			      </div>
			      
			</div>
			<div class="d-flex justify-content-end">
				<input class="btn btn-primary mr-2" type="submit" name="guardar" value="guardar"><br>
				<a class="btn btn-success " href="<%=url%>PacienteController?op=listar">volver</a>
			</div>
		
	</form>
	
	</div>
	
	
</body>
</html>