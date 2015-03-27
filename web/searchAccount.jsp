<%-- 
    Document   : searchAccount
    Created on : Mar 24, 2015, 12:11:32 AM
    Author     : Apollo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Account</title>
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
        
    <center><h2>Search User</h2></center>
        <form name="mform">
            User Name: <input type="text" name="txtUsername" value="" />
            <input type="submit" value="Search" name="btnSearch" />
            </form>
        </form>
        
        <%
            String search = request.getParameter("btnSearch");
            if(search!=null){
                String searchUserName = request.getParameter("txtUsername");
                if(searchUserName.equals("") || searchUserName.equals(" ")){
                    out.println("<h3>You must enter user name!</h3>");
                }else{
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
                    String sql = "Select * from User_Account where User_Name like '%"+searchUserName+"%'";
                    ResultSet rs = conn.createStatement().executeQuery(sql);
                    if(rs.next()){
                        %>
                        <br>
                        <table border="true">
                            <tr>
                                <th>ID</th>
                                <th>User Name</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Created Date</th>
                            </tr>
                            <%
                        do{
                            int id = rs.getInt(1);
                            String username = rs.getString(2);
                            String email = rs.getString(4);
                            String password = rs.getString(5);
                            String createdDate = rs.getString(6);
                            %>
                            <tr>
                            <td><%=id%></td>
                            <td><%=username%></td>
                            <td><%=email%></td>
                            <td><%for(int i=0;i<password.length();i++)
                                    out.print("*");
                            %></td>
                            <td><%=createdDate%></td>
                            </tr>
                            <%
                        }while(rs.next());
                        conn.close();
                        %>
                        </table>
                        <%
                    }else{
                        out.println("<h3>Can not find user</h3>");
                    }
                }
            }
             } catch (NullPointerException ne) {
                    response.sendRedirect("./login.jsp");
                }
        %>
    </body>
</html>
