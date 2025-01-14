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
<title>Insert title here</title>
</head>
<body>
<%
	String url = "http://localhost:8080/Proyecto_SGM/";

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
		System.out.println(personalm.getEspecialidad());
	}
	%>
	
	
	<form  role="form" action="<%=url%>PersonalMedicosController?op=modificar" method="post">
		<input type="hidden" name="id" id="id" value="<%=personalm.getId()%>">
		<label>Dni</label> <input type="text" name="dni" id="dni" value="<%=personalm.getDni()%>" ><br><br>
		<label>Nombres</label> <input type="text" name="nombre" id="nombre" value="<%=personalm.getNombre()%>" ><br><br>
		<label>Apellidos</label> <input type="text" name="apellido" id="apellido" value="<%=personalm.getApellido()%>" ><br><br>
		<label>Fecha Nacimiento</label> <input type="date" name="fecha" id="fecha" value="<%=personalm.getFechaN()%>" ><br><br>
		<label>Direccion</label> <input type="text" name="direccion" id="direccion" value="<%=personalm.getDireccion()%>" ><br><br>
		<label>Telefono</label> <input type="text" name="telefono" id="telefono" value="<%=personalm.getTelefono()%>" ><br><br>
		<label>Numero Colegiatura</label> <input type="text" name="numero" id="numero" value="<%=personalm.getNumeroCole()%>" ><br><br>
		
		
		
		<label>Tipo de Personal</label>
		<select id="tipo" name="tipo" onchange="mostrarEspecialidades()">
		               <option value="exit" ><%=personalm.getPersonal()%></option>
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
		<select id="especialidad" name="especialidad">
		 
		       <option  ><%=personalm.getEspecialidad()%></option>
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
		
		
		
		<input type="submit" name="guardar" id="guardar" value="Guardar"  >
		 <a  href="<%=url%>PersonalMedicosController?op=listar">Volver</a>
		 
		
	</form>

</body>
</html>