package Proyecto_SGM.models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Proyecto_SGM.beans.Paciente;
import Proyecto_SGM.beans.PersonalMedico;


public class PersonalMedicoModel extends Conexion {

	protected CallableStatement cst;
	protected ResultSet rs;

	public List<PersonalMedico> ListarPersonalMedico() {

		List<PersonalMedico> lista = new ArrayList<PersonalMedico>();

		try {

			String sql = "CALL sp_listarPersonal()";
			this.abrirConexion();
			cst = conexion.prepareCall(sql);
			rs = cst.executeQuery();

			while (rs.next()) {

				PersonalMedico personal = new PersonalMedico();

				personal.setId(rs.getInt("Id_Personal_Medico"));
				personal.setDni(rs.getString("Dni_Personal_Medico"));
				personal.setNombre(rs.getString("Nombres_Personal_Medico"));
				personal.setApellido(rs.getString("Apellidos_Personal_Medico"));
				personal.setFechaN(rs.getDate("FechaNacimiento_Personal_Medico"));
				personal.setDireccion(rs.getString("Direccion_Personal_Medico"));
				personal.setTelefono(rs.getString("Telefono_Personal_Medico"));
				personal.setNumeroCole(rs.getString("Numero_Colegiatura"));
				personal.setPersonal(rs.getString("Tipo_Personal"));
				personal.setEspecialidad(rs.getString("Especialidad"));

				lista.add(personal);

			}
			this.cerrarConexion();

			return lista;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error en listar Personal Medico 1:" + e.getMessage());
		}

		return null;

	}

	public int InsertarPersonalMedico(PersonalMedico personal) {

		try {

			int filas = 0;
			String sql = "CALL sp_insertarPersonalMedico(?,?,?,?,?,?,?,?,?)";
			this.abrirConexion();
			cst = conexion.prepareCall(sql);
			cst.setString(1, personal.getDni());
			cst.setString(2, personal.getNombre());
			cst.setString(3, personal.getApellido());
			cst.setDate(4, personal.getFechaN());
			cst.setString(5, personal.getDireccion());
			cst.setString(6, personal.getTelefono());
			cst.setString(7, personal.getNumeroCole());
			cst.setInt(8, personal.getIdpersonal());
			cst.setInt(9, personal.getIdespecialidad());
			filas = cst.executeUpdate();

			return filas;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error al insertar Personal Medico 1:" + e.getMessage());
		}

		return 0;

	}
	
	public PersonalMedico obtenerPersonalMed(int idPersoMedi) throws SQLException{
		PersonalMedico mipersonalm = new PersonalMedico();
		try {
			String sql ="CALL sp_listarPersonalId(?)";
			this.abrirConexion();
			cst = conexion.prepareCall(sql);
			cst.setInt(1, idPersoMedi);
			rs = cst.executeQuery();
			if (rs.next()) {
				mipersonalm.setId(rs.getInt("Id_Personal_Medico"));
				mipersonalm.setDni(rs.getString("Dni_Personal_Medico"));
				mipersonalm.setNombre(rs.getString("Nombres_Personal_Medico"));
				mipersonalm.setApellido(rs.getString("Apellidos_Personal_Medico"));
				mipersonalm.setFechaN(rs.getDate("FechaNacimiento_Personal_Medico"));
				mipersonalm.setDireccion(rs.getString("Direccion_Personal_Medico"));
				mipersonalm.setTelefono(rs.getString("Telefono_Personal_Medico"));
				mipersonalm.setNumeroCole(rs.getString("Numero_Colegiatura"));
				mipersonalm.setPersonal(rs.getString("Tipo_Personal"));
				mipersonalm.setEspecialidad(rs.getString("Especialidad"));
				this.cerrarConexion();
				return mipersonalm;
			}
		} catch (Exception e) {
			System.out.println("error al obtener desde el modelo: "+e.getMessage());
			this.cerrarConexion();
			return null;
		}
		return mipersonalm;		
	}	
	public int modificarPersonalMedico(PersonalMedico personalM) throws SQLException{
		try {
			int filasAfectadas=0; 
			String sql = "CALL sp_modificarPersonalM(?,?,?,?,?,?,?,?,?,?)";
			this.abrirConexion();
			cst = conexion.prepareCall(sql);
			cst.setInt(1, personalM.getId());
			cst.setString(2, personalM.getDni());
			cst.setString(3, personalM.getNombre());
			cst.setString(4, personalM.getApellido());
			cst.setDate(5, personalM.getFechaN());
			cst.setString(6, personalM.getDireccion());
			cst.setString(7, personalM.getTelefono());
			cst.setString(8, personalM.getNumeroCole());
			cst.setInt(9, personalM.getIdpersonal());
			cst.setInt(10, personalM.getIdespecialidad());
			filasAfectadas = cst.executeUpdate();
			return filasAfectadas;
		} catch (Exception e) {
			System.out.println("error al insertar en el modelo: "+e.getMessage());
			return 0;
		}
	}
	public int eliminarPersonalMedico(int idPersonalM) throws SQLException{
		try {
			int filasAfectadas=0;
			String sql ="CALL sp_eliminarPersonalM(?)";
			this.abrirConexion();
			cst = conexion.prepareCall(sql);
			cst.setInt(1, idPersonalM);
			filasAfectadas = cst.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;
		} catch (Exception e) {
			System.out.println("error al obtener desde el modelo: "+e.getMessage());
			return 0;
		}	
	}	

}
