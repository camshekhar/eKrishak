
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>

<%
String d_mobile = (String) session.getAttribute("d_mobile");
String logMsg = (String) session.getAttribute("logMsg");
DB_Connection connection = null;
boolean status = false, orderStatus = false;
ResultSet driver = null, order = null, details = null;
String fname = "", city = "";
int d_id = 0;


try {

	connection = new DB_Connection();

	String query = "Select * from driver_details where driver_contact=" + d_mobile;
	
	driver = connection.getRecords(query);

	status = driver.next();

	if (status) {
		d_id = driver.getInt("driver_id");
		city = driver.getString("driver_city");
		
		session.setAttribute("d_id", Integer.toString(d_id));
		session.setAttribute("fname", fname);
		session.setAttribute("city", city);


		
		String orderDetails = "Select * from crop_order_details where driver_id=" + d_id;
		order = connection.getRecords(orderDetails);

	}

}

catch (Exception e) {
}
%>


<jsp:include page="base.html" flush="true" />

<title>
	<%
	if (d_mobile == null) {
		out.print("404 - Not Found");

	}

	else {
		out.println(fname.toUpperCase()+": Order History");

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
				<a href="vendorDashboard.jsp" class="nav-item nav-link active">Home</a>
				<a href="/eKrishak/crops/cropListing.jsp" class="nav-item nav-link">List
					Crops</a> <a href="/eKrishak/vendor/approveCropPurchase.jsp"
					class="nav-item nav-link">Approve Purchase</a>
<a href="/eKrishak/vendor/bookVehicle.jsp"
					class="nav-item nav-link">Book Vehicle</a>
				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Welcome, <%=fname.toUpperCase()%></a>
					<div class="dropdown-menu m-0">
						<a href="#" class="dropdown-item  text-center p-2">Profile</a> <a
							href="/eKrishak/vendor/orderHistory.jsp" class="dropdown-item  text-center p-2">Order History</a>

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
			session.setAttribute("vendor_id", order.getString("vendor_id"));
			session.setAttribute("farmer_id", order.getString("farmer_id"));
			%>

			<div class="col">
				<div class="card">
	
					<div class="card-body">
						<h5 class="card-title">Order ID: <%=order.getInt("order_id")%></h5>
						
						<p class="card-text">
							Farmer Id: <strong><%=order.getString("farmer_id")%>
							</strong>
						</p>
						<p class="card-text">
							Vendor Id: <strong><%=order.getString("vendor_id") %>
							</strong>
						</p>
						<p class="card-text">
							City: <strong><%=city%>
							</strong>
						</p>
				
							<a href="receiptDownload.jsp" target="_blank"
							
								 class="btn btn-custom" >Show Receipt</a>

					
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