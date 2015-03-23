<%-- 
    Document   : checkUpdateBook
    Created on : Mar 15, 2015, 9:06:23 PM
    Author     : dat
--%>

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
//        String txtID = request.getParameter("txtBID");
        String bTitle = request.getParameter("txtTitle");
        String bDes = request.getParameter("txtDes");
        String bSellingin = request.getParameter("Selling");
        String bIssDate = request.getParameter("txtIssDate");
        String bDisc =request.getParameter("chbDiscount");
        String bStatus = request.getParameter("ddlStatus");
        String bDiscfrom =request.getParameter("txtDiscfrom");
        String bDiscto = request.getParameter("txtDiscto");
        String bPrice = request.getParameter("txtPrice");
        boolean check = true;
        try
        {
            if (bTitle=="" || bDes=="" || bDisc=="") throw new Exception();
        }catch(Exception ex){check = false;%><p><FONT color="#FF0000">(*)</FONT> is required</p><%}
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
            String sql = "UPDATE Book SET Title='"+bTitle+"', Description='"+bDes+
                    "', Issued_Date='"+bIssDate+"',Discount_From='"+bDiscfrom+
                    "',Selling_in='"+bSellingin+"',Discount_To='"+bDiscto+"',Price='"+bPrice+
                    "',Status='"+bStatus+"',Discount='"+bDisc+"' where Book_ID='"+session.getAttribute("bid")+"'";
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("Jdbc:Odbc:project");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            //conn.createStatement().executeUpdate(sql);
            conn.close();
           // return page index.jsp
            response.sendRedirect("./search.jsp");
        }
        }
     %>
     <p><input type="button" value="Back" name="btnBack" onclick="window.location='updateInfo.jsp?bid=<%=session.getAttribute("bid")%>'"/>
    </body>
</html>
