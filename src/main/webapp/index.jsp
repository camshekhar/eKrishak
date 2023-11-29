<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="connection.*, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

<jsp:include page="base.html" flush="true" />

<%
DB_Connection connection = null;
boolean status = false;
int fCount = 0, vCount = 0, ordCount = 0, dCount = 0;

try {
	connection = new DB_Connection();

	String fQuery = "select count(*) from farmer_details";
	String vQuery = "select count(*) from vendor_details";
	String ordQuery = "select count(*) from crop_order_details";
	String dQuery = "select count(*) from driver_details";

	ResultSet f_rs = connection.getRecords(fQuery);
	ResultSet v_rs = connection.getRecords(vQuery);
	ResultSet ord_rs = connection.getRecords(ordQuery);
	ResultSet d_rs = connection.getRecords(dQuery);

	if (f_rs.next()) {
		fCount = f_rs.getInt(1);
	}
	if (v_rs.next()) {
		vCount = v_rs.getInt(1);
	}
	if (ord_rs.next()) {
		ordCount = ord_rs.getInt(1);
	}
	if (d_rs.next()) {
		dCount = d_rs.getInt(1);
	}

} catch (Exception e) {
	System.out.println(e);
} finally {
	connection.closeConnection();
}
%>

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
				<a href="/eKrishak" class="nav-item nav-link active">Home</a> <a
					href="/eKrishak/#aboutus" class="nav-item nav-link">About Us</a> <a
					href="/eKrishak/contactUs.jsp" class="nav-item nav-link">Contact</a>

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
	<!-- Carousel Start -->
	<div class="container-fluid p-0">
		<div id="header-carousel" class="carousel slide carousel-fade"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="w-100 h-50" src="assets/img/carousel-1.jpg" alt="Image">
					<div
						class="carousel-caption top-0 bottom-0 start-0 end-0 d-flex flex-column align-items-center justify-content-center">
						<div class="text-start p-5" style="max-width: 900px;">
							<h3 class="text-white">For Farmers</h3>
							<h1 class="display-1 text-white mb-md-4">Crops Selling and
								Transportation</h1>
							<a href="farmer/farmerLogin.jsp"
								class="btn btn-primary py-md-3 px-md-5 me-3">Farmers</a> <a
								href="contactUs.jsp" class="btn btn-secondary py-md-3 px-md-5">Contact
								Us</a>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="w-100" src="assets/img/carousel-2.jpg" alt="Image">
					<div
						class="carousel-caption top-0 bottom-0 start-0 end-0 d-flex flex-column align-items-center justify-content-center">
						<div class="text-start p-5" style="max-width: 900px;">
							<h3 class="text-white">For Vendors</h3>
							<h1 class="display-1 text-white mb-md-4">Purchase Crops
								Hassle Free</h1>
							<a href="vendor/vendorLogin.jsp"
								class="btn btn-primary py-md-3 px-md-5 me-3">Vendors</a> <a
								href="contactUs.jsp" class="btn btn-secondary py-md-3 px-md-5">Contact</a>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#header-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#header-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- Carousel End -->


	<!-- Banner Start -->
	<div class="container-fluid banner mb-5">
		<div class="container">
			<div class="row gx-0">
				<div class="col-md-6">
					<div
						class="bg-primary bg-cropselling d-flex flex-column justify-content-center p-5"
						style="height: 300px;">
						<h3 class="text-white mb-3">Crops Selling</h3>
						<p class="text-white">
							We at <strong>eKrishak</strong> provides services of Crops
							Selling for farmers at profitable price direct to Vendors.
						</p>
						<a class="text-white fw-bold" href="#">Read More<i
							class="bi bi-arrow-right ms-2"></i></a>
					</div>
				</div>
				<div class="col-md-6">
					<div
						class="bg-secondary bg-transportation d-flex flex-column justify-content-center p-5"
						style="height: 300px;">
						<h3 class="text-white mb-3">Crops Transportation</h3>
						<p class="text-white">
							We at <strong>eKrishak</strong> provides services of Crops
							Transportation from farmers to vendors at reasonable pricing by
							patching you directly with transport Drivers.
						</p>
						<a class="text-white fw-bold" href="#">Read More<i
							class="bi bi-arrow-right ms-2"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner Start -->


	<!-- About Start -->
	<div class="container-fluid about pt-5 " id="aboutus">
		<div class="container">
			<div class="row gx-5">
				<div class="col-lg-6 mb-5 mb-lg-0">
					<div
						class="d-flex h-100 border border-5 border-primary border-bottom-0 pt-4">
						<img class="img-fluid mt-auto mx-auto" src="assets/img/about.png">
					</div>
				</div>
				<div class="col-lg-6 pb-5">
					<div class="mb-3 pb-2">
						<h6 class="text-primary text-uppercase">About Us</h6>
						<h1 class="display-5">We Provides Crop Selling and
							Transportation Facilities for Farmers</h1>
					</div>
					<p class="mb-4">E-Krishak is a groundbreaking platform designed
						to revolutionize the agricultural sector. Our website is dedicated
						to empowering farmers and enhancing the efficiency of agricultural
						practices.</p>
					<div class="row gx-5 gy-4">
						<div class="col-sm-6">
							<i class="fa fa-seedling display-1 text-secondary"></i>
							<h4>Fresh Crops</h4>
							<p class="mb-0">
								Seasonal Crops (<strong>Grains, Pulses and Legumes</strong>) are
								directly sold to vendors at profitable price by Farmers to gain
								maximum profit.
							</p>
						</div>
						<div class="col-sm-6">
							<i class="fa fa-car display-1 text-secondary"></i>
							<h4>Safe Transportation</h4>
							<p class="mb-0">We are in touch with skilled drivers who has
								varieties of Transportation vehicles with them.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->


	<!-- Facts Start -->
	<div class="container-fluid bg-primary facts py-5 mb-5">
		<div class="container py-5">
			<div class="row gx-5 gy-4">
				<div class="col-lg-3 col-md-6">
					<div class="d-flex">
						<div
							class="bg-secondary rounded-circle d-flex align-items-center justify-content-center mb-3"
							style="width: 60px; height: 60px;">
							<i class="fa fa-tractor fs-4 text-white"></i>
						</div>
						<div class="ps-4">
							<h5 class="text-white">Registered Farmers</h5>
							<h1 class="display-5 text-white mb-0" data-toggle="counter-up"><%=fCount%></h1>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="d-flex">
						<div
							class="bg-secondary rounded-circle d-flex align-items-center justify-content-center mb-3"
							style="width: 60px; height: 60px;">
							<i class="fa fa-users fs-4 text-white"></i>
						</div>
						<div class="ps-4">
							<h5 class="text-white">Registered Vendors</h5>
							<h1 class="display-5 text-white mb-0" data-toggle="counter-up"><%=vCount%></h1>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="d-flex">
						<div
							class="bg-secondary rounded-circle d-flex align-items-center justify-content-center mb-3"
							style="width: 60px; height: 60px;">
							<i class="fa fa-car fs-4 text-white"></i>
						</div>
						<div class="ps-4">
							<h5 class="text-white">Registered Drivers</h5>
							<h1 class="display-5 text-white mb-0" data-toggle="counter-up"><%=dCount%></h1>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="d-flex">
						<div
							class="bg-secondary rounded-circle d-flex align-items-center justify-content-center mb-3"
							style="width: 60px; height: 60px;">
							<i class="fa fa-truck fs-4 text-white"></i>
						</div>
						<div class="ps-4">
							<h5 class="text-white">Orders Delivered</h5>
							<h1 class="display-5 text-white mb-0" data-toggle="counter-up"><%=ordCount%></h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Facts End -->


	<!-- Features Start -->
	<div class="container-fluid bg-primary feature py-5 pb-lg-0 my-5">
		<div class="container py-5 pb-lg-0">
			<div class="mx-auto text-center mb-3 pb-2" style="max-width: 500px;">
				<h6 class="text-uppercase text-secondary">Features</h6>
				<h1 class="display-5 text-white">Why Choose Us!!!</h1>
			</div>
			<div class="row g-5">
				<div class="col-lg-3">
					<div class="text-white mb-5">
						<div
							class="bg-secondary rounded-pill d-flex align-items-center justify-content-center mb-3"
							style="width: 60px; height: 60px;">
							<i class="fa fa-seedling fs-4 text-white"></i>
						</div>
						<h4 class="text-white">Crops Management</h4>
						<p class="mb-0">
							We are listed with varieties of crops like:<strong>
								Grains, Pulses and Legumes</strong>.
						</p>
					</div>
					<div class="text-white">
						<div
							class="bg-secondary rounded-pill d-flex align-items-center justify-content-center mb-3"
							style="width: 60px; height: 60px;">
							<i class="fa fa-truck fs-4 text-white"></i>
						</div>
						<h4 class="text-white">Hassle-Free Transportation</h4>
						<p class="mb-0">Multiple transportation vehicles available
							with skilled drivers.</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="d-block bg-white h-100 text-center p-5 pb-lg-0">
						<p>Our platform is a one-stop destination for farmers to sell
							their crops at competitive rates, access vital profitable
							information, and efficiently transport their produce to market.
							We’re committed to bridging information gaps, fostering financial
							inclusion, and providing the tools farmers need to thrive.</p>
						<img class="img-fluid" src="img/feature.png" alt="">
					</div>
				</div>
				<div class="col-lg-3">
					<div class="text-white mb-5">
						<div
							class="bg-secondary rounded-pill d-flex align-items-center justify-content-center mb-3"
							style="width: 60px; height: 60px;">
							<i class="fa fa-tractor fs-4 text-white"></i>
						</div>
						<h4 class="text-white">Modern Technologies</h4>
						<p class="mb-0">Labore justo vero ipsum sit clita erat lorem
							magna clita</p>
					</div>
					<div class="text-white">
						<div
							class="bg-secondary rounded-pill d-flex align-items-center justify-content-center mb-3"
							style="width: 60px; height: 60px;">
							<i class="fa fa-phone-alt fs-4 text-white"></i>
						</div>
						<h4 class="text-white">24/7 Support</h4>
						<p class="mb-0">Currently we provide contact support via Call
							and E-Mail.</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="footer.html" flush="true" />


	<!-- Back to Top -->
	<a href="#" class="btn btn-secondary py-3 fs-4 back-to-top"><i
		class="bi bi-arrow-up"></i></a>


</body>

</html>