
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*, java.util.Random" %>

<%
int status = 0, orderStatus = 0;
String id = (String) session.getAttribute("cr_id");
String vendor_id = (String) session.getAttribute("ven_id");
DB_Connection connection = null;
ResultSet rs = null;
boolean crop_status = false;
ResultSet grains = null, pulses = null, legumes = null;
Random rand = new Random();
int order_id = rand.nextInt(10, 10000);
int crop_id = 0, farmer_id = 0, cr_price = 0, cr_quant = 0, order_amount = 0, approved = 0;

try {
	connection = new DB_Connection();
	String query = "UPDATE crop_details SET buyer_id="+vendor_id+" WHERE cr_id="+id;
	status = connection.storeRecord(query);
	String getCropQuery = "SELECT * from crop_details WHERE cr_id="+id;
	rs = connection.getRecords(getCropQuery);
	if(rs.next()){
		cr_price = rs.getInt("cr_price");
		cr_quant = rs.getInt("cr_quantity");
		farmer_id = rs.getInt("seller_id");	
	}
	
	approved = 1;
	crop_id = Integer.parseInt(id);
	order_amount = cr_quant * cr_price;
	String orderQuery = "insert into crop_order_details(order_id, crop_id, farmer_id, vendor_id, driver_id, order_amount, approved) values("+order_id+","+crop_id+","+farmer_id+","+Integer.parseInt(vendor_id)+","+null+","+order_amount+", "+approved+")";
	orderStatus = connection.storeRecord(orderQuery);
	session.setAttribute("farmer_id", Integer.toString(farmer_id));
}

catch (Exception e) {
	System.out.println(e);
}

if(status>0) {
	session.setAttribute("logMsg", "Purchase Approved.");
	response.sendRedirect("/eKrishak/vendor/vendorDashboard.jsp");
}else{
	session.setAttribute("logMsg", "Not able Sell this Crop.");
	response.sendRedirect("/eKrishak/vendor/approveCropPurchase.jsp");
}
%>
