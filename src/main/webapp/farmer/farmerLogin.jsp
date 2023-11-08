<%@page import="java.awt.ActiveEvent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="base.html" flush="true"/>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> -->
<title>E-Krishak - (Farmers' Fortune)</title>

</head>
<body>
<jsp:include page="../navbar.html" flush="true"/>



<section style="background-color: #eee; height: 100% !important;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://plus.unsplash.com/premium_photo-1678344177250-bfdbed89fc03?auto=format&fit=crop&q=80&w=987&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="loginProcess.jsp">

                  <div class="d-flex align-items-center justify-content-center mb-3 pb-1">
                   
                    <span class="h1 fw-bold mb-0 text-center">
                    
                    Howdy! Farmer 🧑‍🌾
                    </span>
                  </div>
                  

                  <h5 class="fw-normal mb-3 pb-3 text-center text-decoration-underline" style="letter-spacing: 1px;">Login to Your Account</h5>

                  <div class="form-outline mb-4">
                     <label class="form-label" for="form2Example17">Mobile Number</label>
                    <input type="text" id="form2Example17" class="form-control form-control-lg" name="mobile"/>
                   
                  </div>

                  <div class="form-outline mb-4">
                     <label class="form-label" for="form2Example27">Password</label>
                    <input type="password" id="form2Example27" class="form-control form-control-lg" name="pass"/>
                   
                  </div>

                  <div class="pt-1 mb-4">
                    <button type="submit" class="btn btn-dark btn-lg btn-block" type="button">Login</button>
                  </div>

                  <a class="small text-muted" href="#!">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a class="text-decoration-underline" href="farmerSignup.jsp"
                      style="color: #393f81;">Register here</a></p>
                  
                </form>
             

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<jsp:include page="../footer.html" flush="true"/>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> -->
</body>
</html>