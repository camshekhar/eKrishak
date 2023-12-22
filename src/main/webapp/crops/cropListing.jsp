<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
String fname = "", email, city, ven_mobile, f_mobile, id = "", user = "";

ven_mobile = (String) session.getAttribute("ven_mobile");
f_mobile = (String) session.getAttribute("f_mobile");

if (f_mobile != null || ven_mobile != null) {
	fname = (String) session.getAttribute("fname");
	email = (String) session.getAttribute("email");
	city = (String) session.getAttribute("city");

	if (ven_mobile == null) {
		user = "Farmer";
		session.setAttribute("user", user);
		id = (String) session.getAttribute("f_id");
		session.setAttribute("id", id);
	} else {
		user = "Vendor";
		session.setAttribute("user", user);
		id = (String) session.getAttribute("ven_id");
		session.setAttribute("id", id);
	}

} else {

		response.sendRedirect("/eKrishak");
	}

%>


<jsp:include page="base.html" flush="true" />
<title>eKrishak: Crop Listing</title>
</head>
<body>
	<jsp:include page="../topbar.html" flush="true" />
	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-primary navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-5">
		<a href="/eKrishak" class="navbar-brand d-flex d-lg-none">
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

				<%
				if (user.equals("Farmer")) {
				%>
				<a href="/eKrishak/farmer/farmerDashboard.jsp"
					class="nav-item nav-link">Home</a> 
					<a href="/eKrishak/admin/adminLogin.jsp" class="nav-item nav-link">Admin</a>
					<a
					href="/eKrishak/crops/cropListing.jsp"
					class="nav-item nav-link active">List Crops</a> <a
					href="/eKrishak/farmer/sellCrops.jsp" class="nav-item nav-link">Sell
					Crops</a>

				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Welcome, <%=fname.toUpperCase()%></a>
					<div class="dropdown-menu m-0">
						<a href="#" class="dropdown-item  text-center p-2">Profile</a> <a
							href="/eKrishak/farmer/orderHistory.jsp"
							class="dropdown-item  text-center p-2">Order History</a>

						<div class="dropdown-item bg-danger">

							<form method='post' action='/eKrishak/farmer/logout.jsp'>
								<button class='btn btn-danger text-center w-100' type='submit'>Logout</button>
							</form>
						</div>
					</div>
				</div>

				<%
				}
				%>


				<%
				if (user.equals("Vendor")) {
				%>
				<a href="#" class="nav-item nav-link">Home</a> <a
					href="/eKrishak/crops/cropListing.jsp"
					class="nav-item nav-link active">List Crops</a> <a
					href="/eKrishak/vendor/approveCropPurchase.jsp"
					class="nav-item nav-link">Approve Purchase</a> <a
					href="/eKrishak/vendor/bookVehicle.jsp" class="nav-item nav-link">Book
					Vehicle</a>
				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Welcome, <%=fname.toUpperCase()%></a>
					<div class="dropdown-menu m-0">
						<a href="#" class="dropdown-item  text-center p-2">Profile</a> <a
							href="/eKrishak/vendor/orderHistory.jsp"
							class="dropdown-item  text-center p-2">Order History</a>

						<div class="dropdown-item bg-danger">

							<form method='post' action='/eKrishak/vendor/logout.jsp'>
								<button class='btn btn-danger text-center w-100' type='submit'>Logout</button>
							</form>
						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</nav>




	<section class="h-100 pt-4"
		style="background-color: #eee; border-radius: 10px;">
		<h1 class="text-center">List Crops</h1>
		<hr style="border: 2px solid green;">
		<div class="container pb-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card rounded-3">
						<img src="../assets/img/cropList.webp" class="w-100"
							style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
							alt="Sample photo">
						<div class="card-body p-4 p-md-5 w-100">
							<h3 class="mb-0 pb-2  text-center">Crop Info</h3>
							<hr>

							<form class="px-md-2" method="post"
								action="/eKrishak/crops/cropListingProcess.jsp"
								name="contact-form" onsubmit="return validateForm()">

								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example1q"><span
										class="text-danger fw-bold">*</span> <%=user%> Id:</label> <input
										type="text" id="form3Example1q" class="form-control"
										disabled="disabled" value="<%=id%>" name="user_id" />

								</div>

								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example1q"><span
										class="text-danger fw-bold">*</span> Crop Name:</label> <input
										type="text" id="form3Example1q" class="form-control"
										name="cr_name" required />

								</div>


								<div class="  col-md-6 mb-4">

									<label class="form-label" for="form3Example1q"><span
										class="text-danger fw-bold">*</span> Crop Type:</label> <select
										class="form-outline select p-2 cursor-pointer" name="cr_type"
										required>
										<option value="null" disabled selected>Select Crop
											Type</option>
										<option value="Grains">Grains</option>
										<option value="Pulses">Pulses</option>
										<option value="Legumes">Legumes</option>
									</select>

								</div>

								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example1q"><span
										class="text-danger fw-bold">*</span> Crop Quantity(KG):</label> <input
										type="text" id="form3Example1q" class="form-control"
										name="cr_quant" required />

								</div>



								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example1q"><span
										class="text-danger fw-bold">*</span> Crop Price(₹/KG):</label> <input
										type="text" id="form3Example1q" class="form-control"
										name="cr_price" required />

								</div>


								<div class="form-outline mb-4">
									<label for="formFilesm" class="form-label">Upload Crop
										Image:</label> <input class="form-control form-control-sm"
										id="formFilesm" type="file" name="cr_img" />

								</div>

								<button type="submit" class="btn btn-success btn-lg mb-1">Submit</button>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<jsp:include page="../footer.html" flush="true" />

</body>
</html>