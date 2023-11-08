package common;
import connection.*;
import java.sql.*;  

public class LoginDao {
	
	public static int mobile;
 
	  
	public static boolean validate(LoginUser bean){  
	boolean status=false;  
	try{  
		
	DB_Connection connection = new DB_Connection(); 
		
	Connection con =  connection.get_connection();  
	              
	PreparedStatement ps=con.prepareStatement(  
	    "Select * from farmer_details where f_contact=? and password=?");  
	  
	ps.setInt(1,bean.getMobile());  
	ps.setString(2, bean.getPass());  
	              
	ResultSet rs = ps.executeQuery();  
//	System.out.println(rs);
	status=rs.next();  
//	System.out.println(status); 
	
	if(status == true) {
		mobile = bean.getMobile();
	}
	}catch(Exception e){
		System.out.println(e);
	}  
	  
	return status;  
	  
	}  
}  

