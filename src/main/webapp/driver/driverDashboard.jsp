<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("mobile");

if (mobile == null) {
	response.sendRedirect("vendorLogin.jsp");
}

boolean status = false;
String fname = "", lname = "", city = "", email = "";
int id = 0;

try {

	DB_Connection connection = new DB_Connection();

	Connection con = connection.get_connection();

	PreparedStatement ps = con.prepareStatement("Select * from vendor_details where contact_no=?");

	ps.setInt(1, Integer.parseInt(mobile));

	ResultSet rs = ps.executeQuery();

	status = rs.next();

	if (status) {
		id = rs.getInt(1);
		fname = rs.getString(2);
		lname = rs.getString(3);
		city = rs.getString(5);
		email = rs.getString(7);
		
		
		session.setAttribute("vendor_id", Integer.toString(id));
		session.setAttribute("fname", fname);
		session.setAttribute("email", email);
		session.setAttribute("city", city);

	}
	
	else{
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
				<a href="#" class="nav-item nav-link active">Home</a> <a
					href="cropListing.jsp" class="nav-item nav-link">List Crops</a> <a
					href="/eKrishak/vendor/vendorLogin.jsp" class="nav-item nav-link">Approve
					Purchase</a>

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