
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("d_mobile");
String logMsg = (String) session.getAttribute("logMsg");
DB_Connection connection = null;
boolean status = false, orderStatus = false;
ResultSet driver = null, order = null;
String d_name = "";
int d_id = 0;
Date dt = new Date();

try {

	connection = new DB_Connection();

	String query = "Select * from driver_details where driver_contact=" + mobile;
	
	driver = connection.getRecords(query);

	status = driver.next();

	if (status) {
		d_id = driver.getInt("driver_id");
		d_name = driver.getString("driver_name");
		
		
		session.setAttribute("d_id", Integer.toString(d_id));
		session.setAttribute("d_name", d_name);
	

		
		String orderDetails = "Select * from crop_order_details, crop_details where crop_order_details.crop_id = crop_details.cr_id AND driver_id=" + d_id;
		order = connection.getRecords(orderDetails);
		
	}

	else {
		session.removeAttribute("d_mobile");
		response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
	}
	
	

}

catch (Exception e) {
	System.out.println(e);
}
%>


<jsp:include page="base.html" flush="true" />

<title>
	<%
	if (mobile == null) {
		out.print("404 - Not Found");

	}

	else {
		out.println(d_name.toUpperCase()+": Order History");

	}
	%>

</title>
</head>
<body>
	<jsp:include page="../topbar.html" flush="true" />

	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-primary navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-5">
		<a href="/eKrishak" target="_blank"
			class="navbar-brand d-flex d-lg-none">
			<h1 class="m-0 display-4 text-secondary">
				<span class="text-white">eKri</span>shak
			</h1>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav mx-auto py-0">
				<a href="farmerDashboard.jsp" class="nav-item nav-link active">Home</a>
				<a href="/eKrishak/crops/cropListing.jsp" class="nav-item nav-link">List
					Crops</a> <a href="/eKrishak/farmer/sellCrops.jsp"
					class="nav-item nav-link">Sell Crops </a>

				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Welcome, <%=d_name.toUpperCase()%></a>
					<div class="dropdown-menu m-0">
						<a href="#" class="dropdown-item  text-center p-2">Profile</a> <a
							href="/eKrishak/farmer/orderHistory.jsp" class="dropdown-item  text-center p-2">Order History</a>

						<div class="dropdown-item bg-danger">

							<form method='post' action='logout.jsp'>
								<button class='btn btn-danger text-center w-100' type='submit'>Logout</button>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</nav>


	<%
	if (logMsg != null) {
	%>
	<div
		class="alert d-flex align-items-center alert-success alert-dismissible p-0 mx-auto w-100"
		role="alert" style="height: 20vh;">
		<svg class="bi" role="img">
			<use xlink:href="#check-circle-fill" /></svg>
		<div class="fw-bold text-center" style="font-size: 1.5rem;">
			<%=logMsg%>
			🥳.
		</div>
		<button type="button" onclick="<%session.removeAttribute("logMsg");%>"
			class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

	</div>

	<%
	}
	%>

	<div class="container">

		<h1 class='text-warning text-center mt-2'>Order History</h1>

		<hr>



<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
			<%
		
			while (order.next()) {
			orderStatus = true;
			%>

			<div class="col">
				<div class="card">
	
					<div class="card-body">
						<h5 class="card-title">Order ID: <%=order.getInt("order_id")%></h5>
						<p class="card-text">
							Order Date: <strong><%=order.getDate("orderDate")%>
							</strong>
						</p>
						<p class="card-text">
							Crop Name: <strong><%=order.getString("cr_name")%>
							</strong>
						</p>
						<p class="card-text">
							Farmer ID: <strong><%=order.getInt("seller_id") %>
							</strong>
						</p>
						<p class="card-text">
							Vendor ID: <strong><%=order.getInt("buyer_id") %>
							</strong>
						</p>
						<p class="card-text">
							Total Order Quantity: <strong><%=order.getString("cr_quantity")%>KG</strong>
						</p>
						<p class="card-text">
							Total Order Amount: ₹<strong><%=order.getInt("order_amount")%></strong>
						</p>
						<form action="receiptDownload.jsp">
							<button
							
								class="btn btn-custom" disabled>Download Receipt</button>

						</form>
					</div>
				</div>
			</div>
			<%
			}

			if(orderStatus == false) {
			%>
			<jsp:include page="noItem.html" flush="true" />
			<%
			}
			%>
		</div>


	</div>


	<jsp:include page="../footer.html" flush="true" />
	<script type="text/javascript">
	function googleTranslateElementInit() {
	    new google.translate.TranslateElement({
		pageLanguage : "en"
	    }, "google_translate_element");
	}
    </script>
	<script type="text/javascript"
		src="https://translate.google.com/translate_a/element.js?
cb=googleTranslateElementInit"></script>
	<script src="main.js"></script>

</body>
</html>