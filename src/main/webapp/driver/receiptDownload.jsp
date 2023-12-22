<%@page import="javax.swing.tree.DefaultTreeCellEditor.DefaultTextField"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*,
	 java.sql.*"%>

<%

String ven_id = (String) session.getAttribute("vendor_id");
String f_id = (String) session.getAttribute("farmer_id");
String d_id = (String) session.getAttribute("d_id");
String city = (String) session.getAttribute("city");
DB_Connection connection = null;

ResultSet order = null, details = null, fDetails = null;
String fname = "", lname = "", cropName = "", vendor_name = "", farmer_name = "";
int i = 0, cropQuantity=0;

try {
	connection = new DB_Connection();

	String query = "Select * from crop_order_details where driver_id="+d_id;
	String query2 = "Select * from crop_details, vendor_details where crop_details.buyer_id =  vendor_details.ven_id AND crop_details.seller_id=" + f_id;
	String query3 = "Select * from farmer_details where id="+f_id;
	order = connection.getRecords(query);
	details = connection.getRecords(query2);
	fDetails = connection.getRecords(query3);
	if(details.next()){
		cropName = details.getString("cr_name");
		vendor_name = details.getString("first_name")+ " " +details.getString("last_name");
		cropQuantity = details.getInt("cr_quantity");
	}
	if(fDetails.next()){
		
		farmer_name = details.getString("first_name")+ " " +details.getString("last_name");
		}

} catch (Exception e) {
	System.out.println(e);
}
%>
<html>

<head>
<jsp:include page="base.html" flush="true" />
<!-- Include html2pdf library -->
<script
	src="https://rawgit.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
<title>Vendor: Order Detail</title>
</head>
<body>

	<section class="container-fluid mx-auto mb-4"
		style="display: flex; flex-direction: column; align-items: center; justify-content: center; width: 60vw;">
		
		<div id="order_detail" class="text-center">

			<img class="img-fluid" alt="E-Krishak"
				src="../assets/img/order-logo.png" />


			<hr style="border: 1px solid green; width: 100%">
			<h1 class="h1">Order Details</h1>
			
			<table class="table text-end" style="width: 100%;">

				<thead>
					<tr>
						<th scope="col">Sr. No.</th>
						<th scope="col">Order Id</th>
						<th scope="col">Farmer Name</th>
						<th scope="col">Crop Name</th>
						<th scope="col">Vendor Name</th>
						<th scope="col">Crop Quantity</th>
						<th scope="col">City</th>
						
					</tr>
				</thead>
				<tbody class="table-group-divider">
				<% while(order.next()){
					i = i + 1;
					
					%>
				
					<tr class="text-end">
						<th scope="row"><%= i %></th>
						<td><%= order.getInt("order_id") %></td>
						
						<td><%= farmer_name.toUpperCase() %></td>
						<td><%= cropName %></td>
						<td><%= vendor_name.toUpperCase() %></td>
						<td><%= cropQuantity %></td>
						<td><%= city %></td>
						
						
					</tr>
						
				<%} %>
			
				
				</tbody>
						
			</table>
			
		</div>
		<!-- Button to trigger the download -->
		<button class="btn btn-success" onclick="downloadPDF()">Download
			Invoice</button>
		
	</section>




	<script>
	
	// Function to convert HTML to PDF and trigger download
	function downloadPDF() {
	    var element = document.getElementById("order_detail"); // The element you want to convert to PDF
	    console.log("start");
	    html2pdf(element, {
		margin : 5,
		filename : 'order_invoice.pdf',
		image : {
		    type : 'jpeg',
		    quality : 1.0
		},
		html2canvas : {
		    scale : 1
		},
		jsPDF : {
		    unit : 'mm',
		    format : 'a4',
		    orientation : 'portrait'
		}
	    });
	    console.log(element);
	}
    </script>
</body>
</html>
