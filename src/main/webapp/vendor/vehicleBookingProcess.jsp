
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*" %>

<%
int status = 0;
String driver_id = (String) session.getAttribute("driver_id");
DB_Connection connection = null;

try {
	connection = new DB_Connection();
	String query = "UPDATE driver_details SET booking_status='pending' WHERE driver_id="+driver_id;
	status = connection.storeRecord(query);
}

catch (Exception e) {
	System.out.println(e);
}

if(status>0) {
	session.setAttribute("logMsg", "Bookking Request Sent.");
	response.sendRedirect("/eKrishak/vendor/vendorDashboard.jsp");
}else{
	session.setAttribute("logMsg", "Not Able to Book.");
	response.sendRedirect("/eKrishak/vendor/bookVehicle.jsp");
}
%>