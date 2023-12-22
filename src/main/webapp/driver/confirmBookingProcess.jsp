
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*, java.util.Date" %>

<%
int status = 0, status2 = 0;
String driver_id = (String) session.getAttribute("driver_id");
String farmer_id = (String) session.getAttribute("farmer_id");
int order_id = (Integer) session.getAttribute("order_id");
Date dt = new Date();

DB_Connection connection = null;

try {
	connection = new DB_Connection();
	String orderQuery = "UPDATE crop_order_details SET crop_order_details.driver_id="+driver_id+" where order_id="+order_id;

	status = connection.storeRecord(orderQuery);
	System.out.println(status);
	if(status>0) {
		String query = "UPDATE driver_details SET booking_status='booked' WHERE driver_id="+driver_id;
		
		status2 = connection.storeRecord(query);
		
		if(status2>0){
			session.setAttribute("logMsg", "Booking Approved.");
			response.sendRedirect("/eKrishak/driver/driverDashboard.jsp");
		}
		else{
			session.setAttribute("logMsg", "Not Able to Confirm.");
			response.sendRedirect("/eKrishak/driver/confirmBooking.jsp");
		}
	}
}

catch (Exception e) {
	System.out.println(e);
}


%>