<%-- 
    Document   : checkNewAccount
    Created on : Mar 23, 2015, 7:38:27 PM
    Author     : Apollo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check New Account</title>
    </head>
    <body>
    <center>
        <%
        
        String userName = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String email = request.getParameter("txtEmail");
        boolean valid = true;
        
        //check if username is existed or not
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
        String sql = "Select * from User_Account where User_Name = '"+userName+"'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        if(rs.next()){
            %>
            <h2>This user name is esixted, please choose an other user name!</h2>
            <a href="createAccount.jsp">Back</a>
            <%
            valid = false;
        }
        conn.close();
        
        //check if email is existed or not
        conn = DriverManager.getConnection("Jdbc:Odbc:project");
        sql = "Select * from User_Account where User_Email = '"+email+"'";
        st = conn.createStatement();
        rs = st.executeQuery(sql);
        if(rs.next()){
            %>
            <h2>This email is esixted, please choose an other email!</h2>
            <a href="createAccount.jsp">Back</a>
            <%
            valid = false;
        }
        conn.close();
        
        //creat new account if information is valid
        if(valid){
            try{
                Date today = new Date();
                String date = "";
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                date = sdf.format(today);

                conn = DriverManager.getConnection("Jdbc:Odbc:project");
                sql = "Insert into User_Account values (?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, userName);
                ps.setString(2,"default");
                ps.setString(3, email);
                ps.setString(4, password);
                ps.setString(5, date);
                ps.executeUpdate();
                conn.close();
                session.setAttribute("userName", userName);
                response.sendRedirect("./home.jsp");
            }catch(Exception ex){
                out.println(ex);
            }
        }
        %>
     </center>   
    </body>
</html>
