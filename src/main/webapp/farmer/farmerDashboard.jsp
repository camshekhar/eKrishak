
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("f_mobile");
String logMsg = (String) session.getAttribute("logMsg");
DB_Connection connection = null;
boolean status = false;
String fname = "", lname = "", city = "", email = "", cnf_mobile = "";
int id = 0;
try {

	connection = new DB_Connection();

	String query = "Select * from farmer_details where f_contact=" + mobile;

	ResultSet rs = connection.getRecords(query);

	status = rs.next();

	if (status) {
		id = rs.getInt(1);
		fname = rs.getString(2);
		lname = rs.getString(3);
		city = rs.getString(5);
		email = rs.getString(7);

		session.setAttribute("id", Integer.toString(id));
		session.setAttribute("fname", fname);
		session.setAttribute("email", email);
		session.setAttribute("city", city);

	}

	else {
		session.removeAttribute("f_mobile");
		response.sendRedirect("farmerLogin.jsp");
	}

}

catch (Exception e) {
}
%>




<%
boolean crop_status = false;
ResultSet grains = null, pulses = null, legumes = null;

try {
	connection = new DB_Connection();
	String grainQuery = "Select * from crop_details where cr_type='grains'";
	String pulsesQuery = "Select * from crop_details where cr_type='pulses'";
	String legumesQuery = "Select * from crop_details where cr_type='legumes'";
	grains = connection.getRecords(grainQuery);
	pulses = connection.getRecords(pulsesQuery);
	legumes = connection.getRecords(legumesQuery);
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
		out.println("Welcome, " + fname.toUpperCase());

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
					Crops</a> <a href="/eKrishak/vendor/vendorLogin.jsp"
					class="nav-item nav-link">Sell Crops </a>

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


	<%
	if (logMsg != null) {
	%>
	<div
		class="alert d-flex align-items-center alert-success alert-dismissible p-0 mx-auto h-40"
		role="alert">
		<svg class="bi" role="img">
			<use xlink:href="#check-circle-fill" /></svg>
		<div class="fw-bold">
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

		<h1 class='text-warning text-center mt-5'>Dashboard</h1>

		<hr>
		<div>
			<h3>Grains:</h3>
			<hr class="stylish-hr">
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
			<%
			boolean g = false;
				while (grains.next()) {
					g = true;
			%>

			<div class="col">
				<div class="card">
					<img src="<%=grains.getString("cr_img")%>" class="card-img-top"
						alt="">
					<div class="card-body">
						<h5 class="card-title"><%=grains.getString("cr_name")%></h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
							 <a href="#" class="btn btn-custom">Sell Crop</a>
					</div>
				</div>
			</div>
			<%
			}

				if(g == false) {
			%>
			<jsp:include page="../noItem.html" flush="true" />
			<%
			}
			%>
		</div>


		<div>
			<h3>Pulses:</h3>
			<hr class="stylish-hr">
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<%
			boolean p =false;
				while (pulses.next()) {
					p = true;
			%>

			<div class="col">
				<div class="card">
					<img src="<%=pulses.getString("cr_img")%>" class="card-img-top"
						alt="">
					<div class="card-body">
						<h5 class="card-title"><%=pulses.getString("cr_name")%></h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
					</div>
				</div>
			</div>
			<%
			}

			if(p == false) {
			%>
			<jsp:include page="../noItem.html" flush="true" />
			<%
			}
			%>

		</div>


		<div>
			<h3>Legumes:</h3>
			<hr class="stylish-hr">
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4">

			<%
			boolean lg = false;
				while (legumes.next()) {
					lg = true;
			%>

			<div class="col">
				<div class="card">
					<img src="<%=legumes.getString("cr_img")%>" class="card-img-top"
						alt="">
					<div class="card-body">
						<h5 class="card-title"><%=legumes.getString("cr_name")%></h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
					</div>
				</div>
			</div>
			<%
			}

			if(lg == false) {
			%>
			<jsp:include page="../noItem.html" flush="true" />
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