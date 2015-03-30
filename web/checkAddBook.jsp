<%-- 
    Document   : checkAddBook
    Created on : Mar 15, 2015, 1:58:31 PM
    Author     : dat
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <%
        String btnSave = request.getParameter("btnSave");
        String txtID = request.getParameter("txtBID");
        String bTitle = request.getParameter("txtTitle");
        String bDes = request.getParameter("txtDes");
        String bSellingin = request.getParameter("Selling");
        String bIssDate = request.getParameter("txtIssDate");
        String bDisc =request.getParameter("chbDiscount");
        String bStatus = request.getParameter("ddlStatus");
        String bDiscfrom =request.getParameter("txtDiscfrom");
        String bDiscto = request.getParameter("txtDiscto");
        String bPrice = request.getParameter("txtPrice");
        Date today = new Date();
        String date = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        date = sdf.format(today);
        out.println();
        boolean check = true;
        
        try{
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            Date issDate = format.parse(bIssDate);
            Date discfrom = format.parse(bDiscfrom);
            Date discto = format.parse(bDiscto);
        }
        catch(Exception ex){check = false;%><p>Format of date is wrong (yyyy-MM-dd)</p><%}
        
        try
        {
            if (bTitle=="" || bDes=="" || bDisc=="") throw new Exception();
        }catch(Exception ex){check = false;%><p><FONT color="#FF0000">(*)</FONT> is required</p><%}
        try{
            if(bIssDate.compareTo(date)>0) throw new Exception();
        }catch(Exception ex){check = false;%><p>Issued Date must be before current date</p><%}
        try
        {
           double price = Double.parseDouble(bPrice);
            if (price<=0){
                check = false;
                %><p>Price must be greater than 0</p><%
            }
        }
          catch(Exception ex){
              check = false;
              %><p>Price must be numeric</p><%
          }
        
        if(check){
        if(btnSave != null && btnSave.length()>0){
            if(Integer.parseInt(bSellingin) == 1){bSellingin = "true";}
                else{bSellingin = "false";}
            if(bDisc==null){bDisc="false";}
                else{bDisc="true";}
            if(bStatus.equalsIgnoreCase("Not Available")){bStatus="false";}
                else {bStatus="true";}
            String sql = "INSERT INTO Book VALUES ('"+bTitle+"','"+bDes+"','"+bSellingin+"','"+bIssDate+"','"+bDisc+"','"+bStatus+"','"+bDiscfrom+"','"+bDiscto+"','"+bPrice+"')";
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            //conn.createStatement().executeUpdate(sql);
            conn.close();
           // return page index.jsp
            response.sendRedirect("./addBook.jsp");
        }}
    %>
    <p><input type="button" value="Back" name="btnBack" onclick="window.location='addBook.jsp'"/>
    </body>
</html>
