<%@page import="connection.*, java.util.Random" import="java.sql.*"%>


<%
String d_name, d_locality, d_city, d_state, d_pincode, d_contact, password, vehicle_type;
int status = 0;
DB_Connection con = null;
ResultSet rs = null;

Random rand = new Random();
int id = rand.nextInt(10, 10000);

d_name = request.getParameter("dname");
d_locality = request.getParameter("locality");
d_city = request.getParameter("city");
d_state = request.getParameter("state");
d_pincode = request.getParameter("pincode");
vehicle_type = request.getParameter("vehicle_type");
d_contact = request.getParameter("mobile");
password = request.getParameter("password");

try {
	con = new DB_Connection();
	String valid = "Select driver_contact from driver_details where driver_contact="+d_contact;
	rs = con.getRecords(valid);
	
	if(rs.next()){
		session.setAttribute("duplicate", "Driver with this Mobile is Already Exists..");
		response.sendRedirect("/eKrishak/driver/driverSignup.jsp");
	}else{
		String query = "insert into driver_details(driver_id, driver_name, driver_contact, password, vehicle_type, driver_state, driver_city, driver_pincode, driver_locality) values("
				+ id + ",'" + d_name + "','" + d_contact + "','" + password + "','" + vehicle_type + "','" + d_state + "', '"
				+ d_city + "', " + d_pincode + ", '" + d_locality + "')";
		
		status = con.storeRecord(query);
		if (status > 0){
			session.setAttribute("success", "Your Registration is Successful.");
			response.sendRedirect("/eKrishak/driver/driverLogin.jsp");
		}
	}
} catch (Exception e) {
	System.out.println(e);

}

%>

