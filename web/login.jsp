<%-- 
    Document   : login
    Created on : Mar 11, 2015, 6:57:35 PM
    Author     : Apollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <center>
        <%
            String loged = request.getParameter("loged");
        %>
        <form action="checkAccount.jsp" method="POST">
            <table>
                <tr>
                    <td>User name:</td>
                    <td><input type="text" name="txtUserName" value="" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="txtPassword" value="" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login" /></td>
                </tr>
            </table>
        </form>
        Don't have an account? Click <a href="createAccount.jsp">here</a>
        <%
            if(loged!=null && loged.equals("false") )
                 out.println("<h1>Failed to login, incorrect username or password!</h1>");
        %>
    </center>
    </body>
</html>
