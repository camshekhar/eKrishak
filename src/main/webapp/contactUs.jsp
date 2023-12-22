<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String contact_msg = (String) session.getAttribute("contact_msg");
String error = (String) session.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="base.html" flush="true" />



<title>Contact Us - eKrishak</title>
</head>
<body>
	<jsp:include page="topbar.html" flush="true" />
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
					href="/eKrishak/#aboutus" class="nav-item nav-link">About Us</a> <a
					href="/eKrishak/contactUs.jsp" class="nav-item nav-link active">Contact</a>

				<div class="nav-item dropdown">
					<a href="#"
						class="nav-link dropdown-toggle bg-warning text-success fw-bold"
						data-bs-toggle="dropdown">Login / Sign Up</a>
					<div class="dropdown-menu m-0">
						<a href="/eKrishak/farmer/farmerLogin.jsp"
							class="dropdown-item  text-center p-2">Farmer</a> <a
							href="/eKrishak/vendor/vendorLogin.jsp"
							class="dropdown-item  text-center p-2">Vendor</a> <a
							href="/eKrishak/driver/driverLogin.jsp"
							class="dropdown-item  text-center p-2">Driver</a>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<!-- Navbar End -->


	<%
	if (contact_msg != null) {
	%>
	<div
		class="alert d-flex align-items-center alert-success alert-dismissible p-0 mx-auto w-100"
		role="alert" style="height: 20vh;">
		<svg class="bi" role="img">
			<use xlink:href="#check-circle-fill" /></svg>
		<div class="fw-bold text-center" style="font-size: 1.5rem;">
			<%=contact_msg%>
			🥳.
		</div>
		<button type="button"
			onclick="<%session.removeAttribute("contact_msg");%>"
			class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

	</div>

	<%
	}
	%>

	<%
	if (error != null) {
	%>
	<div
		class="alert d-flex align-items-center alert-danger alert-dismissible p-0 mx-auto w-100"
		role="alert" style="height: 20vh;">
		<svg class="bi" role="img">
			<use xlink:href="#check-circle-fill" /></svg>
		<div class="fw-bold text-center" style="font-size: 1.5rem;">
			<%=error%>
			😓.
		</div>
		<button type="button"
			onclick="<%session.removeAttribute("error");%>" class="btn-close"
			data-bs-dismiss="alert" aria-label="Close"></button>

	</div>

	<%
	}
	%>
	<div class="container mt-4">

		<!--Section: Contact v.2-->
		<section class="mb-4 p-5 w-50 mx-auto bg-secondary text-white"
			style="background-color: #eee; border-radius: 20px; box-shadow: 2px 6px 8px rgba(22, 26, 22, .18);">

			<!--Section heading-->
			<h2
				class="h1-responsive font-weight-bold text-center my-4 text-white">Contact
				us</h2>
			<hr>
			<!--Section description-->
			<p class="text-center w-responsive mx-auto mb-5">Do you have any
				questions? Please do not hesitate to contact us directly. Our team
				will come back to you within a matter of hours to help you.</p>

			<div class="row">

				<!--Grid column-->
				<div class="col-md-12 mb-md-0 mb-5">
					<form id="contact-form" name="contact-form"
						action="contactProcess.jsp" onsubmit="return validateForm()"
						method="POST">

						<!--Grid row-->
						<div class="row">

							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-0">
									<label for="name" class=""><span
										class="text-danger fw-bold">*</span> Your Name:</label> <input
										type="text" id="name" name="name" class="form-control"
										style="background-color: #eee; border-radius: 20px;" required>

								</div>
							</div>
							<!--Grid column-->

							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-0">
									<label for="text" class=""><span
										class="text-danger fw-bold">*</span> Your Mobile: (10-Digits)</label>
									<input type="text" name="mobile" class="form-control"
										maxlength="10"
										style="background-color: #eee; border-radius: 20px;" required>

								</div>
							</div>
							<!--Grid column-->

						</div>
						<!--Grid row-->

						<!--Grid row-->
						<div class="row my-2">
							<div class="col-md-12">

								<label class="form-label" for="form3Example1q"><span
									class="text-danger fw-bold">*</span> Query Subject:</label> <select
									class="form-outline select p-2 cursor-pointer w-100"
									name="subject"
									style="background-color: #eee; border-radius: 20px; border: none; cursor: pointer;"
									required>
									<option value="null" disabled selected>....Select
										Subject....</option>
									<option value="Support">Support and Help</option>
									<option value="Feedback">Feedback</option>
									<option value="Others">Others</option>
								</select>

							</div>
						</div>
						<!--Grid row-->

						<!--Grid row-->
						<div class="row">

							<!--Grid column-->
							<div class="col-md-12">

								<div class="md-form">
									<label for="message"><span class="text-danger fw-bold">*</span>
										Your Message:</label>
									<textarea type="text" id="message" name="message" rows="4"
										class="form-control md-textarea"
										style="background-color: #eee; border-radius: 10px;" required></textarea>

								</div>

							</div>
						</div>
						<!--Grid row-->

						<p class="mt-4">
							<strong>Note: </strong> Fields marked with <span
								class="text-danger fw-bold">*</span> are mandatory to fill.
						</p>

						<div class="text-center text-md-left mt-4">
							<button type="submit" class="btn btn-custom px-4">Send</button>
						</div>
					</form>
				</div>


				<!--Grid column-->


			</div>

		</section>
		<!--Section: Contact v.2-->
	</div>

	<jsp:include page="footer.html" flush="true" />



</body>
</html>