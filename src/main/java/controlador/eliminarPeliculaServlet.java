package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PeliculaDAO;
import dao.PeliculaDAOImpl;

/**
 * Servlet implementation class eliminarPeliculaServlet
 */
@WebServlet("/eliminarPeliculaServlet")
public class eliminarPeliculaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PeliculaDAO peliculaDao = new PeliculaDAOImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public eliminarPeliculaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("inicio.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id_pelicula"));
		boolean eliminado = peliculaDao.eliminar(id);
	    response.sendRedirect("registroPeliculasServlet");
	}

}
