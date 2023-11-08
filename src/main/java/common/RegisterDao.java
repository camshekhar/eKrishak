package common;
import connection.*;
import java.sql.*;  
import java.util.Random;

public class RegisterDao {
	public static int register(User u){  
		int status=0;  
		
		Random rand = new Random();
		int id = rand.nextInt(3, 10000);
		try{  
		DB_Connection connection = new DB_Connection(); 
		
		Connection con =  connection.get_connection();
		
	PreparedStatement ps = con.prepareStatement("insert into farmer_details(id, first_name, last_name, f_locality, f_city, f_state, f_pincode, f_email, f_contact, password ) values(?,?,?,?,?,?,?,?,?,?)");  
		
		ps.setInt(1, id);
		ps.setString(2,u.getFname()); 
		ps.setString(3,u.getLname()); 
		ps.setString(4,u.getLocality()); 
		ps.setString(5,u.getCity()); 
		ps.setString(6,u.getState()); 
		ps.setInt(7, u.getPincode());
		ps.setString(8,u.getEmail());
		ps.setInt(9,u.getMobile());  
		ps.setString(10,u.getPassword()); 
		
		              
		status=ps.executeUpdate();  
		
		System.out.println(ps);
		con.close();
		
		}catch(Exception e){
			System.out.println(e);
		  
		
		}  
		
		return status;  
	}
}