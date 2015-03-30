<%-- 
    Document   : delByAdmin
    Created on : Mar 30, 2015, 9:19:44 PM
    Author     : cuwar1994
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String userName = session.getAttribute("userName").toString();
                String accType;
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection conn = DriverManager.getConnection("jdbc:odbc:project");
                String sql = "Select * from User_Account where User_Id ='" +request.getParameter("id")+"'";
                ResultSet rs = conn.createStatement().executeQuery(sql); 
                rs.next();
                    accType = rs.getString(5);
                
                conn.close();
                if (accType.equals("admin")) {
                    
        %>
        <h1>You can not delete administrator account!!!</h1>
        
        <%                        
                } 
                else {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                     conn = DriverManager.getConnection("Jdbc:Odbc:project");
                     sql = "Delete from User_Account where User_Id = '" + request.getParameter("id") + "'";
                    conn.createStatement().executeUpdate(sql);
                    conn.close();
                    out.println("<h2>Deleted successfully</h2>");
                }
            } catch (NullPointerException ne) {
                response.sendRedirect("./login.jsp");
            }
        %>
        <a href="searchAccount.jsp">Back</a>
    </body>
</html>
