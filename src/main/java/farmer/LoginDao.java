package farmer;
import connection.*;
import java.sql.*;  

public class LoginDao {
	
	public static int mobile;
	static DB_Connection connection = null;
	  
	public static boolean validate(LoginUser bean){  
	boolean status=false;  
	try{  
		
	connection = new DB_Connection(); 
	String query = "Select * from farmer_details where f_contact="+ bean.getMobile() +" and password='"+bean.getPass()+"'";            
	ResultSet rs = connection.getRecords(query);  
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

