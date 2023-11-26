
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>

<%
int status = 0;
String id = (String) session.getAttribute("cr_id");
String f_id = (String) session.getAttribute("f_id");
DB_Connection connection = null;
ResultSet grains = null, pulses = null, legumes = null;

try {
	connection = new DB_Connection();
	String query = "UPDATE crop_details SET cr_sold="+1+", seller_id="+f_id+" WHERE cr_id="+id;
	status = connection.storeRecord(query);
}

catch (Exception e) {
}

if(status>0) {
	session.setAttribute("logMsg", "Crop sent for Purchase Approval.");
	response.sendRedirect("/eKrishak/farmer/farmerDashboard.jsp");
}else{
	session.setAttribute("logMsg", "Not able Sell this Crop.");
	response.sendRedirect("/eKrishak/farmer/sellCrops.jsp");
}
%>
