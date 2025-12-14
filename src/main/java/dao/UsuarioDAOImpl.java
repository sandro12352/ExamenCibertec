package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.Conexion;

public class UsuarioDAOImpl implements UsuarioDAO{

	@Override
	public boolean existeUsuario(String usuario, String password) {

		try {
			String sql = "select*from tb_usuario where usuario=? and password = ?" ;
			Connection conn = Conexion.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,usuario);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			return rs.next();
					
			
		}catch(Exception e){
			System.out.println(e);
		}
		
		return false;
		
	}

}
