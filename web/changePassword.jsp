<%-- 
    Document   : changePassword
    Created on : Mar 13, 2015, 10:38:58 PM
    Author     : Apollo
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
    <center>
        <%
        String userName = ""+session.getAttribute("userName");
        String save = request.getParameter("btnSave");
        String back = request.getParameter("btnBack");
        if(save!=null && save.length()>0){
            
            //String sql = "Update User_Account set User_Password='"+ request.getParameter("txtPassword") +"' where User_Name="+userName;
            String sql = "Update User_Account set User_Password='"+request.getParameter("txtPassword")+"' where User_Name='"+userName+"'";
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            conn.close();
            //response.sendRedirect("./changePassword.jsp");
            }else {
            if(back!=null && back.length()>0)
                response.sendRedirect("./home.jsp");
                       }
        %>
        
        <form name="mform" method="POST">
            <table>
                <tr>
                    <td>User name:</td>
                    <td><%=userName%></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="txtPassword" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Back" name="btnBack"/></td>
                    <td><input type="submit" value="Save" name="btnSave"/></td>
                </tr>
            </table>
        </form>

    </center>
</body>
</html>
