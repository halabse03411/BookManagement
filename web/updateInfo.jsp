<%-- 
    Document   : updateInfo
    Created on : Mar 14, 2015, 11:16:24 PM
    Author     : dat
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        <form name="mform" action="checkUpdateBook.jsp">
        <%
            String bid = request.getParameter("bid");
            session.setAttribute("bid", bid);
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
            String sql = "select * from Book where Book_ID = "+session.getAttribute("bid");
            PreparedStatement ps = conn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                int bID = rs.getInt(1);
%>
            <input type="hidden" name="txtBID" value="<%=bID%>" />
            <table>
            <tr>
                <td>Book ID</td><td><%=bID%></td>
            </tr>
            <tr>
                <td>Title<FONT color="#FF0000">*</FONT>:</td><td><input type="text" name="txtTitle" value="<%=rs.getString(2)%>" /></td>
            </tr>
            <tr>
                <td>Description<FONT color="#FF0000">*</FONT>:</td><td><input type="text" name="txtDes" value="<%=rs.getString(3)%>" /></td>
            </tr>
            <tr>
                <td>Selling in</td>
                    <%if(rs.getByte(4)==1){%>
                        <td><input type="radio" name="Selling" value="1" checked="checked" />US
                        <input type="radio" name="Selling" value="0" />International</td>
                <%}else{%>
                        <td><input type="radio" name="Selling" value="1"/>US
                        <input type="radio" name="Selling" value="0" checked="checked"/>International</td>
                <%}%>
            </tr>
            <tr>
                <td>Issued Date<FONT color="#FF0000">*</FONT>:</td><td><input type="text" name="txtIssDate" value="<%=rs.getDate(5)%>" /></td>
            </tr>
            <tr>
                <td>Discount?</td>
                    <%if(rs.getByte(6)==1){%>
                        <td><input type="checkbox" name="chbDiscount" value="ON" checked="checked" />
                    <%}else{%> 
                        <td><input type="checkbox" name = "chbDiscount" value = "ON" /></td><%}%>
            </tr>
            <tr>
                <td>Status<FONT color="#FF0000">*</FONT>:</td><td><select name="ddlStatus">
                    <%if(rs.getByte(7)==1){%>
                        <option>Available</option>
                        <option>Not Available</option>
                    <%}else{%>
                        <option>Not Available</option>
                        <option>Available</option>
                            <%}%>
                </td>
            </select>
            </tr>
            <tr>
                <td>Discount from<FONT color="#FF0000">*</FONT>:</td><td><input type="text" name="txtDiscfrom" value="<%=rs.getDate(8)%>" /> to <input type="text" name="txtDiscto" value="<%=rs.getDate(9)%>" /></td>
            </tr>
            <tr>
                <td>Price(USD)</td><td><input type="text" name="txtPrice" value="<%=rs.getFloat(10)%>">>0</td>
            </tr>
            <tr><td><input type="submit" value="Save" name="btnSave" /></td><td><input type="reset" value="Reset" name="btnReset" /></td></tr>
            </table>
     <% }conn.close();%>
        
        </form>
    </body>
</html>
