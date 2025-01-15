package Proyecto_SGM.models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Proyecto_SGM.beans.Intervalo;

public class IntervaloModel extends Conexion{
	
	protected CallableStatement cst;
	protected ResultSet rs;
	
	
	public List<Intervalo> listarintervalos(int id){
		List<Intervalo>lista=new ArrayList<Intervalo>();
		
		try {
			
			String sql="CALL sp_listarIntervalos(?)";
			this.abrirConexion();
			cst=conexion.prepareCall(sql);
			cst.setInt(1, id);
			rs=cst.executeQuery();
			
			while(rs.next()) {
				
				Intervalo inter=new Intervalo();
				
				inter.setId(rs.getInt("id_intervalos"));
				inter.setHora(rs.getString("Hora"));
				lista.add(inter);
				
			}
			
			return lista;
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en listar intervalos:"+e.getMessage());
		}
		
		return null;
		
		
	}
	
	
	
	

}
