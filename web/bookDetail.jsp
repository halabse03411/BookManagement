<%-- 
    Document   : bookDetail
    Created on : Mar 14, 2015, 9:59:32 PM
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
        <%
            String bID = request.getParameter("bid");
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
                    String sql = "select * from Book where Book_ID = '"+bID+"'";
                    ResultSet rs = conn.createStatement().executeQuery(sql);
                    if(rs.next()){%>
                    <table>
                    <tr>
                        <td>Book ID</td><td><%=rs.getInt(1)%></td>
                    </tr>
                    <tr>
                        <td>Title</td><td><%=rs.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>Description</td><td><%=rs.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>Selling in</td>
                            <%if(rs.getByte(4)==1){%>
                                <td><input type="radio" name="Selling" value="1" checked="checked" />US
                                <input type="radio" name="Selling" value="0" />International</td>
                        <%}else{%>
                                <td><input type="radio" name="Selling" value="0"/>US
                                <input type="radio" name="Selling" value="1" checked="checked"/>International</td>
                        <%}%>
                    </tr>
                    <tr>
                        <td>Issued Date</td><td><%=rs.getDate(5)%></td>
                    </tr>
                    <tr>
                        <td>Discount?</td>
                            <%if(rs.getByte(6)==1){%>
                                <td><input type="checkbox" name="chbDiscount" value="ON" checked="checked" />
                            <%}else{%> 
                                <td><input type="checkbox" name = "chbDiscount" value = "ON" /></td><%}%>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <%if(rs.getByte(7)== 1){%>
                            <td>Available</td>
                        <%}else{%>
                            <td>Not Available</td>
                        <%}%>
                    </tr>
                    <tr>
                        <td>Discount from</td><td><%=rs.getDate(8)%> to <%=rs.getDate(9)%></td>
                    </tr>
                    <tr>
                        <td>Price(USD)</td><td><%=rs.getFloat(10)%></td>
                    </tr>
                    <tr><td><input type="submit" value="Back" name="btnBack" onclick ="window.location='search.jsp'"/></td></tr>
                    </table>
    <%}%>
    </body>
</html>
