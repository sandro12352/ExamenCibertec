package controlador;

import java.awt.datatransfer.SystemFlavorMap;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoriaDAO;
import dao.CategoriaDAOImpl;
import dao.PeliculaDAO;
import dao.PeliculaDAOImpl;
import modelo.Categoria;
import modelo.Pelicula;

/**
 * Servlet implementation class PeliculaServlet
 */
@WebServlet("/PeliculaServlet")
public class PeliculaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PeliculaDAO peliculaDao = new PeliculaDAOImpl();
	CategoriaDAO categoriaDao = new CategoriaDAOImpl();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeliculaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 List<Pelicula> peliculas = peliculaDao.listar(); // método que hace JOIN con categoría

	    peliculas.sort(Comparator.comparing(Pelicula::getNombreCategoria));

		    request.setAttribute("peliculas", peliculas);
		    request.getRequestDispatcher("inicio.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
	    
	    int id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
	    String titulo = request.getParameter("titulo");
	    String descripcion = request.getParameter("descripcion");
	    int duracion = Integer.parseInt(request.getParameter("duracion"));
	    String url_portada = request.getParameter("url_portada");
	    int anio = Integer.parseInt(request.getParameter("anio"));
	    
	    if ("agregar".equals(accion)) {
	        Pelicula nuevaPelicula = new Pelicula(id_categoria, titulo, descripcion,
	                                               duracion, url_portada, anio);
	        peliculaDao.agregar(nuevaPelicula);
	        
	    } else if ("actualizar".equals(accion)) {
	        int id_pelicula = Integer.parseInt(request.getParameter("id_pelicula"));
	        
	        System.out.println("Actualizando película ID: " + id_pelicula);
	        System.out.println("Con categoría ID: " + id_categoria);
	        
	        Pelicula pelicula = new Pelicula(id_pelicula, id_categoria, titulo, 
	                                         descripcion, duracion, url_portada, anio);
	        boolean actualizado = peliculaDao.actualizar(pelicula);
	        System.out.println("Resultado actualización: " + actualizado);
	    }
	    
	    response.sendRedirect("registroPeliculasServlet");
    
	}

}
