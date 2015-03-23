<%-- 
    Document   : changePassword
    Created on : Mar 13, 2015, 10:38:58 PM
    Author     : Apollo
--%>

<%@page import="java.sql.Statement"%>
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
//        String oldPassword;
//        if(save!=null && save.length()>0){
//            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//            Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
//            String sql = "Update User_Account set User_Password=? where User_Name=?";            
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, request.getParameter("txtPassword"));
//            ps.setString(2, userName);
//            ps.executeUpdate();
//            ps.close();
//            conn.close();
//        }else {
//            if(back!=null && back.length()>0)
//                response.sendRedirect("./home.jsp");
//                       
//            //get the current password
//            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//            Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
//            String sql = "Select * from User_Account where User_Name='"+userName+"'";
//            ResultSet rs = conn.createStatement().executeQuery(sql);
//            rs.next();
//            oldPassword = rs.getString(5);
//        }
        %>
        
        <form name="mform" method="POST" onsubmit="return isValid();">
            <table>
                <tr>
                    <td>User name:</td>
                    <td><%=userName%></td>
                </tr>
                <tr>
                    <td>Old Password:</td>
                    <td><input type="password" name="txtOldPassword" value="" /></td>
                    <td><font color="red"><label id ="lblOldPassword"></label></font></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="txtPassword" value="" /></td>
                     <td><font color="red"><label id ="lblPassword"></label></font></td>
                </tr>
                <tr>
                    <td>Re-Password:</td>
                    <td><input type="password" name="txtRePassword" value="" /></td>
                    <td><font color="red"><label id ="lblRePassword"></label></font></td>
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

<script type="text/javascript">
    function isValid(){
        if(isEmptyPassword()=== false && confirmPassword()===false)   
            return true;
        else
            return false;
    }
    
    function isEmptyPassword(){
        n = mform.txtPassword.value;
        if(n === "" || n === " "){
            document.getElementById("lblPassword").innerHTML = "Password can not be empty";
            mform.txtPassword.focus();
            return true;
        }
        return false;
    }
    
    function confirmPassword(){
        p = mform.txtPassword.value;
        rp = mform.txtRePassword.value;
        if(p !== rp){
            //alert
            document.getElementById("lblRePassword").innerHTML = "Password is not matched";
            mform.txtRePassword.focus();
            return false;
        }
         return true;  
    }
</script>
