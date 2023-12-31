<%@page import="java.awt.ActiveEvent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("mobile");
String regMsg = (String) session.getAttribute("success");
String logMsg = (String) session.getAttribute("logMsg");

if (mobile != null) {
	response.sendRedirect("vendorDashboard.jsp");
}
%>

<jsp:include page="base.html" flush="true" />

<title>Driver Login - eKrishak</title>

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

	<%
	if (regMsg != null) {
	%>
	<div
		class="alert d-flex align-items-center alert-success alert-dismissible p-0 mx-auto w-100"
		role="alert" style="height: 20vh;">
		<svg class="bi" role="img">
			<use xlink:href="#check-circle-fill" /></svg>
		<div class="fw-bold text-center" style="font-size: 1.5rem;">
			<%=regMsg%>
			🥳.
		</div>
		<button type="button"
			onclick="<%session.removeAttribute("success");%>" class="btn-close"
			data-bs-dismiss="alert" aria-label="Close"></button>

	</div>

	<%
	}
	%>

	<%
	if (logMsg != null) {
	%>
	<div
		class="alert d-flex align-items-center alert-danger alert-dismissible p-0 mx-auto w-100"
		role="alert" style="height: 20vh;">
		<svg class="bi" role="img">
			<use xlink:href="#check-circle-fill" /></svg>
		<div class="fw-bold text-center" style="font-size: 1.5rem;">
			<%=logMsg%>
			😓.
		</div>
		<button type="button"
			onclick="<%session.removeAttribute("logMsg");%>" class="btn-close"
			data-bs-dismiss="alert" aria-label="Close"></button>

	</div>

	<%
	}
	%>

	<section style="background-color: #eee; height: 100% !important;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-10">
					<div class="card" style="border-radius: 1rem;">
						<div class="row g-0">
							<div class="col-md-6 col-lg-5 d-none d-md-block">
								<img src="../assets/img/driverLogin.jpg" alt="login form"
									class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
							</div>
							<div class="col-md-6 col-lg-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black">

									<form method="post" action="loginProcess.jsp" name="contact-form" onsubmit="return validateForm()">

										<div
											class="d-flex align-items-center justify-content-center mb-3 pb-1">

											<span class="h1 fw-bold mb-0 text-center"> Howdy!
												Driver 🚗 </span>
										</div>


										<h5
											class="fw-normal mb-3 pb-3 text-center text-decoration-underline"
											style="letter-spacing: 1px;">Login to Your Account</h5>

										<div class="form-outline mb-4">
											<label class="form-label" for="form2Example17"><span
												class="text-danger fw-bold">*</span> Mobile Number</label> <input
												type="text" id="form2Example17"
												class="form-control form-control-lg" name="mobile" maxlength="10" required/>

										</div>

										<div class="form-outline mb-4">
											<label class="form-label" for="form2Example27"><span
												class="text-danger fw-bold">*</span> Password</label> <input
												type="password" id="form2Example27"
												class="form-control form-control-lg" name="password"
												required />

										</div>
										<p class="mt-4">
											<strong>Note: </strong> Fields marked with <span
												class="text-danger fw-bold">*</span> are mandatory to fill.
										</p>
										<div class="pt-1 mb-4">
											<button type="submit" class="btn btn-dark btn-lg btn-block"
												type="button">Login</button>
										</div>

										<a class="small text-muted" href="#!">Forgot password?</a>
										<p class="mb-5 pb-lg-2" style="color: #393f81;">
											Don't have an account? <a class="text-decoration-underline"
												href="driverSignup.jsp" style="color: #393f81;">Register
												here</a>
										</p>

									</form>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.html" flush="true" />
	
</body>
</html>