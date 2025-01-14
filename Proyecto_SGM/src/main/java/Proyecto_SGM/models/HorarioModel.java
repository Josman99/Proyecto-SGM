package Proyecto_SGM.models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Proyecto_SGM.beans.Horario;


public class HorarioModel extends Conexion {
	
	protected CallableStatement cst;
	protected ResultSet rs;
	
	
public List<Horario> listarEspecialidadHorario(int id){
		
		List<Horario>lista=new ArrayList<Horario>();
		
		try {
			
			String sql="CALL sp_seleccionarHorario(?)";
			this.abrirConexion();
			cst=conexion.prepareCall(sql);
			cst.setInt(1, id);
			rs=cst.executeQuery();
			
			while(rs.next()) {
				
				Horario hora=new Horario();
				
				hora.setId(rs.getInt("Id_Horario"));
				hora.setDoctor(rs.getString("Dr"));
				hora.setEspecialidad(rs.getString("Especialidad"));
				hora.setFecha(rs.getDate("Fecha"));
				hora.setHorario(rs.getString("Horario"));
				hora.setTotcupos(rs.getInt("Total_Cupos"));
				hora.setCupos(rs.getInt("Cupos_Disponible"));
				lista.add(hora);
			}
			this.cerrarConexion();
			return lista;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error al listar tipo 1 1 :"+e.getMessage());
		}
		
		return null;
		
		
		
	}
	
	
	
	

}
