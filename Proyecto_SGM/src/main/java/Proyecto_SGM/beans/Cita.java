package Proyecto_SGM.beans;

import java.sql.Date;

public class Cita {
	
	
	
	private int id;
	private int id_paciente;
	private int id_horario;
	private Date fechacreacion;
	private Date fechacita;
	private String hora;
	private String paciente;
	private String documento;
	private String nombreDoc;
	private String especialidad;
	
	
	
	public String getDocumento() {
		return documento;
	}


	public void setDocumento(String documento) {
		this.documento = documento;
	}
	
	
	


	public String getNombreDoc() {
		return nombreDoc;
	}


	public void setNombreDoc(String nombreDoc) {
		this.nombreDoc = nombreDoc;
	}


	public String getEspecialidad() {
		return especialidad;
	}


	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}


	public Cita() {
		super();
	}


	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}


	public int getId_paciente() {
		return id_paciente;
	}


	public void setId_paciente(int id_paciente) {
		this.id_paciente = id_paciente;
	}


	public int getId_horario() {
		return id_horario;
	}


	public void setId_horario(int id_horario) {
		this.id_horario = id_horario;
	}


	public Date getFechacreacion() {
		return fechacreacion;
	}


	public void setFechacreacion(Date fechacreacion) {
		this.fechacreacion = fechacreacion;
	}


	public Date getFechacita() {
		return fechacita;
	}


	public void setFechacita(Date fechacita) {
		this.fechacita = fechacita;
	}


	public String getHora() {
		return hora;
	}


	public void setHora(String hora) {
		this.hora = hora;
	}


	public String getPaciente() {
		return paciente;
	}


	public void setPaciente(String paciente) {
		this.paciente = paciente;
	}


	
	
	
	
	
	
	
	
	

}