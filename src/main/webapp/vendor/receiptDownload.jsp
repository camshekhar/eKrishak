<%@page import="javax.swing.tree.DefaultTreeCellEditor.DefaultTextField"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*,
	 java.sql.*"%>

<%

String ven_id = (String) session.getAttribute("ven_id");
DB_Connection connection = null;

ResultSet order = null, details = null;;
String fname = "", lname = "", city = "", email = "", cnf_mobile = "", cropName = "", farmer_name = "";
int i = 0, cropQuantity=0, totalAmount=0;

try {
	connection = new DB_Connection();

	String orderDetails = "Select * from crop_order_details where vendor_id="+ven_id;
	String query2 = "Select * from crop_details, farmer_details where crop_details.seller_id =  farmer_details.id AND crop_details.buyer_id=" + ven_id;
	order = connection.getRecords(orderDetails);
	details = connection.getRecords(query2);
	if(details.next()){
		cropName = details.getString("cr_name");
		farmer_name = details.getString("first_name")+ " " +details.getString("last_name");
		cropQuantity = details.getInt("cr_quantity");
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
<title>Farmer: Order Detail</title>
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
						<th scope="col">Vendor Id</th>
						<th scope="col">Crop Name</th>
						
						<th scope="col">Farmer Name</th>
						<th scope="col">Order Amount</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
				<% while(order.next()){
					i = i + 1;
					totalAmount += order.getInt("order_amount");
					%>
				
					<tr class="text-end">
						<th scope="row"><%= i %></th>
						<td><%= order.getInt("order_id") %></td>
						
						<td><%= order.getInt("vendor_id") %></td>
						<td><%= cropName %></td>
						<td><%= farmer_name %></td>
						<td>₹<%= order.getInt("order_amount") %></td>
						
					</tr>
						
				<%} %>
				<tr >
					<td class="text-end" colspan="6">Total Amount: ₹<%= totalAmount %></td>
						</tr>
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
