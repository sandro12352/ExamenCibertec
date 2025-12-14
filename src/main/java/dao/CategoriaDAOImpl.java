package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelo.Categoria;
import util.Conexion;

public class CategoriaDAOImpl implements CategoriaDAO{

	@Override
	public List<Categoria> listar() {
		List<Categoria> categorias = new ArrayList<>();
		String sql = "select * from tb_categoria";
		try {			
			Connection conn = Conexion.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Categoria c = new Categoria();
				c.setId_categoria(rs.getInt("id_categoria"));
				c.setNombre(rs.getString("nombre"));
				categorias.add(c);
			}
			
			
		} catch(Exception e) {
			System.out.println("Error al traer peliculas");
		}
		return categorias;
	}

}
