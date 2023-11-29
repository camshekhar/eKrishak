<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*, java.util.Random" %>

<%

DB_Connection connection = null;
int status = 0;
String name = "", mobile = "", subject = "", message = "";
int id = 0;

name = request.getParameter("name");
mobile = request.getParameter("mobile");
subject = request.getParameter("subject");
message = request.getParameter("message");

try {
	
	Random randNum = new Random();
	
	id = randNum.nextInt(101, 1000);

	connection = new DB_Connection();

	String query = "insert into support_feedback(id, name, mobile, subject, message) values(" + id
			+ ",'" + name + "','" + mobile + "','" + subject + "', '"+ message +"')";
	
	status = connection.storeRecord(query);


	if (status > 0) {
		session.setAttribute("contact_msg", "Thank You for Contacing Us. We will get back to you soon.");
		response.sendRedirect("/eKrishak/contactUs.jsp");
	}

	else {
		session.setAttribute("error", "One or more field is enterd wrong.");
		response.sendRedirect("farmerLogin.jsp");
	}
	
	

}

catch (Exception e) {
}
%>