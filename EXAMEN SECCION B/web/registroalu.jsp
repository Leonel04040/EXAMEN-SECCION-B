<%-- 
    Document   : registroalumno
    Created on : 4/04/2022, 07:30:00 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //aqui ya puedo incorporar java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String username, url, password, driver;
            
            url = "jdbc:mysql://localhost/Alumnu";
            username= "root";
            password = "n0m3l0";
            
            driver = "com.mysql.jdbc.Driver";
            
            try{
                //conectarnos
                Class.forName(driver);
                con = DriverManager.getConnection(url, username, password);
                
                try{
                    String nombre, appat, apmat, grupo;
                    int boleta, pass2;
                    
                    nombre = request.getParameter("nombre");
                    appat = request.getParameter("appat");
                    apmat = request.getParameter("apmat");
                    grupo = request.getParameter("grupo");
                    boleta = Integer.parseInt(request.getParameter("boleta"));
                    pass2=Integer.parseInt(request.getParameter("pass2"));
                    set = con.createStatement();
                    
                    String q = "insert into alumnos "
                            + "values ("+boleta+", '"+nombre+"', '"+appat+"', '"+apmat+"', '"+grupo+"','"+pass2+"')";
                    
                    int registro = set.executeUpdate(q);
                    
                    %>
                    <h1>Registro Exitoso
                        <a href="home.html">Ir a Home</a> </h1>
                    <%
                
                }catch(SQLException es){
                    System.out.println("Error al registrar ");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se pudo registrar </h1>
                    <%
                
                
                }
            }catch(Exception e){
                System.out.println("Error al conecta la BD");
                System.out.println(e.getMessage());
                %>
                <h1>No conecto con la BD T_T</h1>
                <%
            
            }
            
            %>
        
            <a href="index.html">Regresar a Principal</a>
    </body>
</html>
