package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelo.Pelicula;
import util.Conexion;

public class PeliculaDAOImpl implements PeliculaDAO {

	@Override
	public boolean agregar(Pelicula p) {
		// TODO Auto-generated method stub
		try {
			String sql = "insert into tb_pelicula(id_categoria,titulo,descripcion,duracion,url_portada,anio) values(?,?,?,?,?,?)";
			Connection conn = Conexion.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, p.getId_categoria());
			ps.setString(2, p.getTitulo());
			ps.setString(3, p.getDescripcion());
			ps.setInt(4, p.getDuracion());
			ps.setString(5, p.getUrl_portada());
			ps.setInt(6, p.getAnio());
			
			return ps.execute();
			
		}catch (Exception e) {
			System.out.print(e);
		}
		return false;
	}

	@Override
	public List<Pelicula> listar() {
		List<Pelicula> peliculas = new ArrayList<>();
		String sql = "SELECT p.*, c.nombre AS nombre_categoria FROM tb_pelicula p INNER JOIN tb_categoria c ON p.id_categoria = c.id_categoria";
		try {			
			Connection conn = Conexion.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Pelicula p = new Pelicula();
				p.setId_pelicula(rs.getInt("id_pelicula"));
				p.setId_categoria(rs.getInt("id_categoria"));;
				p.setTitulo(rs.getString("titulo"));
				p.setDescripcion(rs.getString("descripcion"));
				p.setDuracion(rs.getInt("duracion"));
				p.setUrl_portada(rs.getString("url_portada"));
				p.setAnio(rs.getInt("anio"));
				p.setNombreCategoria(rs.getString("nombre_categoria"));
				peliculas.add(p);
			}
			
			
		} catch(Exception e) {
			System.out.println("Error al traer peliculas" + e);
		}
		return peliculas;
	}

	@Override
	public boolean actualizar(Pelicula p) {
		try {
			String sql = "update tb_pelicula set id_categoria = ?, titulo = ?, descripcion = ?, duracion = ?, url_portada = ?, anio = ? where id_pelicula = ?";
			Connection conn = Conexion.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, p.getId_categoria());
        	ps.setString(2, p.getTitulo());
	        ps.setString(3, p.getDescripcion());
	        ps.setInt(4, p.getDuracion());
	        ps.setString(5, p.getUrl_portada());
	        ps.setInt(6, p.getAnio());
	        ps.setInt(7, p.getId_pelicula());
	        int filasAfectadas = ps.executeUpdate(); 
	        return filasAfectadas > 0;
			
		}catch (Exception e) {
			System.out.print(e);
		}
		return false;
	}

	@Override
	public boolean eliminar(int id) {
		String sql = "delete from tb_pelicula where id_pelicula = ?";
		try {			
			Connection conn = Conexion.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int filasAfectadas = ps.executeUpdate();
			return filasAfectadas > 0;
			
		} catch(Exception e) {
			System.out.println("Error al traer peliculas por categoria");
		}
		return false;
	}

	@Override
	public List<Pelicula> listarPorCategoria(int id_categoria) {
		List<Pelicula> peliculasporCategoria = new ArrayList<>();
		String sql = "select p.* ,c.nombre as categoria from tb_pelicula p inner join tb_categoria c on p.id_categoria = c.id_categoria where c.id_categoria =?";
		try {			
			Connection conn = Conexion.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id_categoria);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Pelicula p = new Pelicula();
	            p.setId_pelicula(rs.getInt("id_pelicula"));
	            p.setId_categoria(rs.getInt("id_categoria"));
	            p.setTitulo(rs.getString("titulo"));
	            p.setDescripcion(rs.getString("descripcion"));
	            p.setDuracion(rs.getInt("duracion"));
	            p.setUrl_portada(rs.getString("url_portada"));
	            p.setAnio(rs.getInt("anio"));
	            p.setNombreCategoria(rs.getString("categoria"));
	            peliculasporCategoria.add(p);
			}
			
			
		} catch(Exception e) {
			System.out.println("Error al traer peliculas por categoria");
		}
		return peliculasporCategoria;
	}

	@Override
	public Pelicula peliculaPorId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
