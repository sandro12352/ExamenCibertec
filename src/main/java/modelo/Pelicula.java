package modelo;

public class Pelicula {
	private int id_pelicula;
	private int id_categoria;
	private String titulo;
	private String descripcion;
	private int duracion;
	private String url_portada;
	private int anio;
	private String nombreCategoria;

	
	public Pelicula() {
	}

	public Pelicula(int id_categoria, String titulo, String descripcion, int duracion, String url_portada, int anio) {
		this.id_categoria = id_categoria;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.duracion = duracion;
		this.url_portada = url_portada;
		this.anio = anio;
	}

	public Pelicula(int id_pelicula,int id_categoria, String titulo, String descripcion, int duracion, String url_portada, int anio) {
		this.id_pelicula = id_pelicula;
		this.id_categoria = id_categoria; 
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.duracion = duracion;
		this.url_portada = url_portada;
		this.anio = anio;
	}

	public int getId_pelicula() {
		return id_pelicula;
	}
	

	public String getNombreCategoria() {
		return nombreCategoria;
	}

	public void setNombreCategoria(String nombreCategoria) {
		this.nombreCategoria = nombreCategoria;
	}


	public int getId_categoria() {
		return id_categoria;
	}

	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}

	public String getTitulo() {
		return titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public int getDuracion() {
		return duracion;
	}

	public String getUrl_portada() {
		return url_portada;
	}

	public int getAnio() {
		return anio;
	}

	public void setId_pelicula(int id_pelicula) {
		this.id_pelicula = id_pelicula;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

	public void setUrl_portada(String url_portada) {
		this.url_portada = url_portada;
	}

	public void setAnio(int anio) {
		this.anio = anio;
	}
	
	
	
}
