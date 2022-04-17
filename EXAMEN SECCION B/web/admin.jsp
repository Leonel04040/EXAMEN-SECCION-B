<%-- 
    Document   : admin
    Created on : Apr 16, 2022, 2:07:57 PM
    Author     : itsnotmel
--%>

<html>
<%@ page import ="java.sql.*" %>
<%
    try{
          
        String pass2 = request.getParameter("pass2");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select pass from alumnos where pass=?");
        
        pst.setString(1, pass2);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>
<p> <a href="index.html"> Ir a index</a></p>

</html>