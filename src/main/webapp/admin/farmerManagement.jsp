<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>

<%
String admin_email = (String) session.getAttribute("admin_email");

if (admin_email == null) {
	session.setAttribute("logMsg", "You are Not Authorised to Access that Page.");
	response.sendRedirect("/eKrishak/admin/adminLogin.jsp");
}

DB_Connection connection = null;
boolean status = false, orderStatus = false;
ResultSet farmer = null, f_rs = null, v_rs = null, ord_rs = null, d_rs = null;
int fCount = 0, users = 0, i = 0;

try {

	connection = new DB_Connection();
	String fQuery = "select count(*) from farmer_details";

	f_rs = connection.getRecords(fQuery);

	if (f_rs.next()) {
		fCount = f_rs.getInt(1);
	}

	String farmerDetails = "Select * from farmer_details";
	farmer = connection.getRecords(farmerDetails);

}

catch (Exception e) {
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Farmers</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
	rel="stylesheet">
<link rel="stylesheet" href="../assets/css/AdminEmp.css">

</head>
<body>
	<div class="container">
		<!-- Sidebar Section -->
		<aside>
			<div class="toggle">
				<div class="logo">
					<h2 class="success">
						Admin<span class="warning">Dashboard</span>
					</h2>
				</div>
				<div class="close" id="close-btn">
					<span class="material-icons-sharp"> close </span>
				</div>
			</div>

			<div class="sidebar">
				<a href="/eKrishak/admin/adminDashboard.jsp" class="sidebar-link"
					data-section="dashboard-section"> <span
					class="material-icons-sharp">insights</span>
					<h3>Analytics</h3>
				</a> <a href="/eKrishak/admin/farmerManagement.jsp"
					class="sidebar-link  active"> <span
					class="material-icons-sharp">agriculture</span>
					<h3>Farmers</h3>
				</a> <a href="/eKrishak/admin/vendorManagement.jsp" class="sidebar-link">
					<span class="material-icons-sharp">local_grocery_store</span>
					<h3>Vendors</h3>
				</a> <a href="/eKrishak/admin/driverManagement.jsp" class="sidebar-link">
					<span class="material-icons-sharp">car_rental</span>
					<h3>Drivers</h3>
				</a> <a href="/eKrishak/admin/feedbacks.jsp" class="sidebar-link"
					data-section="track-section"> <span
					class="material-icons-sharp">mail_outline</span>
					<h3>Feedbacks</h3>
				</a> <a href="/eKrishak/admin/support.jsp" class="sidebar-link"
					data-section="report-section"> <span
					class="material-icons-sharp">inventory</span>
					<h3>Help & Support</h3>
				</a> <a href="logout.jsp"> <span
					class="material-icons-sharp danger">logout</span>
					<h3 class="danger">Logout</h3>
				</a>


			</div>
		</aside>
		<!-- End of Sidebar Section -->

		<!-- Main Content -->
		<main>

			<div class="section" id="dashboard-section">
				<h1>Analytics</h1>
				<div class="analyse">
					<div class="sales">
						<div class="status">
							<div class="info">
								<h3>Registered Farmers</h3>
								<h1><%=fCount%></h1>
							</div>

						</div>
					</div>
				</div>
				<!-- End of Analyses -->

				<!-- Recent Orders Table -->
				<div class="recent-orders">
					<h2>Farmers List</h2>
					<table>
						<thead>
							<tr>
								<th>Sr. No.</th>
								<th>Farmer Id</th>
								<th>Farmer Name</th>
								<th>Mobile</th>
								<th>Email</th>
								<th>City</th>
								<th>State</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
							while (farmer.next()) {
								i += 1;
							%>
							<tr>
								<td><%=i%></td>
								<td><%=farmer.getInt("id")%></td>
								<td><%=(farmer.getString("first_name") + " " + farmer.getString("last_name")).toUpperCase()%></td>
								<td><%=farmer.getString("f_contact")%></td>
								<td><%=farmer.getString("f_email")%></td>
								<td><%=farmer.getString("f_city")%></td>
								<td><%=farmer.getString("f_state")%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>

				</div>
				<!-- ... your existing content ... -->
			</div>




			<!-- End of Recent Orders -->

		</main>
		<!-- End of Main Content -->
	</div>

	<script src="./js/index.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


</body>
</html>