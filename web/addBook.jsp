<%-- 
    Document   : addBook
    Created on : Mar 15, 2015, 1:29:42 PM
    Author     : dat
--%>

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
        <form name="mform" action="checkAddBook.jsp">
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
                <td>Issued Date:</td><td><input type="text" name="txtIssDate" value="" /><FONT color="#FF0000">Before current date</FONT></td>
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
        <% 
//        String btnSave = request.getParameter("btnSave");
//        String txtID = request.getParameter("txtBID");
//        String bTitle = request.getParameter("txtTitle");
//        String bDes = request.getParameter("txtDes");
//        String bSellingin = request.getParameter("Selling");
//        String bIssDate = request.getParameter("txtIssDate");
//        String bDisc =request.getParameter("chbDiscount");
//        String bStatus = request.getParameter("ddlStatus");
//        String bDiscfrom =request.getParameter("txtDiscfrom");
//        String bDiscto = request.getParameter("txtDiscto");
//        String bPrice = request.getParameter("txtPrice");
//        if(btnSave != null && btnSave.length()>0){
//            if(Integer.parseInt(bSellingin) == 1){bSellingin = "true";}
//                else{bSellingin = "false";}
//            if(bDisc==null){bDisc="false";}
//                else{bDisc="true";}
//            if(bStatus.equalsIgnoreCase("Not Available")){bStatus="false";}
//                else {bStatus="true";}
//            String sql = "INSERT INTO Book VALUES ('"+bTitle+"','"+bDes+"','"+bSellingin+"','"+bIssDate+"','"+bDisc+"','"+bStatus+"','"+bDiscfrom+"','"+bDiscto+"','"+bPrice+"')";
//            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//            Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.executeUpdate();
//            //conn.createStatement().executeUpdate(sql);
//            conn.close();
//           // return page index.jsp
//            response.sendRedirect("./search.jsp");
//        }
    %>
        </form>
    </body>
</html>
