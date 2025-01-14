package Proyecto_SGM.models;


import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Proyecto_SGM.beans.TipoPersonal;


public class TipoModel extends Conexion {
	
	protected CallableStatement cst;
	protected ResultSet rs;
	
	
	
	public List<TipoPersonal> listarTipo(){
		
		List<TipoPersonal>lista=new ArrayList<TipoPersonal>();
		
		try {
			
			String sql="CALL sp_listarTipoPersonal()";
			this.abrirConexion();
			cst=conexion.prepareCall(sql);
			rs=cst.executeQuery();
			
			while(rs.next()) {
				
				TipoPersonal tipo= new TipoPersonal();
				
				tipo.setId(rs.getInt("Id_Tipo_Personal"));
				tipo.setDescripcion(rs.getString("Tipo_Personal"));
				lista.add(tipo);
				
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
