<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	
	String duplicate = (String) session.getAttribute("duplicate");
	

	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="base.html" flush="true" />




<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> -->
<title>Driver SignUp - eKrishak</title>
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
				<a href="/eKrishak" class="nav-item nav-link">Home</a>
				<a href="/eKrishak/admin/adminLogin.jsp" class="nav-item nav-link">Admin</a>
				 <a
					href="/eKrishak/farmer/farmerLogin.jsp" class="nav-item nav-link">Farmer</a>
				<a href="/eKrishak/vendor/vendorLogin.jsp" class="nav-item nav-link">Vendor</a>
				<a href="/eKrishak/driver/driverLogin.jsp"
					class="nav-item nav-link active">Driver</a> <a
					href="/eKrishak/contactUs.jsp" class="nav-item nav-link">Contact</a>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
	
		<% if(duplicate != null) { %>
<div
		class="alert d-flex align-items-center alert-danger alert-dismissible p-0 mx-auto w-100"
		role="alert" style="height: 20vh;">
		<svg class="bi" role="img">
			<use xlink:href="#check-circle-fill" /></svg>
		<div class="fw-bold text-center" style="font-size: 1.5rem;">
	 <%= duplicate %> 😓.
 </div>
 <button type="button" onclick="<% session.removeAttribute("logMsg"); %>" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>

<%} %>
	<section
		style="background-image: url('assets/img/ploughing farmer.jpg'); height: 100% !important; padding: 10px 0px;">

		<div class="container">

			<div class="row d-flex justify-content-center align-items-center">

				<div class="col-lg-12 col-xl-11">

					<div class="card text-black" style="border-radius: 25px;">
						<h1 class="text-dark text-center mt-5">Welcome, Drivers 🚗</h1>
						<div class="card-body p-md-5">
							<div class="row justify-content-center">

								<p
									class="text-center text-success h1 fw-bold mb-5 mx-1 mx-md-4 text-decoration-underline">Sign
									Up Here</p>
								<hr>
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<form class="mx-1 mx-md-4" action="regProcess.jsp" name="contact-form" onsubmit="return validateForm()">


										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">

												<label class="form-label" for="form3Example1c"><span
													class="text-danger fw-bold">*</span> Name</label> <input
													type="text" id="form3Example1c" class="form-control"
													name="dname" required />
											</div>
										</div>


										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-phone fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">

												<label class="form-label" for="form3Example1c"><span
													class="text-danger fw-bold">*</span> Mobile No.</label> <input
													type="text" id="form3Example1c" class="form-control"
													name="mobile" maxlength="10" pattern="[789][0-9]{9}" title="Only Numbers Accepted and starts with 7/8/9."
													placeholder="999999999" required />
											</div>
										</div>




										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-key fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">

												<label class="form-label" for="form3Example1c"><span
													class="text-danger fw-bold">*</span> Password</label> <input
													type="password" id="form3Example1c" class="form-control"
													name="password" required />
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-car fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example1q"><span
													class="text-danger fw-bold">*</span> Vehicle Type:</label> <select
													class="form-outline select p-2 cursor-pointer"
													name="vehicle_type">
													<option value="null" disabled selected>Select
														Vehicle Type</option>
													<option value="Truck">Truck</option>
													<option value="Tractor">Tractor</option>
													<option value="Lorry Van">Lorry Van</option>
												</select>

											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-globe fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">

												<label class="form-label" for="form3Example1c"><span
													class="text-danger fw-bold">*</span> State</label> <input
													type="text" id="form3Example1c" class="form-control"
													name="state" required />
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-globe fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">

												<label class="form-label" for="form3Example3c"><span
													class="text-danger fw-bold">*</span> City</label> <input
													type="text" id="form3Example3c" class="form-control"
													name="city" required />
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">

												<label class="form-label" for="form3Example4cd"><span
													class="text-danger fw-bold">*</span> Pincode</label> <input
													type="text" id="form3Example4cd" class="form-control"
													name="pincode" required />
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">

												<label class="form-label" for="form3Example4c"><span
													class="text-danger fw-bold">*</span> Locality</label> <input
													type="text" id="form3Example4c" class="form-control"
													name="locality" required />
											</div>
										</div>
										<p class="mt-4">
											<strong>Note: </strong> Fields marked with <span
												class="text-danger fw-bold">*</span> are mandatory to fill.
										</p>

										<div class="form-check d-flex justify-content-center">
											<p class="mb-5 pb-lg-2" style="color: #393f81;">
												Already have an account - <a
													class="text-decoration-underline" href="driverLogin.jsp"
													style="color: #393f81; font-weight: 500;">Login here</a>
											</p>
										</div>

										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="submit" class="btn btn-primary btn-lg">Register</button>
										</div>

									</form>

								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">



									<img src="../assets/img/driverLogin.jpg" class="img-fluid mb-5"
										style="height: 100vh !important;">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.html" flush="true" />

	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> -->
</body>
</html>