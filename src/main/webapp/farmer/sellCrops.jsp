
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("f_mobile");
String fname = "";

if (mobile != null) {
	fname = (String) session.getAttribute("fname");

} else {
	session.removeAttribute("f_mobile");
	response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
}
%>

<%
DB_Connection connection = null;
ResultSet grains = null, pulses = null, legumes = null;

try {
	connection = new DB_Connection();

	String grainQuery = "Select * from crop_details where cr_type='grains' and cr_sold=" + 0;
	String pulsesQuery = "Select * from crop_details where cr_type='pulses' and cr_sold=" + 0;
	String legumesQuery = "Select * from crop_details where cr_type='legumes' and cr_sold=" + 0;

	grains = connection.getRecords(grainQuery);
	pulses = connection.getRecords(pulsesQuery);
	legumes = connection.getRecords(legumesQuery);
}

catch (Exception e) {

	System.out.println(e.getMessage());
}
%>

<jsp:include page="base.html" flush="true" />

<title>
	<%
	if (mobile == null) {
		out.print("404 - Not Found");

	}

	else {
		out.println("Sell Crops: " + fname.toUpperCase());

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
				<a href="farmerDashboard.jsp" class="nav-item nav-link">Home</a> <a
					href="/eKrishak/crops/cropListing.jsp" class="nav-item nav-link">List
					Crops</a> <a href="/eKrishak/farmer/sellCrops.jsp"
					class="nav-item nav-link active">Sell Crops </a>

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

		<h1 class='text-warning text-center mt-2'>Crops Available for
			Sell</h1>

		<hr>
		<div>
			<h3>Grains:</h3>
			<hr class="stylish-hr">
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
			<%
			boolean g = false;
			while (grains.next()) {
				g = true;
			%>

			<div class="col">
				<div class="card">
					<img src="<%=grains.getString("cr_img")%>"
						style="max-height: 30vh !important;" alt="">
					<div class="card-body text-center">
						<h5 class="card-title"><%=grains.getString("cr_name")%></h5>
						<p class="card-text">
							Price: <strong>₹<%=grains.getString("cr_price")%>/KG
							</strong>
						</p>
						<p class="card-text">
							Total Available Quantity: <strong><%=grains.getString("cr_quantity")%>KG</strong>
						</p>
						<form action="cropSellingProcess.jsp">
							<button
								onclick="<%session.setAttribute("cr_id", Integer.toString(grains.getInt("cr_id")));%>"
								class="btn btn-custom">Sell Crop</button>

						</form>
					</div>
				</div>
			</div>
			<%
			}

			if (g == false) {
			%>
			<jsp:include page="noItem.html" flush="true" />
			<%
			}
			%>
		</div>


		<div>
			<h3>Pulses:</h3>
			<hr class="stylish-hr">
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4  mb-5">
			<%
			boolean p = false;
			while (pulses.next()) {
				p = true;
			%>

			<div class="col">
				<div class="card">
					<img src="<%=pulses.getString("cr_img")%>"
						style="max-height: 30vh !important;" alt="">
					<div class="card-body text-center">
						<h5 class="card-title"><%=pulses.getString("cr_name")%></h5>
						<p class="card-text">
							Price: <strong>₹<%=pulses.getString("cr_price")%>/KG
							</strong>
						</p>
						<p class="card-text">
							Total Available Quantity: <strong><%=pulses.getString("cr_quantity")%>KG</strong>
						</p>
						<form action="cropSellingProcess.jsp">

							<select class="form-select mb-4"
								aria-label="Default select example">
								<option selected>Open this select menu</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
							<button
								onclick="<%session.setAttribute("cr_id", Integer.toString(pulses.getInt("cr_id")));%>"
								class="btn btn-custom">Sell Crop</button>

						</form>
					</div>
				</div>
			</div>
			<%
			}

			if (p == false) {
			%>
			<jsp:include page="noItem.html" flush="true" />
			<%
			}
			%>

		</div>


		<div>
			<h3>Legumes:</h3>
			<hr class="stylish-hr">
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4  mb-5">

			<%
			boolean lg = false;
			while (legumes.next()) {
				lg = true;
			%>

			<div class="col">
				<div class="card">
					<img src="<%=legumes.getString("cr_img")%>"
						style="max-height: 30vh !important;" alt="">
					<div class="card-body text-center">
						<h5 class="card-title"><%=legumes.getString("cr_name")%></h5>
						<p class="card-text">
							Price: <strong>₹<%=legumes.getString("cr_price")%>/KG
							</strong>
						</p>

						<p class="card-text">
							Total Available Quantity: <strong><%=legumes.getString("cr_quantity")%>KG</strong>
						</p>
						<form action="cropSellingProcess.jsp">
							<button
								onclick="<%session.setAttribute("cr_id", Integer.toString(legumes.getInt("cr_id")));%>"
								class="btn btn-custom">Sell Crop</button>

						</form>
					</div>
				</div>
			</div>
			<%
			}

			if (lg == false) {
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