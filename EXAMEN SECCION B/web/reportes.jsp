<%-- 
    Document   : reportes
    Created on : Apr 18, 2022, 5:13:43 PM
    Author     : itsnotmel
--%>

<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes</title>
    </head>
    <body>
        
        <table border="2">
            <thead>
                <tr>
                    <th>Boleta</th>
                    <th>Nombre</th>
                    <th>Reporte</th>
                    
                </tr>        
            </thead>
            <tbody>
                
            
        <%
            //aqui ya puedo incorporar java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String username, url, password, driver;
            
            url = "jdbc:mysql://localhost/alumnos";
            username= "root";
            password = "n0m3l0";
            
            driver = "com.mysql.jdbc.Driver";
            
            try{
                //conectarnos
                Class.forName(driver);
                con = DriverManager.getConnection(url, username, password);
                
                try{
                    String q = "select * from alumnos order by boleta asc";
                    
                    set = con.createStatement();
                    
                    rs = set.executeQuery(q);
                    
                    while(rs.next()){
                    
                    
                    
                    %>
                    <tr>
                        <td><%=rs.getInt("boleta")%></td>
                        <td><%=rs.getString("nombre")%></td>
                        <td><%=rs.getString("repo")%></td>
                        
                    </tr>
                    <%
                        }
                }catch(SQLException es){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se puede consultar la tabla</h1>
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
            </tbody>
        </table>
            <a href="homea.html">Regresar a Principal</a>
            <br>

    </body>
</html>