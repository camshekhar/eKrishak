package vendor;
import connection.*;
import java.sql.*;  
import java.util.Random;

public class RegisterDao {
	public static int register(User u){  
		int status=0;  
		
		Random rand = new Random();
		int id = rand.nextInt(1, 10000);
		try{  
		DB_Connection connection = new DB_Connection(); 
		
		Connection con =  connection.get_connection();
		
	
		
PreparedStatement ps = con.prepareStatement("insert into vendor_details(ven_id, first_name, last_name, ven_locality, ven_city, ven_pincode, contact_no, ven_state, vendor_email, password ) values(?,?,?,?,?,?,?,?,?,?)");  
		
		ps.setInt(1, id);
		ps.setString(2,u.getFname()); 
		ps.setString(3,u.getLname()); 
		ps.setString(4,u.getLocality()); 
		ps.setString(5,u.getCity()); 
		ps.setInt(6,u.getPincode()); 
		ps.setInt(7,u.getMobile());  
		ps.setString(8, u.getState());
		ps.setString(9,u.getEmail());

		ps.setString(10,u.getPassword());               
		status=ps.executeUpdate();  
		con.close();
		
		}catch(Exception e){
			System.out.println(e);
		  
		
		}  
		
		return status;  
	}
}