<%-- 
    Document   : bookDetail
    Created on : Mar 30, 2015, 3:35:45 PM
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
            String bId = request.getParameter("bookId");
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("jdbc:odbc:project");
            String sql = "Select * from Book where Book_ID like '%"+bId+"%'";
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while(rs.next()) {
                //rs.getB
        %>
        <center>
        <table>
            <tr>
            <h1>Book Details</h1>
            </tr>
            <tr>
                <td>Book ID:</td>
                <td><%=rs.getInt(1)%></td>
            </tr>
            <tr>
                <td>Title:</td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><%=rs.getString(3)%></td>
            </tr>
            <tr>
                <td>Selling in?</td>             
                    <%
                //out.println(rs.getByte(4));
                if(rs.getByte(4) == 1) {
                    %>
                <td>
                    <input type="radio" name="check" value="" checked="checked"/>US             
                </td>
                <td>
                    <input type="radio" name="check" value="" />International
                </td>
                <%
                }
                else {
                %>
                <td>
                    <input type="radio" name="check" value="" />US
                    <input type="radio" name="check" value="" checked="checked"/>International
                </td>
                <%
                }
                %>
            </tr>
            <tr>
                <td>Issued Date</td>
                <td><%=rs.getDate(5)%></td>
            </tr>
            <tr>
                <td>Discount?</td>
                <%
                if(rs.getByte(6) == 1) {
                %>
                <td><input type="checkbox" name="" value="ON" checked="checked" /></td>
                <%
                }
                else {
                %>
                <td><input type="checkbox" name="" value="ON" /></td>
                <%
                }
                %>
            </tr>
            <tr>
                <td>Status</td>
                <%
                if(rs.getByte(7) == 1) {
                %>
                <td>Available</td>
                <%
                }
                else {
                %>
                <td>Disable</td>
                <%
                }
                %>               
            </tr>
            <tr>
                <td>Discount from</td>
                <td><%=rs.getDate(8)%> to <%=rs.getDate(9)%></td>
            </tr>
            <tr>
                <td>Price(USD)</td>
                <td><%=rs.getDouble(10)%></td>
            </tr>       
        </table>
            <input type="submit" value="Back" name="btnBack" onClick="window.location='search.jsp'" />
        </center>
        <%
            }
        %>
    </body>
</html>
