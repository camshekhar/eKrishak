package vendor;
import connection.*;
import java.sql.*;  

public class LoginDao {
	static DB_Connection connection = null;
	public static int mobile;
	
	  
	public static boolean validate(LoginUser bean) throws SQLException{  
	boolean status=false;  
	
	try{  
		
	connection = new DB_Connection(); 
	
	String query = "Select * from vendor_details where contact_no="+ bean.getMobile() +" and password='"+bean.getPass()+"'";
	
	              
	ResultSet rs = connection.getRecords(query);  
	status=rs.next();
	
	System.out.println(status); 
	
	if(status == true) {
	 
		mobile = bean.getMobile();
	}
	
	}catch(Exception e){
		System.out.println(e);
	}finally {
		connection.closeConnection();
	}
	  
	return status;  
	  
	}  
}  

