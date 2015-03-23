<%-- 
    Document   : deleteAccount
    Created on : Mar 23, 2015, 11:45:41 PM
    Author     : Apollo
--%>

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
            if(session.getAttribute("userName").equals("admin")){
                %>
                <h1>You can not delete administrator account!!!</h1>
                <a href="home.jsp">Home</a>
                <%
            }else{
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
                String sql = "Delete from User_Account where User_Name = '"+session.getAttribute("userName")+"'";
                conn.createStatement().executeUpdate(sql);
                conn.close();
                session.invalidate();
                response.sendRedirect("./login.jsp"); 
            }
            %>
    </body>
</html>
