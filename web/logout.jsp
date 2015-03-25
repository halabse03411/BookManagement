<%-- 
    Document   : logout
    Created on : Mar 25, 2015, 9:54:49 PM
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
            session.invalidate();
            response.sendRedirect("./login.jsp"); 
            %>
    </body>
</html>
