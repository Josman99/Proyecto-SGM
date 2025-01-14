package Proyecto_SGM.models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Proyecto_SGM.beans.Especialidad;


public class EspecialidadModel extends Conexion{
	
	
	protected CallableStatement cst;
	protected ResultSet rs;
	
	
	
	public List<Especialidad> listarEspecialidad(){
		
		List<Especialidad>lista=new ArrayList<Especialidad>();
		
		try {
			
			String sql="CALL sp_listarEspecialidad()";
			this.abrirConexion();
			cst=conexion.prepareCall(sql);
			rs=cst.executeQuery();
			
			while(rs.next()) {
				
				Especialidad espe= new Especialidad();
				
				espe.setId(rs.getInt("Id_Especialidades"));
				espe.setDescripcion(rs.getString("Especialidad"));
				lista.add(espe);
				
			}
			this.cerrarConexion();
			return lista;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error al listar tipo :"+e.getMessage());
		}
		
		return null;
		
		
		
	}
	
	
	

}
