
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*" %>

<%
int status = 0;
String driver_id = (String) session.getAttribute("driver_id");
String farmer_id = (String) session.getAttribute("farmer_id");
DB_Connection connection = null;

try {
	connection = new DB_Connection();
	String query = "UPDATE driver_details SET booking_status='booked' WHERE driver_id="+driver_id;
	
	status = connection.storeRecord(query);
}

catch (Exception e) {
	System.out.println(e);
}

if(status>0) {
	String orderQuery = "UPDATE crop_order_details SET driver_id="+driver_id+" WHERE farmer_id="+farmer_id;
	connection.storeRecord(orderQuery);
	session.setAttribute("logMsg", "Booking Approved.");
	response.sendRedirect("/eKrishak/driver/driverDashboard.jsp");
}else{
	session.setAttribute("logMsg", "Not Able to Confirm.");
	response.sendRedirect("/eKrishak/driver/confirmBooking.jsp");
}
%>