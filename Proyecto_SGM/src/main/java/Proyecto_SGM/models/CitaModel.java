package Proyecto_SGM.models;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Proyecto_SGM.beans.Cita;
import Proyecto_SGM.beans.Paciente;


public class CitaModel extends Conexion {

	protected CallableStatement cst;
	protected ResultSet rs;

	public List<Cita> listarCita() {

		List<Cita> lista = new ArrayList<Cita>();

		try {

			String sql = "CALL sp_listarCita()";
			this.abrirConexion();
			cst = conexion.prepareCall(sql);
			rs = cst.executeQuery();
			while (rs.next()) {

				Cita cita = new Cita();

				cita.setId(rs.getInt("id_cita"));
				cita.setFechacreacion(rs.getDate("fecha_creada"));
				//cita.setId_paciente(rs.getInt("id_paciente"));
			    //cita.setId_horario(rs.getInt("id_intervalo"));
				cita.setFechacita(rs.getDate("fecha"));
				cita.setDocumento(rs.getString("Doc_Id_Paciente"));
				cita.setHora(rs.getString("horario"));
				cita.setPaciente(rs.getString("Paciente"));
				lista.add(cita);

			}

			return lista;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en listar  cita 1:" + e.getMessage());
		}

		return null;
	}
	
	
	
	public boolean verificarCitaExistente(int idIntervalo) throws SQLException {
	    boolean existe = false;
	    try {
	        String sql = "SELECT COUNT(*) FROM cita WHERE id_intervalo = ?";
	        this.abrirConexion();
	        cst = conexion.prepareCall(sql);
	        cst.setInt(1, idIntervalo);
	        
	        ResultSet rs = cst.executeQuery();
	        if (rs.next()) {
	            int count = rs.getInt(1);
	            if (count > 0) {
	                existe = true;  
	            }
	        }
	        rs.close();
	    } catch (SQLException e) {
	        System.out.println("Error al verificar existencia de cita: " + e.getMessage());
	    }
	    return existe;
	}

	
	
	
	public int insertarCita(Cita cita) throws SQLException {
	    try {
	        int filasAfectadas = 0;
	        
	        boolean citaExistente = verificarCitaExistente(cita.getId_horario());

	        if (citaExistente) {
	            System.out.println("Error: El Horario ya está ocupado.");
	            return 0;  
	        }
	        
	        
	     
	        String sqlInsert = "CALL sp_insertarCita(?,?,?,?)";
	        this.abrirConexion();
	        cst = conexion.prepareCall(sqlInsert);
	        
	        Date fechaactual = new Date(System.currentTimeMillis());
	        cst.setDate(1, fechaactual);  
	        cst.setInt(2, cita.getId_paciente());  
	        cst.setInt(3, cita.getId_horario());  
	        cst.setDate(4, cita.getFechacita());  
	        
	        filasAfectadas = cst.executeUpdate();
	        
	      
	        if (filasAfectadas > 0) {
	            
	            String sqlActualizarCupo = "CALL sp_ActualizarCupo(?)";
	            cst = conexion.prepareCall(sqlActualizarCupo);
	            cst.setInt(1, cita.getId_horario());  
	            cst.executeUpdate();  
	        }

	        return filasAfectadas;
	    } catch (Exception e) {
	        System.out.println("Error al insertar cita: " + e.getMessage());
	        return 0;
	    }
	}

	
	
	
	

}
