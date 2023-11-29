<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%
String mobile = (String) session.getAttribute("ven_mobile");
String farmer_id = (String) session.getAttribute("farmer_id");
String driver_id = (String) session.getAttribute("driver_id");
String name = (String) session.getAttribute("name");

boolean status = false;
//boolean crop_status = false;
ResultSet drivers = null;
String d_name = "", vehicle_type = "", d_city = "", d_state = "", d_pincode = "", d_locality = "";

try {

	DB_Connection connection = new DB_Connection();

	String query = "SELECT * from driver_details WHERE booking_status='pending' and driver_id=" + driver_id;

	drivers = connection.getRecords(query);
	if (drivers.next()) {
		status = true;
		d_name = drivers.getString("driver_name");
		d_locality = drivers.getString("driver_locality");
		vehicle_type = drivers.getString("vehicle_type");
		d_pincode = drivers.getString("driver_pincode");
		d_city = drivers.getString("driver_city");
		d_state = drivers.getString("driver_state");
	}

}

catch (Exception e) {
	System.out.println(e);
}
%>


<jsp:include page="base.html" flush="true" />
<title>eKrishak: Confirm Vehicle Booking</title>
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
				<a href="driverDashboard.jsp" class="nav-item nav-link">Home</a> <a
					href="/eKrishak/driver/confirmBooking.jsp"
					class="nav-item nav-link active">Confirm Booking</a>
				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Welcome, <%=name.toUpperCase()%></a>
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

		<h1 class='text-warning text-center mt-2'>Available Vehicle
			Booking Request</h1>



		<hr>
		<h3>Vehicle Details:</h3>
		<hr class="stylish-hr">
	
	<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">

<% if(status == true) { %>
		<div class="col">
			<div class="card">
				<img src="" style="max-height: 30vh !important;" alt="">
				<div class="card-body">
					<h5 class="card-title">
						Vehicle Type:
						<%=vehicle_type%></h5>
					<p class="card-text">
						Driver Name: <strong><%=d_name%></strong>
					</p>
					<p class="card-text">
						Locality: <strong><%=d_locality%></strong>
					</p>
					<p class="card-text">
						Pincode: <strong><%=d_pincode%></strong>
					</p>
					<p class="card-text">
						City: <strong><%=d_city%></strong>
					</p>
					<p class="card-text">
						Sate: <strong><%=d_state%></strong>
					</p>
					<form action="confirmBookingProcess.jsp">
						<button class="btn btn-primary">Confirm Booking</button>

					</form>
				</div>
			</div>
		</div>
		<%
		}
		else{
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