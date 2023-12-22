
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("f_mobile");
if(mobile == null){
	session.setAttribute("logMsg", "You are Not Authorised to Access that Page.");
	response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
}
String logMsg = (String) session.getAttribute("logMsg");
DB_Connection connection = null;
ResultSet rs = null, order = null;
boolean status = false;
String fname = "", lname = "", city = "", email = "", cnf_mobile = "";
int f_id = 0, ordCount = 0, totalRev = 0;


try {

	connection = new DB_Connection();

	String query = "Select * from farmer_details where f_contact=" + mobile;

	rs = connection.getRecords(query);

	status = rs.next();

	if (status) {
	
		f_id = rs.getInt(1);
		fname = rs.getString(2);
		lname = rs.getString(3);
		city = rs.getString(5);
		email = rs.getString(7);

		session.setAttribute("f_id", Integer.toString(f_id));
		session.setAttribute("fname", fname);
		session.setAttribute("email", email);
		session.setAttribute("city", city);
		String ordQuery = "select * from crop_order_details where farmer_id="+f_id;
		order = connection.getRecords(ordQuery);
		while(order.next()){
			ordCount = ordCount + 1;
			totalRev += order.getInt("order_amount");
		}

	}

	else {
		session.removeAttribute("f_mobile");
		response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
		
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
					Crops</a> <a href="/eKrishak/farmer/sellCrops.jsp"
					class="nav-item nav-link">Sell Crops </a>

				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Welcome, <%=fname.toUpperCase()%></a>
					<div class="dropdown-menu m-0">
						<a href="#" class="dropdown-item  text-center p-2">Profile</a> <a
							href="/eKrishak/farmer/orderHistory.jsp"
							class="dropdown-item  text-center p-2">Order History</a>

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

	<div class="container text-justify">

		<h1 class='text-warning text-center mt-2'>Dashboard</h1>

		<hr>



		<main id="main" class="main">

			<div class="pagetitle">
				<h1>Dashboard</h1>
				<nav>
					<ol class="breadcrumb">
						
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
				</nav>
			</div>
			<!-- End Page Title -->

			<section class="section dashboard">
				<div class="row">

					<!-- Left side columns -->
					<div class="col-lg-8">
						<div class="row">

							<!-- Sales Card -->
							<div class="col-xxl-4 col-md-6">
								<div class="card info-card sales-card">



									<div class="card-body">
										<h5 class="card-title">
											Total <span>| Sales</span>
										</h5>

										<div class="d-flex align-items-center">
											<div
												class="card-icon rounded-circle d-flex align-items-center justify-content-center">
												<i class="bi bi-cart"></i>
											</div>
											<div class="ps-3">
												<h6><%= ordCount %></h6>
											</div>
										</div>
									</div>

								</div>
							</div>
							<!-- End Sales Card -->

							<!-- Revenue Card -->
							<div class="col-xxl-4 col-md-6">
								<div class="card info-card revenue-card">


									<div class="card-body">
										<h5 class="card-title">
											Total <span>| Revenue</span>
										</h5>

										<div class="d-flex align-items-center">
											<div
												class="card-icon rounded-circle d-flex align-items-center justify-content-center">
												<i class="bi bi-currency-dollar"></i>
											</div>
											<div class="ps-3">
												<h6>₹<%= totalRev %></h6>
											</div>
										</div>
									</div>
								</div>
								<!-- End Revenue Card -->
							</div>
						</div>
						<!-- End Left side columns -->

			</section>

		</main>
		<!-- End #main -->

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