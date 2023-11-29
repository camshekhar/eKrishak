<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*, com.itextpdf.text.*, com.itextpdf.text.pdf.PdfWriter, java.io.FileOutputStream" %>

<%
DB_Connection connection = null;
boolean status = false, orderStatus = false;
ResultSet farmer = null, order = null, details = null;
String fname = "", lname = "", city = "", email = "", cnf_mobile = "", cropName = "", farmer_name = "";
int f_id = 0, order_id = 0, cropQuantity = 0;

try {
	connection = new DB_Connection();

	String orderDetails = "Select * from crop_order_details";
	order = connection.getRecords(orderDetails);

	if(order.next()) {
		order_id = order.getInt("order_id");
		System.out.println("Hello"+ order_id);
	}
	String fileName = "./test.pdf";
	Document document = new Document();

	PdfWriter.getInstance(document, new FileOutputStream(fileName));

	document.open();

	Paragraph paragraph = new Paragraph("hello" + order_id);
	document.add(paragraph);

	document.close();
	System.out.println("Finished");
	
	response.sendRedirect("farmerDashboard.jsp");
}

catch (Exception e) {
	System.out.println(e);
}
%>
