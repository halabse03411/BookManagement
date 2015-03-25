<%-- 
    Document   : updateAccount
    Created on : Mar 23, 2015, 11:30:14 PM
    Author     : Apollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String userName = session.getAttribute("userName").toString();
        %>
         <!--Header of all page-->
        <div>
            <span style="float:left"><a href ="home.jsp">Home</a> </span>
            <span style="float:right">Hi, <a href ="updateAccount.jsp"><%=userName%></a>   |   <a href ="logout.jsp">Logout</a> </span>
            <br>
        </div>
        <!---------------------->
        
    <center>

        <h2>Update Account</h2>
        <a href="changePassword.jsp">Change password</a>  ||  <a onclick="return confirm('Delete this account, this can be undo?');"
                                         href="deleteAccount.jsp">Delete account</a>
    </center> 
    <%
        } catch (NullPointerException ne) {
            response.sendRedirect("./login.jsp");
        }
    %>
</body>
</html>
