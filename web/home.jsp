<%-- 
    Document   : homepage
    Created on : Mar 11, 2015, 6:59:35 PM
    Author     : dat
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
            try{
            String userName = session.getAttribute("userName").toString();
            %>
            <div align="right">Hi, <%=userName%>   |   <a href ="login.jsp">Logout</a></div>
            <p><a href ="search.jsp">Search Book</a>
            <p><a href ="addBook.jsp">Add New Book</a>
            <p><a href ="search.jsp">View Book Details</a>
            <p><a href ="search.jsp">Update Book</a>
            <p><a href ="searchAccount.jsp">Search Account</a>
            <p><a href="updateAccount.jsp">Update Account</a>
            <p><a href ="changePassword.jsp">Change Password</a>
            <%
            }catch(NullPointerException ne){
                response.sendRedirect("./login.jsp"); 
            }
        %>
    </body>
</html>
