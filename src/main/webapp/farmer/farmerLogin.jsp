
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
String mobile = (String) session.getAttribute("mobile");
String regMsg = (String)session.getAttribute("success");
String logMsg = (String)session.getAttribute("logMsg");

if (mobile != null) {
	response.sendRedirect("farmerDashboard.jsp");
}

%>

<jsp:include page="base.html" flush="true" />

<title>Farmer Login - eKrishak</title>

</head>
<body>
	<jsp:include page="../navbar.html" flush="true" />

<% if(regMsg != null) { %>
<div class="alert d-flex align-items-center alert-success alert-dismissible p-0 mx-auto h-40"  role="alert">
  <svg class="bi" role="img" ><use xlink:href="#check-circle-fill"/></svg>
  <div class="fw-bold">
	 <%= regMsg %> 🥳.
 </div>
 <button type="button" onclick="<% session.removeAttribute("success"); %>" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>

<%} %>

<% if(logMsg != null) { %>
<div class="alert d-flex align-items-center alert-danger alert-dismissible p-0 mx-auto h-40"  role="alert">
  <svg class="bi" role="img" ><use xlink:href="#check-circle-fill"/></svg>
  <div class="fw-bold">
	 <%= logMsg %> 😓.
 </div>
 <button type="button" onclick="<% session.removeAttribute("logMsg"); %>" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>

<%} %>

	<section style="background-color: #eee; height: 100% !important;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-10">
					<div class="card" style="border-radius: 1rem;">
						<div class="row g-0">
							<div class="col-md-6 col-lg-5 d-none d-md-block">
								<img src="../assets/img/farmerLogin.jpg" alt="login form"
									class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
							</div>
							<div class="col-md-6 col-lg-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black">

									<form action="loginProcess.jsp">

										<div
											class="d-flex align-items-center justify-content-center mb-3 pb-1">

											<span class="h1 fw-bold mb-0 text-center"> Howdy!
												Farmer 🧑‍🌾 </span>
										</div>


										<h5
											class="fw-normal mb-3 pb-3 text-center text-decoration-underline"
											style="letter-spacing: 1px;">Login to Your Account</h5>

										<div class="form-outline mb-4">
											<label class="form-label" for="form2Example17">Mobile
												Number</label> <input type="text" id="form2Example17"
												class="form-control form-control-lg" name="mobile" />

										</div>

										<div class="form-outline mb-4">
											<label class="form-label" for="form2Example27">Password</label>
											<input type="password" id="form2Example27"
												class="form-control form-control-lg" name="password" />

										</div>

										<div class="pt-1 mb-4">
											<button type="submit" class="btn btn-dark btn-lg btn-block"
												type="button">Login</button>
										</div>

										<a class="small text-muted" href="#!">Forgot password?</a>
										<p class="mb-5 pb-lg-2" style="color: #393f81;">
											Don't have an account? <a class="text-decoration-underline"
												href="farmerSignup.jsp" style="color: #393f81;">Register
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
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> -->
</body>
</html>