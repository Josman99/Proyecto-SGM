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
<%
	String url = "http://localhost:8080/Proyecto_SGM/";
%>

	<form role="form" action="<%=url%>PacienteController?op=ingresar" method="POST" onsubmit="return validarFormulario()">
		<input  type="hidden" name="id" id="id">
		<label>Ingrese Doc Ident</label><br>
		<input type="text" name="docIden" id="docIden"><br>
		<label>Ingrese Nombres</label><br>
		<input type="text" name="nombres" id="nombres"><br>
		<label>Ingrese Apellidos</label><br>
		<input type="text" name="apellidos" id="apellidos"><br>
		<label>Ingrese Fecha Nacimiento</label><br>
		<input type="date" name="fechNaci" id="fechNaci"><br>
		<label>Ingrese Direccion</label><br>
		<input type="text" name="direccion" id="direccion"><br>
		<label>Ingrese Telefono</label><br>
		<input type="text" name="telefono" id="telefono"><br>
		<label>Ingrese Apoderado</label><br>
		<input type="text" name="apoderado" id="apoderado"><br>
		
		<input type="submit" name="guardar" value="guardar"><br>
		<a href="<%=url%>PacienteController?op=listar">volver</a>
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