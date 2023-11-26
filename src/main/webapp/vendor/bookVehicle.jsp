<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%
String mobile = (String) session.getAttribute("ven_mobile");
String fname = (String) session.getAttribute("fname");
String farmer_id = (String) session.getAttribute("farmer_id");

// boolean status = false;
//boolean crop_status = false;
ResultSet drivers = null;
String d_name = "", vehicle_type = "", d_city = "", d_state = "", d_pincode = "";


try {

	DB_Connection connection = new DB_Connection();

	String query = "Select * from driver_details where booking_status='available'";

	drivers = connection.getRecords(query);

// 	status = rs.next();

// 	if (status) {
// 		d_name = rs.getString("d_name");
// 		vehicle_type = rs.getString("vehicle_type");
// 		d_city = rs.getString("d_city");
// 		d_state = rs.getString("d_state");
// 		d_pincode = rs.getString("d_pincode");

// 	}

}

catch (Exception e) {
	System.out.println(e);
}
%>


<jsp:include page="base.html" flush="true" />
<title>eKrishak: Book Vehicle</title>
</head>
<body>

	<jsp:include page="../topbar.html" flush="true" />
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
				<a href="vendorDashboard.jsp" class="nav-item nav-link">Home</a> <a
					href="/eKrishak/crops/cropListing.jsp" class="nav-item nav-link">List
					Crops</a> <a href="/eKrishak/vendor/approveCropPurchase.jsp"
					class="nav-item nav-link">Approve Purchase</a> <a
					href="/eKrishak/vendor/bookVehicle.jsp"
					class="nav-item nav-link active">Book Vehicle</a>
				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Welcome, <%=fname.toUpperCase()%></a>
					<div class="dropdown-menu m-0">
						<a href="#" class="dropdown-item  text-center p-2">Profile</a> <a
							href="#" class="dropdown-item  text-center p-2">Order History</a>

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



<div class="container">

		<h1 class='text-warning text-center mt-2'>Book Available Vehicle</h1>



		<hr>
		<div>
			<h3>Vehicle Details:</h3>
			<hr class="stylish-hr">
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
			<%
			boolean d  = false;
			while (drivers.next()) {
			 d = true;
			%>


			<div class="col">
				<div class="card">
					<img src=""
						style="max-height: 30vh !important;" alt="">
					<div class="card-body">
						<h5 class="card-title">Vehicle Type: <%=drivers.getString("vehicle_type")%></h5>
						<p class="card-text">Driver Name: <strong><%= drivers.getString("driver_name") %></strong></p>
						<p class="card-text">Locality: <strong><%= drivers.getString("driver_locality") %></strong></p>
							<p class="card-text">Pincode: <strong><%= drivers.getString("driver_pincode") %></strong></p>
						<p class="card-text">City: <strong><%= drivers.getString("driver_city") %></strong></p>
						<p class="card-text">Sate: <strong><%= drivers.getString("driver_state")%></strong></p>
						<form action="vehicleBookingProcess.jsp">
							<button
								onclick="<% session.setAttribute("driver_id", Integer.toString(drivers.getInt("driver_id"))); %>"
								class="btn btn-primary">Book Vehicle</button>

						</form>
					</div>
				</div>
			</div>
			<%
			}

			if (d == false) {
			%>
			<jsp:include page="noVehicle.html" flush="true" />
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