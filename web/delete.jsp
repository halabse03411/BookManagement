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
                //start a new session if request comes from index.jsp
                if(btnYes == null)
                    session.setAttribute("bid", bid);
                //if btnYes is clicked
                if(btnYes != null && btnYes.length()>0){
                    String sql = "delete from Book where Book_ID= " + session.getAttribute("bid");
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
                    //remove pid
                    conn.createStatement().executeUpdate(sql);
                    conn.close();
                    //return page index.jsp
                    response.sendRedirect("./search.jsp");
                }
            %>
            <p>Are you sure to delete product named"<%=pname%>"</p>
            <input type="submit" value="Yes" name="btnYes" />
            <input type="button" value="No" name="btnNo" onclick ="window.location='search.jsp'" />
        </form>
        
    </body>
</html>
