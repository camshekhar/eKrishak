<%@page import="connection.*, java.util.Random"%>  

  
<%  
String first_name, last_name, ven_locality, ven_city, ven_pincode, ven_contact, ven_state, ven_email, password;
int status=0; 




DB_Connection con = null;

Random rand = new Random();
int id = rand.nextInt(10, 10000);

first_name = request.getParameter("fname");
last_name = request.getParameter("lname");
ven_locality = request.getParameter("locality");
ven_city = request.getParameter("city");
ven_state = request.getParameter("state");
ven_pincode = request.getParameter("pincode");
ven_email = request.getParameter("email");
ven_contact = request.getParameter("mobile");
password = request.getParameter("password");

try{  
	con = new DB_Connection();
	String query = "insert into vendor_details(ven_id, first_name, last_name, ven_locality, ven_city, ven_pincode, ven_contact, "
			+ "ven_state, ven_email, password) values("+id+",'"+first_name+"','"+last_name+"','"+ven_locality+"','"+ven_city+"',"+ven_pincode+","+ven_contact+", '"+ven_state+"','"+ven_email+"','"+password+"')";
	status = con.storeRecord(query);

	

}catch(Exception e){
	System.out.println(e);
  

}
if(status>0) 
	session.setAttribute("success", "Your Registration is Successful.");
	response.sendRedirect("/eKrishak/vendor/vendorLogin.jsp");

%>  

