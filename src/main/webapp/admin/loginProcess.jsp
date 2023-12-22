<%@page import="connection.*, java.sql.*"%> 
  
<%  
DB_Connection connection = null;
String email, password;
boolean status=false; 
email = request.getParameter("email");
password = request.getParameter("password");

try{  	
connection = new DB_Connection(); 
String query = "Select * from admin where email='"+email+"' and password='"+password+"'";            
ResultSet rs = connection.getRecords(query);  
status=rs.next();
if(status){  
	session.setAttribute("admin_email", email);  
	session.setAttribute("logMsg", "Login Successfull");
	response.sendRedirect("/eKrishak/admin/adminDashboard.jsp"); 
}  
else  
{  
	session.setAttribute("logMsg", "Invalid Credentials - Login Unsuccessfull!");
	response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
}

}catch(Exception e){
	System.out.println(e);
}finally {
	connection.closeConnection();
}


%>  

  