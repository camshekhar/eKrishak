<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="connection.* , java.sql.*, java.util.Random"%>

<%
String cr_quant, id ="", cr_name, cr_price, cr_type, cr_img;

int status = 0;
Random random = new Random();
int cr_id = random.nextInt(1, 10000);

id = (String) session.getAttribute("id");

cr_name = request.getParameter("cr_name");
cr_quant = request.getParameter("cr_quant");
cr_price = request.getParameter("cr_price");
cr_type = request.getParameter("cr_type");
cr_img = "../assets/img/"+request.getParameter("cr_img");

System.out.println(cr_name);
System.out.println(cr_quant);
System.out.println(cr_price);
System.out.println(cr_type);
System.out.println(cr_img);

// 	String[] Crops_Types = {null, null, "Grains", "Pulses", "Legumes"};
// 	for(int i = 2; i < Crops_Types.length; i++){
// 		if( i == cr_type ){
// 			crop_type = Crops_Types[i];
// 		}
// 	}
try {
	DB_Connection con = new DB_Connection();
	String query = "insert into crop_details(cr_id, cr_name, cr_type, cr_quantity, cr_price, user_id, cr_img) values(" + cr_id
	+ ",'" + cr_name + "','" + cr_type + "'," + Integer.parseInt(cr_quant) + "," + Integer.parseInt(cr_price)
	+ "," + Integer.parseInt(id) + ", '"+ cr_img +"')";
	con.storeRecord(query);
	status = 1;
} catch (Exception e) {
	System.out.println(e.getMessage());

}

if (status == 1) {
	if (session.getAttribute("user").equals("Vendor")) {
		session.setAttribute("logMsg", "Crop Added Successfully");
		response.sendRedirect("/eKrishak/vendor/vendorDashboard.jsp");
	} else {
		session.setAttribute("logMsg", "Crop Added Successfully");
		response.sendRedirect("/eKrishak/farmer/farmerDashboard.jsp");
	}
}
%>