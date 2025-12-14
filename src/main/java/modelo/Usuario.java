package modelo;

public class Usuario {
	private int id_usuario;
	private String usuario;
	private String password;
	private String email;
	private int estado;
	
	public Usuario() {}
	
	public Usuario(String usuario, String password, String email, int estado) {
		this.usuario = usuario;
		this.password = password;
		this.email = email;
		this.estado = estado;
	}


	public Usuario(int id_usuario, String usuario, String password, String email, int estado) {
		this.id_usuario = id_usuario;
		this.usuario = usuario;
		this.password = password;
		this.email = email;
		this.estado = estado;
	}
	
	
	public int getId_usuario() {
		return id_usuario;
	}
	public String getUsuario() {
		return usuario;
	}
	public String getPassword() {
		return password;
	}
	public String getEmail() {
		return email;
	}
	public int getEstado() {
		return estado;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
}
