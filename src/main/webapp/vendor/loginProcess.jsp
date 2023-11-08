<%@page import="vendor.LoginDao"%>  
<jsp:useBean id="obj" class="vendor.LoginUser"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
boolean status=LoginDao.validate(obj);  
if(status){  
	
	String mobile = Integer.toString(LoginDao.mobile);

// System.out.println(mobile);
 session.setAttribute("loggedIn", true);
session.setAttribute("mobile",mobile);  
// 	out.print("Sorry, email or password error"); 
response.sendRedirect("/eKrishak/vendor/vendorDashboard.jsp"); 




}  
else  
{  
	session.setAttribute("loggedIn", false);
response.sendRedirect("/eKrishak/vendor/vendorLogin.jsp");

%>  

<jsp:include page="../index.jsp"></jsp:include>  
<%  
}  
%>  