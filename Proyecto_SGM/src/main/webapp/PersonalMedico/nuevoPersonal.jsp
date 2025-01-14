
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

	<%
	String url = "http://localhost:8080/Proyecto_SGM/";
	%>
	
	
	<form  role="form" action="<%=url%>PersonalMedicosController?op=insertar" method="post" onsubmit="return validarFormulario()" >
	
		<label>Dni</label> <input type="text" name="dni" id="dni"  ><br><br>
		<label>Nombres</label> <input type="text" name="nombre" id="nombre"  ><br><br>
		<label>Apellidos</label> <input type="text" name="apellido" id="apellido"  ><br><br>
		<label>Fecha Nacimiento</label> <input type="date" name="fecha" id="fecha"  ><br><br>
		<label>Direccion</label> <input type="text" name="direccion" id="direccion"  ><br><br>
		<label>Telefono</label> <input type="text" name="telefono" id="telefono"  ><br><br>
		<label>Numero Colegiatura</label> <input type="text" name="numero" id="numero"  ><br><br>
		
		
		
		<label>Tipo de Personal</label>
		<select id="tipo" name="tipo" onchange="mostrarEspecialidades()">
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
		<br><br>
		
		<label>Tipo de Especialidad</label>
		<select id="especialidad" name="especialidad" disabled>
		 
		 

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
		<br><br>
	
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
		        especialidadSelect.value = "1"; // Opcional: Reiniciar selección
		    }
		}
		</script>
		
		
		
		<input type="submit" name="guardar" id="guardar" value="Guardar"  >
		 <a  href="<%=url%>PersonalMedicosController?op=listar">Volver</a>
		 
		
	</form>

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