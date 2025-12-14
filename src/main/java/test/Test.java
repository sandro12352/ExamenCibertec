package test;


import java.sql.Connection;

import util.Conexion;

public class Test {

	public static void main(String[] args) {
		Conexion c = new Conexion();
		Connection conn = c.getConnection();
		
		
	}

}
