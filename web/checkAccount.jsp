<%-- 
    Document   : checkAccount
    Created on : Mar 11, 2015, 8:46:50 PM
    Author     : Apollo
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Account</title>
    </head>
    <body>
        <%
            boolean right = false;
            String userName = request.getParameter("txtUserName");
            String password = request.getParameter("txtPassword");
            
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
            String sql = "Select User_Name, User_Password from User_Account";
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while(rs.next()){
                String dbUserName = rs.getString(1);
                String dbPassWord = rs.getString(2);
                if(userName.equalsIgnoreCase(dbUserName))
                    if(password.equals(dbPassWord)){
                        out.println("<h1>Welcome back, "+userName+"!</h1>");
                        right = true;
                        session.setAttribute("userName", userName);
                        %>
                        <jsp:forward page="home.jsp">
                            <jsp:param name="userName" value="<%=userName%>"/>
                        </jsp:forward>
                        <%
                        break;
                    }
            }
            conn.close();
                %>
                <jsp:forward page="login.jsp">
                            <jsp:param name="loged" value="false"/>
                </jsp:forward>
    </body>
</html>
