package Proyecto_SGM.models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Proyecto_SGM.beans.Cita;


public class CitaModel extends Conexion {

	protected CallableStatement cst;
	protected ResultSet rs;

	public List<Cita> obtenerCita(int id) {

		List<Cita> lista = new ArrayList<Cita>();

		try {

			String sql = "CALL sp_listarCitas(?)";
			this.cerrarConexion();
			cst = conexion.prepareCall(sql);
			cst.setInt(1, id);
			rs = cst.executeQuery();
			while (rs.next()) {

				Cita cita = new Cita();

				cita.setId(rs.getInt("id_cita"));
				cita.setId_paciente(rs.getInt("id_Paciente"));
				cita.setId_horario(rs.getInt("id_horario"));
				lista.add(cita);

			}

			return lista;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en obtener cita:" + e.getMessage());
		}

		return null;
	}

}
