<%@page import="connection.*, java.util.Random" import="java.sql.*"%>


<%
String first_name, last_name, f_locality, f_city, f_state, f_pincode, f_email, f_contact, password;
int status = 0;

DB_Connection con = null;

Random rand = new Random();
int id = rand.nextInt(10, 10000);
ResultSet rs = null;

first_name = request.getParameter("fname");
last_name = request.getParameter("lname");
f_locality = request.getParameter("locality");
f_city = request.getParameter("city");
f_state = request.getParameter("state");
f_pincode = request.getParameter("pincode");
f_email = request.getParameter("email");
f_contact = request.getParameter("mobile");
password = request.getParameter("password");

try {
	con = new DB_Connection();
	String valid = "Select f_contact from farmer_details where f_contact="+f_contact;
	rs = con.getRecords(valid);
	
	if(rs.next()){
		session.setAttribute("duplicate", "Farmer with this Mobile is Already Exists..");
		response.sendRedirect("/eKrishak/farmer/farmerSignup.jsp");
	}
	else{
		String query = "insert into farmer_details(id, first_name, last_name, f_locality, f_city, f_state, f_pincode, f_email, f_contact, password) values("
		+ id + ",'" + first_name + "','" + last_name + "','" + f_locality + "','" + f_city + "','" + f_state + "',"
		+ f_pincode + ",'" + f_email + "'," + f_contact + ",'" + password + "')";
		status = con.storeRecord(query);
		if (status > 0){
			session.setAttribute("success", "Your Registration is Successful.");
			response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
		}
	}

} catch (Exception e) {
	System.out.println(e);

}


%>

