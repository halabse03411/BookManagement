<%-- 
    Document   : searchAccount
    Created on : Mar 30, 2015, 4:30:34 PM
    Author     : cuwar1994
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
            <h2>Search User</h2>
        <form>
            <p>User Name:
                <input type="text" name="txtName" value="" />
                <input type="submit" value="Search" name="btnSearch" />
        </form>
        <%
            String uName = request.getParameter("txtName");
            boolean check = true;    
            String accType;
            if(request.getParameter("btnSearch") != null) {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection conn = DriverManager.getConnection("jdbc:odbc:project");
                String sql = "Select * from User_Account where User_Name ='" + userName+"'";
                ResultSet rs = conn.createStatement().executeQuery(sql); 
                rs.next();
                    accType = rs.getString(5);
                
                conn.close();
                
                try {
                    if(uName.equals("") || uName.equals(" ")) throw new Exception();
                }
                catch(Exception ex) {
                    %>
                    <p><h2>User name is required</h2>
                    <%
                    check = false;
                }
            //}
                if(check == true) {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             conn = DriverManager.getConnection("jdbc:odbc:project");
             sql = "Select * from User_Account where User_Name like '%"+uName+"%'";
             rs = conn.createStatement().executeQuery(sql); 
        %>
        
        <table border='true'>
            <tr>
                <th>ID</th>
                <th>User Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Created Date</th>
        <%
             if(accType.equals("admin"))
                 out.println("<th>Action</th>");
        %>
            </tr>
            <%
            while(rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String date = ""+rs.getDate(6);
            %>
            <tr>
                <td><%=id%></td>
                <td><%=name%></td>
                <td><%=email%></td>
                <td><%for(int i = 0;i<password.length();i++) out.print("*");%></td>
                <td><%=date%></td>
                    <%
                if(accType.equals("admin"))
                    out.println("<td><a onclick=\"return confirm('Delete this book?');\" href='delByAdmin.jsp?id="+id+"'>Delete</a></td>");
                    %>
                
            </tr>
            <%
                }
                conn.close();
                }
            %>
            
        </table>
        <%
            
        }
            } catch (NullPointerException ne) {
                    response.sendRedirect("./login.jsp");
                }
        %>
        </center>
    </body>
</html>
