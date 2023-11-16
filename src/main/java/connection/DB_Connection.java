package connection;

import java.sql.*;

public class DB_Connection {

	Connection con = null;

	public ResultSet getRecords(String query) throws SQLException {
		ResultSet rs = null;
		try {
			get_connection();
			PreparedStatement ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			System.out.println(e);
		} 
		return rs;
	}

	public void closeConnection() throws SQLException {
		con.close();
	}
	
	// Storing Details in DataBase.
	public int storeRecord(String query) {
		int status = 0;

		try {
			get_connection();
			PreparedStatement ps = con.prepareStatement(query);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);

		}

		return status;

	}

//	public static void main(String[] args) throws SQLException {
//		DB_Connection db_obj = new DB_Connection();
//		System.out.println(db_obj.get_connection());
//	}
//	

	private void get_connection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Default class in java to load drivers in java for DB
														// connectivity.

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ekrishak", "root", "admin123");
		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
