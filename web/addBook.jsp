<%-- 
    Document   : addBook
    Created on : Mar 15, 2015, 1:29:42 PM
    Author     : dat
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="mform" action="checkAddBook.jsp" onsubmit="return isValidDate();">
            <%
                String userName = "" + session.getAttribute("userName");
                if (userName.equalsIgnoreCase("null")) {
                    response.sendRedirect("./login.jsp");
                } else {

            %>
            <center>
                <div align="right">Hi, <a href ="login.jsp"><%=userName%></a>, <a href ="login.jsp"> Logout</a></div>
                <h1>Add Book</h1>
                <table>
                    <tr>
                        <td>Title<FONT color="#FF0000">*</FONT>:</td><td><input type="text" name="txtTitle" value="" /></td>
                    </tr>
                    <tr>
                        <td>Description<FONT color="#FF0000">*</FONT>:</td><td><input type="text" name="txtDes" value="" /></td>
                    </tr>
                    <tr>
                        <td>Selling in</td>
                        <td><input type="radio" name="Selling" value="1"/>US
                            <input type="radio" name="Selling" value="0" />International</td>
                    </tr>
                    <tr>
                        <td>Issued Date:</td><td><input type="text" name="txtIssDate" value="" /></td>
                    </tr>
                    <tr>
                        <td>Discount?</td>
                        <td><input type="checkbox" name="chbDiscount" value="ON"/>
                    </tr>
                    <tr>
                        <td>Status<FONT color="#FF0000">*</FONT>:</td><td><select name="ddlStatus">
                                <option>Available</option>
                                <option>Not Available</option>
                        </td>
                        </select>
                    </tr>
                    <tr>
                        <td>Discount from<FONT color="#FF0000">*</FONT>:</td><td><input type="text" name="txtDiscfrom" value="" /> to <input type="text" name="txtDiscto" value="" /></td>
                    </tr>
                    <tr>
                        <td>Price(USD)</td><td><input type="text" name="txtPrice" value="">>0</td>
                    </tr>
                    <tr><td><input type="submit" value="Save" name="btnSave" /></td><td><input type="reset" value="Reset" name="btnReset" /></td></tr>
                </table>
                <a href="homepage.jsp">Home Page</a>
                <%
                    }
                %>
            </center>
        </form>
    </body>

</html>

