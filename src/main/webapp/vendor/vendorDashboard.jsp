<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="connection.*, java.sql.*"%>
    
    
    
<% String mobile = (String)session.getAttribute("mobile"); 
	
boolean status=false;  
String fname="", lname="", city="", email="";
try{  
	
DB_Connection connection = new DB_Connection(); 
	
Connection con =  connection.get_connection();  
              
PreparedStatement ps=con.prepareStatement(  
    "Select * from vendor_details where contact_no=?");  
  
ps.setInt(1, Integer.parseInt(mobile));  
              
ResultSet rs = ps.executeQuery();  

status=rs.next(); 

if (status) {
    fname = rs.getString(2);
    lname = rs.getString(3);
    city = rs.getString(5);
    email = rs.getString(7);
    
}


}

catch(Exception e){}

%>
<!DOCTYPE html>
<html>
<head>



<jsp:include page="base.html" flush="true"/>

<title>

<% if(mobile == null){
	out.print("404 - Not Found");
	
}

else{
	out.println("Welcome, " + fname.toUpperCase()); 
	
}

%>

</title>
</head>
<body>
 <jsp:include page="../navbar.html" flush="true"/>

<% if(mobile == null){
	out.print("<h1 class='text-center'>404 - Not Found</h1>");
	
}

else{
	out.print("<h1 class='text-center text-success'> Welcome, " + fname.toUpperCase() + "</h1>"); 
	
	out.print("<form class='d-flex justify-content-center align-item-center' method='post' action='logout.jsp'><button class='btn btn-danger text-center rounded rounded-pill' type='submit'>Logout</button></form>");
	
	
}

%>



    <script type="text/javascript">
      function googleTranslateElementInit() {
        new google.translate.TranslateElement(
          { pageLanguage: "en" },
          "google_translate_element"
        );
      }
    </script>
    <script
      type="text/javascript"
      src="https://translate.google.com/translate_a/element.js?
cb=googleTranslateElementInit"
    ></script>
    <script src="main.js"></script>


</body>
</html>