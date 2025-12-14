package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//mysql://root:DvOWPZvvofNoHMZzEayZeWljjAkZyexC@maglev.proxy.rlwy.net:27808/BD_PACHAS

public class Conexion {
	private static final String URL = "jdbc:mysql://maglev.proxy.rlwy.net:27808/BD_PACHAS";
	private static final String USER= "root";
	private static final String PASSWORD = "DvOWPZvvofNoHMZzEayZeWljjAkZyexC";
	
	public static Connection getConnection() {
		Connection conn = null;
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("Coneción exitosa");
		}catch (ClassNotFoundException | SQLException e) {
			System.out.println("Error al conectar la base de datos");
			e.printStackTrace();
		}
		
		return conn;
		
	} 
}
