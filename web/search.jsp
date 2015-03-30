<%-- 
    Document   : search
    Created on : Mar 30, 2015, 3:23:22 PM
    Author     : cuwar1994
--%>

<%@page import="java.sql.ResultSet"%>
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
        <h2>Search Book</h2>
        <form> 
            <table>
                <tr>
                    <td>Book Title:</td>
                    <td><input type="text" name="txtTitle" value="" /></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="text" name="txtPrice" value="" /></td>
                    <td><input type="submit" value="Search" name="btnSearch" /></td>
                    <td><input type="submit" value="Clear" name="btnClear" /> </td>               
                </tr>
            </table>
            <p>
        <%
            String btitle = request.getParameter("txtTitle");  
            String bprice = request.getParameter("txtPrice");
            //Double dprice = Double.parseDouble(request.getParameter("txtPrice"));
            if(request.getParameter("btnSearch")!= null) {     
                if(btitle.length() > 0) {   
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    Connection conn = DriverManager.getConnection("jdbc:odbc:project");
                    String sql = "Select * from Book where Title like '%"+btitle+"%'"; 
                    ResultSet rs = conn.createStatement().executeQuery(sql);
                    if(rs.next()) {
        %>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Title</td>
                <td>Price(USD)</td>
                <td>Description</td>
                <td>Created Date</td>
            </tr>
        <%
                    do {
                        int id = rs.getInt(1);
                        String title = rs.getString(2);             
                        String des = rs.getString(3);
                        String Cdate = rs.getDate(5)+"";
                        Double price = rs.getDouble(10);           
                
        %>
            <tr>
                <td><a href="bookDetail.jsp?bookId=<%=id%>"><%=id%></a></td>
                <td><%=title%></td>
                <td><%=price%></td>
                <td><%=des%></td>
                <td><%=Cdate%></td>
                <td><a href="updateInfo.jsp?bid=<%=id%>">update</a>
                    <a onclick="return confirm('Delete this book?');" href="delete.jsp?bid=<%=id%>">delete</a></td>
            </tr>
        
        <%
                        }while(rs.next());
                    conn.close();
        %>
        </table>
        <%
                    }
                }
                
                if(bprice != ""){
                    Connection conn = DriverManager.getConnection("jdbc:odbc:project");
                    String sql = "Select * from Book where Price = " + bprice; 
                    ResultSet rs = conn.createStatement().executeQuery(sql);
                    if(rs.next()) {
        %>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Title</td>
                <td>Price(USD)</td>
                <td>Description</td>
                <td>Created Date</td>
            </tr>
        <%
                    do {
                        int id = rs.getInt(1);
                        String title = rs.getString(2);             
                        String des = rs.getString(3);
                        String Cdate = rs.getDate(5)+"";
                        Double price = rs.getDouble(10);           
                
        %>
            <tr>
                <td><a href="bookDetail.jsp?bookId=<%=id%>"><%=id%></a></td>
                <td><%=title%></td>
                <td><%=price%></td>
                <td><%=des%></td>
                <td><%=Cdate%></td>
                <td><a href="updateInfo.jsp?bid=<%=id%>">update</a>
                    <a onclick="return confirm('Delete this book?');" href="delete.jsp?bid=<%=id%>">delete</a></td>
            </tr>
        
        <%
                        }while(rs.next());
                    conn.close();
        %>
        </table>
        <%
                }
            }  
            }
            } catch (NullPointerException ne) {
                    response.sendRedirect("./login.jsp");
                }
        %>
            </form> 
        </center>
    </body>
</html>
