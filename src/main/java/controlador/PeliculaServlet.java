package controlador;

import java.awt.datatransfer.SystemFlavorMap;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Pelicula;

/**
 * Servlet implementation class PeliculaServlet
 */
@WebServlet("/PeliculaServlet")
public class PeliculaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final List<Pelicula> peliculas = new ArrayList<>();
	private static int idCounter =1;   
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
		// TODO Auto-generated method stub
		request.setAttribute("listaPeliculas", peliculas);
		request.getRequestDispatcher("listaPeliculas.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Se ejecuto el POST");
		System.out.println(request.getParameter("titulo"));
		//int id_pelicula =Integer.parseInt(request.getParameter("id_pelicula"));
		String titulo = request.getParameter("titulo");
		String descripcion = request.getParameter("descripcion");
		int duracion =Integer.parseInt( request.getParameter("duracion"));
		String url_portada = request.getParameter("url_portada");
		int anio = Integer.parseInt(request.getParameter("anio"));
		double precio_alquiler =Double.parseDouble(request.getParameter("precio_alquiler"));

		Pelicula nuevaPelicula = new Pelicula(idCounter,titulo,descripcion,duracion,url_portada,anio,precio_alquiler);
		peliculas.add(nuevaPelicula);
		idCounter++;
		response.sendRedirect("PeliculaServlet");
	}

}
