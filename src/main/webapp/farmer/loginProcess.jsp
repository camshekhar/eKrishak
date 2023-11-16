<%@page import="connection.*, java.sql.*"%> 
  
<%  
DB_Connection connection = null;

String mobile, password;

boolean status=false; 

mobile = request.getParameter("mobile");
password = request.getParameter("password");

try{  
	
connection = new DB_Connection(); 

String query = "Select * from farmer_details where f_contact="+ mobile +" and password='"+password+"'";

              
ResultSet rs = connection.getRecords(query);  
status=rs.next();

System.out.println(status); 


}catch(Exception e){
	System.out.println(e);
}finally {
	connection.closeConnection();
}

if(status){  
	session.setAttribute("f_mobile", mobile);  
	session.setAttribute("logMsg", "Login Successfull");
	response.sendRedirect("/eKrishak/farmer/farmerDashboard.jsp"); 
}  
else  
{  
	session.setAttribute("logMsg", "Login Unsuccessfull!");
	response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
}
%>  

  