package Proyecto_SGM.beans;

import java.sql.Date;

public class PersonalMedico {
	
	
	private int id;
	private String dni;
	private String nombre;
	private String apellido;
	private Date fechaN;
	private String direccion;
	private String telefono;
	private String numeroCole;
	private int idpersonal;
	private int idespecialidad;
	
	private String personal;
	private String especialidad;
	
	private int edadP;
	

	public int getEdadP() {
		return edadP;
	}


	public void setEdadP(int edadP) {
		this.edadP = edadP;
	}


	public PersonalMedico() {
		super();
	}
	

	public String getPersonal() {
		return personal;
	}


	public void setPersonal(String personal) {
		this.personal = personal;
	}


	public String getEspecialidad() {
		return especialidad;
	}


	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public Date getFechaN() {
		return fechaN;
	}

	public void setFechaN(Date fechaN) {
		this.fechaN = fechaN;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getNumeroCole() {
		return numeroCole;
	}

	public void setNumeroCole(String numeroCole) {
		this.numeroCole = numeroCole;
	}

	public int getIdpersonal() {
		return idpersonal;
	}

	public void setIdpersonal(int idpersonal) {
		this.idpersonal = idpersonal;
	}

	public int getIdespecialidad() {
		return idespecialidad;
	}

	public void setIdespecialidad(int idespecialidad) {
		this.idespecialidad = idespecialidad;
	}

	
	
	
	
	

}
