
<%@page import="Proyecto_SGM.beans.Especialidad"%>
<%@page import="Proyecto_SGM.models.EspecialidadModel"%>
<%@page import="Proyecto_SGM.beans.TipoPersonal"%>
<%@page import="Proyecto_SGM.models.TipoModel"%>
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
	const docIden = document.getElementById('dni').value.trim();
	const nombres = document.getElementById('nombre').value.trim();
	const apellidos = document.getElementById('apellido').value.trim();
	const fechNaci = document.getElementById('fecha').value.trim();
	const direc = document.getElementById('direccion').value.trim();
	const tele = document.getElementById('telefono').value.trim();
	const numCol = document.getElementById('numero').value.trim();

	if(docIden === ''){
		alert('Ingrese documento de identidad del Personal');
		document.getElementById('dni').focus();
		return false;
	}
	if(nombres === ''){
		alert('Ingrese nombres del Personal');
		document.getElementById('nombre').focus();
		return false;
	}
	if(apellidos === ''){
		alert('Ingrese apellidos del Personal');
		document.getElementById('apellido').focus();
		return false;
	}
	if(fechNaci === ''){
		alert('Ingrese fecha de nacimiento del Personal');
		document.getElementById('fecha').focus();
		return false;
	}
	if(direc === ''){
		alert('Ingrese direccion del Personal');
		document.getElementById('direccion').focus();
		return false;
	}
	if(tele === ''){
		alert('Ingrese telefono del Personal');
		document.getElementById('telefono').focus();
		return false;
	}
	if(numCol === ''){
		alert('Ingrese numero de colegiatura del Personal');
		document.getElementById('numero').focus();
		return false;
	}
	return true;
}
</script>
	
	<div class="container">
	
		<h2 class="text-center mt-2 mb-2">NUEVO PERSONAL MEDICO</h2>
		
		<form  role="form" action="<%=url%>PersonalMedicosController?op=insertar" method="post" onsubmit="return validarFormulario()" >
	
			
			<div class="form-group row mb-4">
			      <div class="col-md-6 mt-4">
			        <label class="form-label">INGRESE DNI</label>
					<input type="number" class="form-control" name="dni" id="dni" placeholder="DNI" oninput="if(this.value.length > 8) this.value = this.value.slice(0, 8);" >
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">NOMBRES</label>
					<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombres">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">APELLIDOS</label>
			        <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">FECHA DE NACIMIENTO</label>
					<input type="date" class="form-control" name="fecha" id="fecha" >
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
			        <label class="form-label">NÚMERO DE COLEGIATURA</label>
					<input type="text" class="form-control" name="numero" id="numero" placeholder="Numero de Colegiatura">
			      </div>
			      
			      
			      <div class="col-md-6 mt-4">
			        <label class="form-label">TIPO DE PERSONAL</label>
					<select class="form-control" id="tipo" name="tipo" onchange="mostrarEspecialidades()">
			               <option value="0" >Seleccionar</option>
					    <%
					    TipoModel model = new TipoModel();
					    List<TipoPersonal> lista = model.listarTipo();
					    if (lista != null) {
					        for (TipoPersonal tipo : lista) {
					    %>
					    
					    <option value="<%=tipo.getId() %>"><%=tipo.getDescripcion() %></option>
					    <%
					        }
					    } else {
					    %>
					    <option>No hay datos</option>
					    <%
					    }
					    %>
					</select>
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">TIPO ESPECIALIDAD</label>
					<select class="form-control" id="especialidad" name="especialidad" disabled>
	
					    <%
					    EspecialidadModel modelo = new EspecialidadModel();
					    List<Especialidad> listas = modelo.listarEspecialidad();
					    if (listas != null) {
					        for (Especialidad especial : listas) {
					    %>
					    
					    <option value="<%=especial.getId() %>"><%=especial.getDescripcion() %></option>
					    <%
					        }
					    } else {
					    %>
					    <option>No hay datos</option>
					    <%
					    }
					    %>
					</select>
			      </div>
			      
			</div>
			 
			<div class="d-flex justify-content-end">
				<a class="btn btn-primary mr-2" href="<%=url%>PersonalMedicosController?op=listar">volver</a>
				<input class="btn btn-success " type="submit" name="guardar" id="guardar" value="Guardar"><br>
			</div>  
			 
			
		</form>
	</div>
	
<script>
	function mostrarEspecialidades() {
	    // Obtener el valor del select tipo
	    const tipoSelect = document.getElementById('tipo');
	    const especialidadSelect = document.getElementById('especialidad');
	    const tipoSeleccionado = parseInt(tipoSelect.value, 10); // Convertir a número
	    
	    // Habilitar o deshabilitar el campo especialidad
	    if (tipoSeleccionado === 1) {
	        especialidadSelect.disabled = false;
	    } else {
	        especialidadSelect.disabled = true;
	        especialidadSelect.value = "1"; 
	    }
	}
</script>	

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