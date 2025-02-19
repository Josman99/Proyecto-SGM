<%@page import="Proyecto_SGM.beans.PersonalMedico"%>
<%@page import="Proyecto_SGM.beans.Especialidad"%>
<%@page import="Proyecto_SGM.models.EspecialidadModel"%>
<%@page import="Proyecto_SGM.beans.TipoPersonal"%>
<%@page import="java.util.List"%>
<%@page import="Proyecto_SGM.models.TipoModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SISTEMA DE GESTION DE MEDICA</title>

</head>
<body>
<script>
 function validarFormulario() {
	const docIden = document.getElementById('dni').value.trim();
	const nombres = document.getElementById('nombre').value.trim();
	const apellidos = document.getElementById('apellido').value.trim();
	const fechNaci = document.getElementById('fecha').value.trim();
	const direc = document.getElementById('direccion').value.trim();
	const tele = document.getElementById('telefono').value.trim();
	const numCol = document.getElementById('numero').value.trim();
	const tipo = document.getElementById('tipo').value.trim();
    const valorNumerico = Number(tipo);
	const especialidad = document.getElementById('especialidad').value.trim();
	const valorNumericoEs = Number(especialidad);
	
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
	if(valorNumerico === 0){
		alert('Ingrese Tipo de Personal');
		document.getElementById('tipo').focus();
		return false;
	}
	if(valorNumerico === 1 && valorNumericoEs === 1){
		alert('Ingrese especialidad de Personal');
		document.getElementById('especialidad').focus();
		return false;
	}
	
	return true;
}
</script>

<%@ include file='/cabeceraMenu.jsp' %>
<%
	PersonalMedico personalm;
	HttpSession sesion = request.getSession();
	if(request.getAttribute("personalM")==null){
		personalm = new PersonalMedico();
	} else {
		personalm = (PersonalMedico) request.getAttribute("personalM");
		System.out.println(personalm.getId());
		System.out.println(personalm.getDni());
		System.out.println(personalm.getNombre());
		System.out.println(personalm.getApellido());
		System.out.println(personalm.getFechaN());
		System.out.println(personalm.getDireccion());
		System.out.println(personalm.getTelefono());
		System.out.println(personalm.getNumeroCole());
		System.out.println(personalm.getPersonal());
		System.out.println(personalm.getIdpersonal());
		System.out.println(personalm.getEspecialidad());
		System.out.println(personalm.getIdespecialidad());
	}
%>
	
	<div class="container">
	
		<h3 class="text-center mt-3 mb-2">MODIFICAR PERSONAL MEDICO</h3>
		
		<form  role="form" action="<%=url%>PersonalMedicosController?op=modificar" method="post" onsubmit="return validarFormulario()">
			
			<input type="hidden" name="id" id="id" value="<%=personalm.getId()%>">
			<div class="form-group row mb-4">
			      <div class="col-md-6 mt-4">
			        <label class="form-label">INGRESE DNI</label>
					<input type="number" class="form-control" name="dni" id="dni" value="<%=personalm.getDni()%>" oninput="if(this.value.length > 8) this.value = this.value.slice(0, 8);" >
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">NOMBRES</label>
					<input type="text" class="form-control" name="nombre" id="nombre" value="<%=personalm.getNombre()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">APELLIDOS</label>
			        <input type="text" class="form-control" name="apellido" id="apellido" value="<%=personalm.getApellido()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">FECHA DE NACIMIENTO</label>
					<input type="date" class="form-control" name="fecha" id="fecha" value="<%=personalm.getFechaN()%>" >
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">DIRECCIÓN</label>
					<input type="text" class="form-control" name="direccion" id="direccion" value="<%=personalm.getDireccion()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">TELÉFONO</label>
					<input type="text" class="form-control" name="telefono" id="telefono" value="<%=personalm.getTelefono()%>">
			      </div>
			      <div class="col-md-6 mt-4">
			        <label class="form-label">NÚMERO DE COLEGIATURA</label>
					<input type="text" class="form-control" name="numero" id="numero" value="<%=personalm.getNumeroCole()%>">
			      </div>
			      
			      
			      <div class="col-md-6 mt-4">
			        <label class="form-label">TIPO DE PERSONAL</label>
					<select class="form-control" id="tipo" name="tipo" onchange="mostrarEspecialidades()">
					    <%-- Generar las opciones dinámicas --%>
					    <%
					        TipoModel model = new TipoModel();
					        List<TipoPersonal> lista = model.listarTipo();
					        if (lista != null) {
					            for (TipoPersonal tipo : lista) {
					                // Comparar los valores como cadenas para evitar problemas
					                boolean isSelected = personalm.getIdpersonal()==tipo.getId();
					    %>
					                <option value="<%=tipo.getId()%>" <%=isSelected ? "selected" : ""%>>
					                    <%=tipo.getDescripcion()%></option>
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
					<select class="form-control" id="especialidad" name="especialidad" disabled">

					    <%
					    EspecialidadModel modelo = new EspecialidadModel();
					    List<Especialidad> listas = modelo.listarEspecialidad();
					    if (listas != null) {
					        for (Especialidad especial : listas) {
					        	boolean isSelected = personalm.getIdespecialidad()==especial.getId();
					    %>
					    
					    <option value="<%=especial.getId() %>"<%=isSelected ? "selected" : ""%>>
					    <%=especial.getDescripcion() %></option>
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
    const tipoSeleccionadosss = String(tipoSelect.value); // Convertir a String
    
    
    // Habilitar o deshabilitar el campo especialidad
    if (tipoSeleccionado === 1 ) {
        especialidadSelect.disabled = false;
    } else {
        especialidadSelect.disabled = true;
        //especialidadSelect.value = "0"; // Opcional: Reiniciar selección
    }
}
</script>
	
	

</body>
</html>