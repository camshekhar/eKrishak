<%@page import="common.LoginDao"%>  
<jsp:useBean id="obj" class="common.LoginUser"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
boolean status=LoginDao.validate(obj);  
if(status){  
	
	String mobile = Integer.toString(LoginDao.mobile);

// System.out.println(mobile);
session.setAttribute("mobile",mobile);  
// 	out.print("Sorry, email or password error"); 
response.sendRedirect("/eKrishak/farmer/farmerDashboard.jsp"); 




}  
else  
{  
 
response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
out.print("Sorry, email or password error"); 
%>  
<jsp:include page="../index.jsp"></jsp:include>  
<%  
}  
%>  