<%@page import="common.RegisterDao"%>  
<jsp:useBean id="obj" class="common.User"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
int status=RegisterDao.register(obj);  
if(status>0) 

response.sendRedirect("/eKrishak/farmer/farmerLogin.jsp");
  
 
// Object user = session.getAttribute("id");


%>  

