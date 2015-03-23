<%-- 
    Document   : search
    Created on : Mar 11, 2015, 7:20:42 PM
    Author     : dat
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
        <h1>Search Book</h1>
        <table>
            <tr>
            <td>Book title</td> 
            <td><input type="text" name="txtTitle" value="" /></td></tr>
            <tr>
            <td>Price</td> 
            <td><input type="text" name="txtPrice" value="" /></td>
            <td><input type="submit" value="Search" name="btnSearch" /></td>
            <td><input type="reset" value="Clear" name="btnClear" /></td>
            </tr>
        </table>
        <%
            String Search = request.getParameter("btnSearch");
            String bTitle = request.getParameter("txtTitle");
            String bPrice = request.getParameter("txtPrice");
            if(Search != null && Search.length()>0){
                    if(bTitle.length()>0){
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
                    String sql = "select * from Book where Title like '%"+bTitle+"%'" ;
                    ResultSet rs = conn.createStatement().executeQuery(sql);
                    if(rs.next()){
                    out.println("<table border = 2>");
                    out.println("<tr>");
                    out.println("<td>ID</td>");
                    out.println("<td>Title</>");
                    out.println("<td>Price(USD)</td>");
                    out.println("<td>Description</td>");
                    out.println("<td>Create Date</td>");
                    out.println("<td>Action</td>");
                    out.println("</tr>");
                    do{
                        int bid = rs.getInt(1);
                        String bname = rs.getString(2);%>
                        <tr>
                        <td><a href = "bookDetail.jsp?bid=<%=bid%>"><%=bid%></a></td>
                        <td><%=bname%></td>
                        <%String bdes = rs.getString(3);
                        String bcredate = rs.getDate(5)+"";%>
                        <td><%=rs.getFloat(10)%></td>
                        <td><%=bdes%></td>
                        <td><%=bcredate%></td>
                        <td><a href = "updateInfo.jsp?bid=<%=bid%>">update</a>
                            <a href = "delete.jsp?bid=<%=bid%>&bname=<%=bname%>">delete</a></td>
                        </tr>
                    <%}while(rs.next());
                    
            }conn.close();
            }
                    if(bPrice!=null){
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");    
                    String sql = "select * from Book where Price = '"+bPrice+"'" ;
                    ResultSet rs = conn.createStatement().executeQuery(sql);
                    if(rs.next()){
                    out.println("<table border = 2>");
                    out.println("<tr>");
                    out.println("<td>ID</td>");
                    out.println("<td>Title</>");
                    out.println("<td>Price(USD)</td>");
                    out.println("<td>Description</td>");
                    out.println("<td>Create Date</td>");
                    out.println("<td>Action</td>");
                    out.println("</tr>");
                    do{
                        int bid = rs.getInt(1);
                        String bname = rs.getString(2);%>
                        <tr>
                        <td><a href = "bookDetail.jsp?bid=<%=bid%>"><%=bid%></a></td>
                        <td><%=bname%></td>
                        <%String bdes = rs.getString(3);
                        String bcredate = rs.getDate(5)+"";%>
                        <td><%=rs.getFloat(10)%></td>
                        <td><%=bdes%></td>
                        <td><%=bcredate%></td>
                        <td><a href = "updateInfo.jsp?bid=<%=bid%>">update</a>
                            <a href = "delete.jsp?bid=<%=bid%>&bname=<%=bname%>">delete</a></td>
                        </tr>
                    <%}while(rs.next());
            }conn.close();
            }
            }        
        %>
        </form>
    </body>
</html>
