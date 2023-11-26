<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("ven_mobile");
String logMsg = (String) session.getAttribute("logMsg");

if (mobile == null) {
	response.sendRedirect("vendorLogin.jsp");
}

boolean status = false;
// boolean crop_status = false;
// ResultSet crop_rs;
String fname = "", lname = "", city = "", email = "", cr_name = "";
int ven_id = 0;

try {

	DB_Connection connection = new DB_Connection();

	String query = "Select * from vendor_details where ven_contact=" + mobile;

	ResultSet rs = connection.getRecords(query);

	status = rs.next();

	if (status) {
		ven_id = rs.getInt(1);
		fname = rs.getString(2);
		lname = rs.getString(3);
		city = rs.getString(5);
		email = rs.getString(7);

		session.setAttribute("ven_id", Integer.toString(ven_id));
		session.setAttribute("fname", fname);
		session.setAttribute("email", email);
		session.setAttribute("city", city);

	}

	else {
		session.removeAttribute("mobile");
		response.sendRedirect("vendorLogin.jsp");
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
		out.print("Vendor - Welcome, " + fname.toUpperCase());

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

		<h1 class='text-success'>Dashboard</h1>
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