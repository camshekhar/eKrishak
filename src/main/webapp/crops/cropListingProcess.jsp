<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="connection.* , java.sql.*, java.util.Random"%>
    
<%    
String cr_quant, id, cr_name, cr_price, crop_type;
int cr_type;
	int status=0;
	Random random = new Random();
	int cr_id = random.nextInt(1, 10000);
	
	id = (String)session.getAttribute("id");
	cr_name = request.getParameter("cr_name");
	cr_quant = request.getParameter("cr_quant");
	cr_price = request.getParameter("cr_price");
	crop_type = request.getParameter("cr_type");
	
	cr_type = Integer.parseInt(crop_type);
	String[] Crops_Types = {null, null, "Grains", "Pulses", "Legumes"};
	for(int i = 2; i < Crops_Types.length; i++){
		if( i == cr_type ){
			crop_type = Crops_Types[i];
		}
	}
	try{
	DB_Connection con = new DB_Connection();
	String query = "insert into crop_details(cr_id, cr_name, cr_type, cr_quantity, cr_price, user_id) values("+cr_id+",'"+cr_name+"','"+crop_type+"','"+Integer.parseInt(cr_quant)+"','"+Integer.parseInt(cr_price)+"','"+Integer.parseInt(id)+"')";
	con.storeRecord(query);
	status = 1;
} catch (Exception e) {
	System.out.println(e);

}

	
if(status == 1){
	if(session.getAttribute("user").equals("Vendor")) {
		response.sendRedirect("/eKrishak/vendor/vendorDashboard.jsp");
	}
	else{
		response.sendRedirect("/eKrishak/farmer/farmerDashboard.jsp");
	}
}
	
%>