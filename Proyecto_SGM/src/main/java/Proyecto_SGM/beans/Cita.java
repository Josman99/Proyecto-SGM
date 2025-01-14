package Proyecto_SGM.beans;

import java.sql.Date;

public class Cita {
	
	
	
	private int id;
	private int id_paciente;
	private int id_horario;
	private Date fecha;
	
	
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


	public Date getFecha() {
		return fecha;
	}


	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	
	
	
	
	
	
	

}
