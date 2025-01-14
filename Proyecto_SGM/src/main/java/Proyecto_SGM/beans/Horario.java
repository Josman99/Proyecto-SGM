package Proyecto_SGM.beans;

import java.sql.Date;
import java.sql.Time;

public class Horario {
	
	private int id;
	private String doctor;
	private String Especialidad;
	private Date fecha;
	private String horario;
	private int totcupos;
	private int cupos;
	
	
	public Horario() {
		super();
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getDoctor() {
		return doctor;
	}


	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}


	public String getEspecialidad() {
		return Especialidad;
	}


	public void setEspecialidad(String especialidad) {
		Especialidad = especialidad;
	}


	public Date getFecha() {
		return fecha;
	}


	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}


	


	public String getHorario() {
		return horario;
	}


	public void setHorario(String horario) {
		this.horario = horario;
	}


	public int getTotcupos() {
		return totcupos;
	}


	public void setTotcupos(int totcupos) {
		this.totcupos = totcupos;
	}


	public int getCupos() {
		return cupos;
	}


	public void setCupos(int cupos) {
		this.cupos = cupos;
	}
	
	
	
	
	
	
	
	
	

}
