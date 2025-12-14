package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PeliculaDAO;
import dao.PeliculaDAOImpl;
import modelo.Pelicula;

/**
 * Servlet implementation class registroPeliculasServlet
 */
@WebServlet("/registroPeliculasServlet")
public class registroPeliculasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PeliculaDAO peliculaDao = new PeliculaDAOImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registroPeliculasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Pelicula> peliculas = peliculaDao.listar();
		
		request.setAttribute("listaPeliculas",peliculas );
		
		request.getRequestDispatcher("registroPelicula.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
