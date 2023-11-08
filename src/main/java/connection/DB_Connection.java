package connection;
import java.sql.Connection;
import java.sql.DriverManager;

public class DB_Connection {
	
	
	public static void main(String[] args) {
		DB_Connection db_obj = new DB_Connection();
		System.out.println(db_obj.get_connection());
	}
	
	public Connection get_connection() {
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Default class in java to load drivers in java for DB connectivity.
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ekrishak", "root", "admin123");
		}
		catch (Exception e){
			System.out.println(e);
		}
		
		return con;
	}
}
