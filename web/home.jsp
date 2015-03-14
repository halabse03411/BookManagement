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
        String userName = ""+session.getAttribute("userName");
        if(userName!=null && userName.length()>0){
            %>
            <div align="right">Hi, <a href ="login.jsp"><%=userName%></a>    Logout</div>
            <p><a href ="search.jsp">Search Book</a>
            <p><a href ="addBook.jsp">Add New Book</a>
            <p><a href ="search.jsp">View Book Details</a>
            <p><a href ="search.jsp">Update Book</a>
            <p><a href ="addUser.jsp">Add New User</a>
            <p><a href ="updateUser.jsp">Update User Info</a>
            <p><a href ="changePassword.jsp">Change Password</a>
            <%
        }else{
        %>
            <jsp:forward page="login.jsp">
                    <jsp:param name="loged" value="notyet"/>
            </jsp:forward>
        <%
               }
        %>
    </body>
</html>
