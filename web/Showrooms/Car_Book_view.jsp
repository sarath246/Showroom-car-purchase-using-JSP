<%-- 
    Document   : Car_Book_view
    Created on : 4 Apr, 2020, 2:50:10 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car book view</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab"align="center">
        <form action="" method="post">
        <table border="1">
            <th>Sl.No</th>
            <th>User</th>
            <th>Car name</th>
            <th>Car color</th>
            <th>Car price</th>
        <%
            
            String sel="";
            int i=0;
            sel="select * from tbl_carbooking where showroom_id='"+session.getAttribute("regid")+"'";
            ResultSet rs=obj.selectCommand(sel);
            while(rs.next()){
               i++;
            %>
             <tr>
                 <td><%= i %></td>
            <td><%= rs.getString("user_id") %></td>
            <td><%= rs.getString("car_id") %></td>
            <td><%= rs.getString("car_color") %></td>
            <td><%= rs.getString("car_price") %></td>
             </tr>
            <%
            }
            %>
        </table>
        </form>
        </div>
    </body>
</html>
