package modelo;

public class Pelicula {
	private int id_pelicula;
	private String titulo;
	private String descripcion;
	private int duracion;
	private String url_portada;
	private int anio;
	private double precio_alquiler;
	
	public Pelicula(int id_pelicula, String titulo, String descripcion, int duracion, String url_portada, int anio,
			double precio_alquiler) {
		this.id_pelicula = id_pelicula;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.duracion = duracion;
		this.url_portada = url_portada;
		this.anio = anio;
		this.precio_alquiler = precio_alquiler;
	}

	public int getId_pelicula() {
		return id_pelicula;
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

	public double getPrecio_alquiler() {
		return precio_alquiler;
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

	public void setPrecio_alquiler(double precio_alquiler) {
		this.precio_alquiler = precio_alquiler;
	}
	
	
	
}
