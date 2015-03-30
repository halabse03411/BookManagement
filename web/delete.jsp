<%-- 
    Document   : delete
    Created on : Feb 5, 2015, 1:37:59 PM
    Author     : dat
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
        <form>
            <%
                //read values of parameters that are sent from ADO.jsp
                String bid = request.getParameter("bid");
                String pname = request.getParameter("bname");
                String btnYes = request.getParameter("btnYes");
                String sql = "delete from Book where Book_ID= " + bid;
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
                //remove pid
                conn.createStatement().executeUpdate(sql);
                conn.close();
                //return page index.jsp
                response.sendRedirect("./search.jsp");

            %>
            
        </form>
        
    </body>
</html>
