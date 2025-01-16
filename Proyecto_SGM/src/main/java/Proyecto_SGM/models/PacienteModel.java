package Proyecto_SGM.models;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import Proyecto_SGM.beans.Paciente;
import Proyecto_SGM.controller.PacienteController;

public class PacienteModel extends Conexion {
	CallableStatement cs;
	ResultSet rs;	
	public List<Paciente> listaPaciente() throws SQLException{
		try {
			List<Paciente> lista = new ArrayList<>();
			String sql= "Call sp_listarPaciente()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Paciente paciente = new Paciente();
				paciente.setIdPaciente(rs.getInt("id_paciente"));
				paciente.setDocIdent(rs.getString("Doc_Id_Paciente"));
				paciente.setNombres(rs.getString("Nombres_Paciente"));
				paciente.setApellidos(rs.getString("Apellidos_Paciente"));
				paciente.setFechNaci(rs.getDate("FechaNacimiento_Paciente"));
				paciente.setDireccion(rs.getString("Direccion_Paciente"));
				paciente.setTelefono(rs.getString("Telefono_Paciente"));
				paciente.setApoder(rs.getString("Apoderado_Paciente"));
				lista.add(paciente);
			}
			this.cerrarConexion();
			return lista;
			
		} catch (SQLException ex) {
			Logger.getLogger(PacienteController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
			this.cerrarConexion();
			return null;
		}
	}	
	public int insertarPaciente(Paciente paciente) throws SQLException{
		try {
			int filasAfectadas=0; 
			String sql = "CALL sp_insertarPaciente(?,?,?,?,?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, paciente.getDocIdent());
			cs.setString(2, paciente.getNombres());
			cs.setString(3, paciente.getApellidos());
			cs.setDate(4, paciente.getFechNaci());
			cs.setString(5, paciente.getDireccion());
			cs.setString(6, paciente.getTelefono());
			cs.setString(7, paciente.getApoder());
			filasAfectadas = cs.executeUpdate();
			return filasAfectadas;
		} catch (Exception e) {
			System.out.println("error al insertar en el modelo: "+e.getMessage());
			return 0;
		}
	}
	public Paciente obtenerPaciente(int idPaciente) throws SQLException{
		Paciente mipaciente = new Paciente();
		try {
			String sql ="CALL sp_obtenerPaciente(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idPaciente);
			rs = cs.executeQuery();
			if (rs.next()) {
				mipaciente.setIdPaciente(rs.getInt("id_paciente"));
				mipaciente.setDocIdent(rs.getString("Doc_Id_Paciente"));
				mipaciente.setNombres(rs.getString("Nombres_Paciente"));
				mipaciente.setApellidos(rs.getString("Apellidos_Paciente"));
				mipaciente.setFechNaci(rs.getDate("FechaNacimiento_Paciente"));
				mipaciente.setDireccion(rs.getString("Direccion_Paciente"));
				mipaciente.setTelefono(rs.getString("Telefono_Paciente"));
				mipaciente.setApoder(rs.getString("Apoderado_Paciente"));
				this.cerrarConexion();
				return mipaciente;
			}
		} catch (Exception e) {
			System.out.println("error al obtener desde el modelo: "+e.getMessage());
			this.cerrarConexion();
			return null;
		}
		return mipaciente;		
	}	
	public int modificarPaciente(Paciente paciente) throws SQLException{
		try {
			int filasAfectadas=0; 
			String sql = "CALL sp_modificarPaciente(?,?,?,?,?,?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, paciente.getIdPaciente());
			cs.setString(2, paciente.getDocIdent());
			cs.setString(3, paciente.getNombres());
			cs.setString(4, paciente.getApellidos());
			cs.setDate(5, paciente.getFechNaci());
			cs.setString(6, paciente.getDireccion());
			cs.setString(7, paciente.getTelefono());
			cs.setString(8, paciente.getApoder());
			filasAfectadas = cs.executeUpdate();
			return filasAfectadas;
		} catch (Exception e) {
			System.out.println("error al insertar en el modelo: "+e.getMessage());
			return 0;
		}
	}
	public int eliminarPaciente(int idPaciente) throws SQLException{
		try {
			int filasAfectadas=0;
			String sql ="CALL sp_eliminarPaciente(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idPaciente);
			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;
		} catch (Exception e) {
			System.out.println("error al obtener desde el modelo: "+e.getMessage());
			return 0;
		}	
	}	
	
	public Paciente obtenerPacientes(int idPaciente) throws SQLException{
		Paciente mipaciente = new Paciente();
		try {
			String sql ="CALL sp_obtenerPacientes(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idPaciente);
			rs = cs.executeQuery();
			if (rs.next()) {
				mipaciente.setIdPaciente(rs.getInt("id_paciente"));
				mipaciente.setDocIdent(rs.getString("Doc_Id_Paciente"));
				mipaciente.setNombreCompleto(rs.getString("Nombre"));
				mipaciente.setFechNaci(rs.getDate("FechaNacimiento_Paciente"));
				Date sqlDate = rs.getDate("FechaNacimiento_Paciente");
				if (sqlDate != null) {
	                LocalDate fechaNacimiento = sqlDate.toLocalDate();
	                LocalDate fechaActual = LocalDate.now();
	                int edad = Period.between(fechaNacimiento, fechaActual).getYears();
	                mipaciente.setEdad(edad); // Asegúrate de que el método setEdad(int edad) esté definido en la clase Paciente
	            }
					
				this.cerrarConexion();
				return mipaciente;
			}
		} catch (Exception e) {
			System.out.println("error al obtener desde el modelo: "+e.getMessage());
			this.cerrarConexion();
			return null;
		}
		return mipaciente;		
	}	
}
