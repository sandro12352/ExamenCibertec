package dao;

import java.util.List;

import modelo.Pelicula;

public interface PeliculaDAO {
	
	boolean agregar(Pelicula p);
	List<Pelicula> listar();
	boolean actualizar(Pelicula p);
	boolean eliminar(int id);
	List<Pelicula> listarPorCategoria(int id_categoria);
	Pelicula peliculaPorId(int id);
}
