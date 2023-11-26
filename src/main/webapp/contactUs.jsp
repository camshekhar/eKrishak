<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<a href="/eKrishak" class="nav-item nav-link">Home</a> <a
					href="/eKrishak/farmer/farmerLogin.jsp" class="nav-item nav-link">Farmer</a>
				<a href="/eKrishak/vendor/vendorLogin.jsp" class="nav-item nav-link">Vendor</a>
				<a href="/eKrishak/driver/driverLogin.jsp" class="nav-item nav-link">Driver</a>

				<a href="/eKrishak/contactUs.jsp" class="nav-item nav-link active">Contact</a>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
	<div class="container mt-4">

		<!--Section: Contact v.2-->
		<section class="mb-4 p-5 w-50 mx-auto bg-secondary text-white" style="background-color: #eee; border-radius: 20px; box-shadow: 2px 6px 8px rgba(22, 26, 22, .18);">

			<!--Section heading-->
			<h2 class="h1-responsive font-weight-bold text-center my-4 text-white">Contact
				us</h2>
				<hr>
			<!--Section description-->
			<p class="text-center w-responsive mx-auto mb-5">Do you have any
				questions? Please do not hesitate to contact us directly. Our team
				will come back to you within a matter of hours to help you.</p>

			<div class="row">

				<!--Grid column-->
				<div class="col-md-12 mb-md-0 mb-5">
					<form id="contact-form" name="contact-form" action="#"
						method="POST">

						<!--Grid row-->
						<div class="row">

							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-0">
									<label for="name" class="">Your Name:</label> <input
										type="text" id="name" name="name" class="form-control" style="background-color: #eee; border-radius: 20px;">

								</div>
							</div>
							<!--Grid column-->

							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-0">
									<label for="email" class="">Your Email:</label> <input
										type="text" id="email" name="email" class="form-control" style="background-color: #eee; border-radius: 20px;">

								</div>
							</div>
							<!--Grid column-->

						</div>
						<!--Grid row-->

						<!--Grid row-->
						<div class="row">
							<div class="col-md-12">
								<div class="md-form mb-0">
									<label for="subject" class="">Subject:</label> <input
										type="text" id="subject" name="subject" class="form-control" style="background-color: #eee; border-radius: 20px;">

								</div>
							</div>
						</div>
						<!--Grid row-->

						<!--Grid row-->
						<div class="row">

							<!--Grid column-->
							<div class="col-md-12">

								<div class="md-form">
									<label for="message">Your Message:</label>
									<textarea type="text" id="message" name="message" rows="4"
										class="form-control md-textarea" style="background-color: #eee; border-radius: 10px;"></textarea>

								</div>

							</div>
						</div>
						<!--Grid row-->

					</form>

					<div class="text-center text-md-left mt-4">
						<button class="btn btn-custom px-4"
							>Send</button>
					</div>
					<div class="status"></div>
				</div>
				<!--Grid column-->


			</div>

		</section>
		<!--Section: Contact v.2-->
	</div>

	<jsp:include page="footer.html" flush="true" />
</body>
</html>