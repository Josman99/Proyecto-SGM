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

</head>
<body>
<%@ include file='/cabeceraMenu.jsp' %>
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
		
		<h3 class="text-center mt-2 mb-2">NUEVO PACIENTE</h3>
		
		
		<form role="form" action="<%=url%>PacienteController?op=ingresar" method="POST" onsubmit="return validarFormulario()">
			
			<div class="form-group row mb-4">
			      <div class="col-md-6 mt-4">
			        <label class="form-label">INGRESE DNI</label>
					<input type="number" class="form-control" name="docIden" id="docIden" placeholder="DNI" oninput="if(this.value.length > 8) this.value = this.value.slice(0, 8);" >
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">NOMBRES</label>
					<input type="text" class="form-control" name="nombres" id="nombres" placeholder="Nombres">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">APELLIDOS</label>
			        <input type="text" class="form-control" name="apellidos" id="apellidos" placeholder="Apellido">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">FECHA DE NACIMIENTO</label>
					<input type="date" class="form-control" name="fechNaci" id="fechNaci" >
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">DIRECCIÓN</label>
					<input type="text" class="form-control" name="direccion" id="direccion" placeholder="Direccion">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">TELÉFONO</label>
					<input type="text" class="form-control" name="telefono" id="telefono" placeholder="Telefono">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">APODERADO</label>
					<input type="text" class="form-control" name="apoderado" id="apoderado" placeholder="Apoderado">
			      </div>
			      
			</div>
			
			<div class="d-flex justify-content-end">
				<a class="btn btn-primary mr-2" href="<%=url%>PacienteController?op=listar">volver</a>
				<input class="btn btn-success " type="submit" name="guardar" value="guardar"><br>
			</div>  
		</form>
		
		
	</div>

	
<%
	if(request.getAttribute("respuesta") !=null) {
		boolean res = (boolean) request.getAttribute("respuesta");
		if(res){
			List<String> listaError = (List<String>) request.getAttribute("listaError");
			for(String error : listaError) {
				%>
<span><%=error %></span>	
<br>	
			<%			
			}
		}
	}
%>
</body>
</html>