package Proyecto_SGM.beans;

import java.sql.Date;

public class Paciente {
	private int idPaciente;
	private String docIdent;
	private String nombres;
	private String apellidos;
	private Date fechNaci;
	private String direccion;
	private String telefono;
	private String apoder;
	private int edad;
	private String NombreCompleto;
	
	
	public Paciente(int idPaciente, String docIdent, String nombres, String apellidos, Date fechNaci, String direccion,
			String telefono, String apoder) {
		super();
		this.idPaciente = idPaciente;
		this.docIdent = docIdent;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.fechNaci = fechNaci;
		this.direccion = direccion;
		this.telefono = telefono;
		this.apoder = apoder;
	}
	

	public Paciente() {
		
	}
	
	public String getNombreCompleto() {
		return NombreCompleto;
	}


	public void setNombreCompleto(String nombreCompleto) {
		NombreCompleto = nombreCompleto;
	}


	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}


	public int getIdPaciente() {
		return idPaciente;
	}

	public void setIdPaciente(int idPaciente) {
		this.idPaciente = idPaciente;
	}

	public String getDocIdent() {
		return docIdent;
	}

	public void setDocIdent(String docIdent) {
		this.docIdent = docIdent;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public Date getFechNaci() {
		return fechNaci;
	}

	public void setFechNaci(Date fechNaci) {
		this.fechNaci = fechNaci;
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

	public String getApoder() {
		return apoder;
	}

	public void setApoder(String apoder) {
		this.apoder = apoder;
	}
	
	
}
