<%@page import="connection.*, java.sql.*"%> 
  
<%  
DB_Connection connection = null;
String mobile, password;
boolean status=false; 
mobile = request.getParameter("mobile");
password = request.getParameter("password");

try{  
connection = new DB_Connection(); 
String query = "Select * from vendor_details where ven_contact="+ mobile +" and password='"+password+"'";           
ResultSet rs = connection.getRecords(query);  
status=rs.next();

}catch(Exception e){
	System.out.println(e);
}finally {
	connection.closeConnection();
}

if(status == true){
	session.setAttribute("logMsg", "Login Successfull");
	session.setAttribute("ven_mobile",mobile);
	response.sendRedirect("/eKrishak/vendor/vendorDashboard.jsp"); 
}
 
else  
{  
	session.setAttribute("logMsg", "Invalid Credentials - Login Unsuccessfull!");
	response.sendRedirect("/eKrishak/vendor/vendorLogin.jsp");
}

%>  
 