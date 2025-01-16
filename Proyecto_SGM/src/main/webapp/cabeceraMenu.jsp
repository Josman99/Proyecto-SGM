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
<script src="https://kit.fontawesome.com/273f05f2f3.js" crossorigin="anonymous"></script>
</head>
<body>
<%
	String url = "http://localhost:8080/Proyecto_SGM/";
	%>

<div class="container">


</div>	

	
	<nav class="navbar navbar-expand-lg navbar-light bg-primary navbar-custom">
	  <a class="navbar-brand mr-4" style="color: white; font-weight: 700;"><i class="fa-solid fa-truck-medical"></i> SISTEMA DE GESTION DE CITAS <i class="fa-solid fa-truck-medical"></i></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav ml-5 mr-auto">
	      <li class="nav-item">
	          <a class="nav-link active" style="color: white; font-weight: 700;" aria-current="page" href="<%=url%>PacienteController?op=listar">PACIENTES</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link active" style="color: white; font-weight: 700;" aria-current="page" href="<%=url%>PersonalMedicosController?op=listar">PERSONAL MEDICO</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link active" style="color: white; font-weight: 700;" aria-current="page" href="<%=url%>CitaController?op=listar">CITAS</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          REPORTES
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">REPORTE 1</a>
	          <a class="dropdown-item" href="#">REPORTE 2</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Otros</a>
	        </div>
	      </li>
	      
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>
	  </div>
	</nav>


</body>
</html>