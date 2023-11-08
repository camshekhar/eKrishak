<%@page import="vendor.RegisterDao"%>  
<jsp:useBean id="obj" class="vendor.User"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
int status=RegisterDao.register(obj);  
if(status>0) 

response.sendRedirect("/eKrishak/vendor/vendorLogin.jsp");
  
 
// Object user = session.getAttribute("id");


%>  

