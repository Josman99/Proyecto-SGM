package Proyecto_SGM.models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.naming.java.javaURLContextFactory;

import Proyecto_SGM.beans.Horario;

public class HorarioModel extends Conexion {

	protected CallableStatement cst;
	protected ResultSet rs;

	public List<Horario> listarEspecialidadHorario(int id) {

		List<Horario> lista = new ArrayList<Horario>();

		try {

			String sql = "CALL sp_seleccionarHorario(?)";
			this.abrirConexion();
			cst = conexion.prepareCall(sql);
			cst.setInt(1, id);
			rs = cst.executeQuery();

			while (rs.next()) {

				Horario hora = new Horario();

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
			System.out.println("error al listar tipo 1 1 :" + e.getMessage());
		}

		return null;

	}

	public int insertarHorario(Horario horario) {
	    try {
	    	int id;
	        int filas = 0;
	        

	       
	        String sql = "CALL sp_insertarHorario(?,?,?,?,?,?,?)";
	        this.abrirConexion();
	        cst = conexion.prepareCall(sql);

	        cst.setInt(1, horario.getPersonal());
	        cst.setDate(2, horario.getFecha());
	        cst.setTime(3, horario.getInicio());
	        cst.setTime(4, horario.getFin());
	        cst.setInt(5, horario.getTotcupos());
	        cst.setInt(6, horario.getDisponible());
	        cst.setInt(7, java.sql.Types.INTEGER);
	        
	        filas = cst.executeUpdate();
	        id=cst.getInt(7);

	 
	      
	       
	
	        String consulta = "CALL GenerarIntervalosPorId(?)";
	        cst = conexion.prepareCall(consulta);
	        cst.setInt(1, id);
	        cst.executeUpdate();

	        return filas;

	    } catch (Exception e) {
	        System.out.println("Error en insertar horario: " + e.getMessage());
	    } finally {
	        this.cerrarConexion();
	    }
	    return 0;
	}

	
	public List<Horario>listarHorario(){
		
		List<Horario>lista=new ArrayList<Horario>();
		
		try {
			
			String sql="CALL sp_listarHorario()";
			this.abrirConexion();
			cst=conexion.prepareCall(sql);
			rs=cst.executeQuery();
			
			while(rs.next()){
				
				Horario horario=new Horario();
				
				horario.setId(rs.getInt("Id_Horario"));
				horario.setPersonalmedico(rs.getString("Personal"));
				horario.setFecha(rs.getDate("Fecha"));
				horario.setInicio(rs.getTime("Hora_Inicio"));
				horario.setFin(rs.getTime("Hora_Fin"));
				horario.setTotcupos(rs.getInt("Total_Cupos"));
				horario.setDisponible(rs.getInt("Cupos_Disponible"));
				lista.add(horario);
				
				
			}
			
			return lista;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en lista horario 1:"+e.getMessage());
		}
		
		return null;
		
		
	}

}
