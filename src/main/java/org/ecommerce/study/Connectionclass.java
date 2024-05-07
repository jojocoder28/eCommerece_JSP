package org.ecommerce.study;
import java.sql.*;
public class Connectionclass {
	static Connection con;
	public static Connection createC() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","xe","xe");
		}catch(Exception e) {}
		return con;
	}
}
