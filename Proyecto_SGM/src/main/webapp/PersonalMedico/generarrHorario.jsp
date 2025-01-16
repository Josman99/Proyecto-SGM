<%@page import="Proyecto_SGM.beans.PersonalMedico"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SISTEMA DE GESTION DE MEDICA</title>
</head>
<body>
<%@ include file='/cabeceraMenu.jsp' %>

<script>

function validarFormulario() {
	const fecha = document.getElementById('fecha').value.trim();
	const hinicio = document.getElementById('horainicio').value.trim();
	const hfin = document.getElementById('horafin').value.trim();
	const cupo = document.getElementById('cupo').value.trim();

	if(fecha === ''){
		alert('Ingrese fecha');
		document.getElementById('fecha').focus();
		return false;
	}
	if(hinicio === ''){
		alert('Ingrese hora de inicio');
		document.getElementById('horainicio').focus();
		return false;
	}
	if(hfin === ''){
		alert('Ingrese hora fin');
		document.getElementById('horafin').focus();
		return false;
	}
	if(cupo === ''){
		alert('Ingrese cantidad de cupos');
		document.getElementById('cupo').focus();
		return false;
	}
	return true;
}

</script>

	<%
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
	
	<div class="container">
		
		<h3 class="text-center mt-3 mb-3">ASIGNAR HORARIO</h3>
		
		<form role="form" action="<%=url%>PersonalMedicosController?op=insertarhorario" method="post" onsubmit="return validarFormulario()">
			<input type="hidden" name="id" id="id" value="<%=personalm.getId()%>">
			<div class="form-group row mb-4">
		    	<div class="col-md-6 mt-4">
			        <label class="form-label">DNI</label>
					<input type="text" class="form-control" name="dni" id="dni" placeholder="DNI" value="<%=personalm.getDni()%>" disabled="disabled">
		      	</div>
		      	<div class="col-md-6 mt-4">
			        <label class="form-label">Nombres</label>
					<input type="text" class="form-control" name="nombre" id="nombre" value="<%=personalm.getNombre()%>" disabled="disabled">
		      	</div>
		      	<div class="col-md-6 mt-4">
			        <label class="form-label">Apellidos</label>
					<input type="text" class="form-control" name="apellido" id="apellido" value="<%=personalm.getApellido()%>" disabled="disabled">
		      	</div>
		      	<div class="col-md-6 mt-4">
			        <label class="form-label">Fecha</label>
					<input class="form-control" type="date" id="fecha" name="fecha" >
		      	</div>
		      	<div class="col-md-4 mt-4">
			        <label class="form-label">Hora de inicio</label>
					<input class="form-control" type="time" id="horainicio" name="horainicio" >
		      	</div>
		      	<div class="col-md-4 mt-4">
			        <label class="form-label">Hora de fin</label>
					<input class="form-control" type="time" id="horafin" name="horafin" >
		      	</div>
		      	<div class="col-md-4 mt-4">
			        <label class="form-label">Cupos</label>
					<input class="form-control" type="text" id="cupo" name="cupo" >
				</div>
				
				<!-- Botones de acción -->
				<div class="col-md-12 mt-4 d-flex justify-content-between align-items-center">
				    <a href="<%=url%>PersonalMedicosController?op=listar" class="btn btn-secondary">Volver</a>
				    
				    <input type="submit" class="btn btn-success" name="guardar" id="guardar" value="Guardar">
				</div>	
				      
			</div>
		
		</form>
	
	</div>

</body>
</html>