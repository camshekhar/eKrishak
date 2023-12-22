<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("d_mobile");
String logMsg = (String) session.getAttribute("logMsg");

if (mobile == null) {
	response.sendRedirect("driverLogin.jsp");
}

boolean status = false;
String name = "", vehicle_type = "";
int id = 0;
DB_Connection connection = null;

try {

	connection = new DB_Connection();

	String query = "Select * from driver_details where driver_contact=" + mobile;

	ResultSet rs = connection.getRecords(query);

	status = rs.next();

	if (status) {
		id = rs.getInt("driver_id");
		name = rs.getString("driver_name");
		session.setAttribute("driver_id", Integer.toString(id));
		session.setAttribute("name", name);
	}

	else {
		session.removeAttribute("d_mobile");
		response.sendRedirect("driverLogin.jsp");
	}

}

catch (Exception e) {
}

%>


<jsp:include page="base.html" flush="true" />

<title>
	<%
	if (mobile == null) {
		out.print("404 - Not Found");

	}

	else {
		out.print("Driver - Welcome, " + name.toUpperCase());

	}
	%>

</title>
</head>
<body>
	<%-- 	<jsp:include page="../navbar.html" flush="true" /> --%>

	<jsp:include page="../topbar.html" flush="true" />

		<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-primary navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-5">
		<a href="/eKrishak" target="_blank" class="navbar-brand d-flex d-lg-none">
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
				<a href="driverDashboard.jsp" class="nav-item nav-link active">Home</a> <a
					href="/eKrishak/driver/confirmBooking.jsp" class="nav-item nav-link">Confirm Booking</a>

				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Welcome, <%=name.toUpperCase()%></a>
					<div class="dropdown-menu m-0">
						<a href="#" class="dropdown-item  text-center p-2">Profile</a> <a
							href="/eKrishak/driver/orderHistory.jsp" class="dropdown-item  text-center p-2">Order History</a>

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
		<button type="button"
			onclick="<%session.removeAttribute("logMsg");%>" class="btn-close"
			data-bs-dismiss="alert" aria-label="Close"></button>

	</div>

	<%
	}
	%>


	<div
		class="d-flex flex-column align-items-center justify-content-center">

		<h2>Dashboard</h2>
		<h1 class='text-success'></h1>
	</div>





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