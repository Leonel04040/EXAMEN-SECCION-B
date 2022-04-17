<%-- 
    Document   : validate
    Created on : 28 Feb, 2015, 8:50:26 AM
    Author     : Lahaul Seth
--%>
<html>
<%@ page import ="java.sql.*" %>
<%
    try{
        String boleta = request.getParameter("boleta");   
        String pass2 = request.getParameter("pass2");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select user,pass from login where user=? and pass=?");
        pst.setString(1, boleta);
        pst.setString(2, pass2);
        ResultSet rs = pst.executeQuery();                        
       if(rs.next()){           
           out.println("Valid login credentials");  
        %>
        <p><a href="home.html">Ir a home</a></p>
        <%
            }
        else{
           out.println("Invalid login credentials");}            
   }
  
    
   
   catch(Exception e){       
    
       out.println("Something went wrong !! Please try again");       

       %>
       <p> <a href="index.html"> Ir a index</a></p>
       <%
   }  

%>
 


</html>
