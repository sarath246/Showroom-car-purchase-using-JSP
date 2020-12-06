<%-- 
    Document   : Service_bookings_users
    Created on : 12 May, 2020, 8:49:53 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service bookings</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
         <div id="tab"align="center">
        <form action="" method="post" >
            <table border="1" >
                <th>Sl.No</th>
                <th>User name</th>
                <th style="text-align: center;">Booked date</th>
                <th>Car name</th>
                <th>E-mail</th>
                <th style="text-align: center;">Address</th>
                <th>Max days</th>
                
                <%
                   String sel="";
                   int i=0;
                   sel="select * from tbl_servicebooking where showroom_id='"+session.getAttribute("regid")+"'";
                   ResultSet rs=obj.selectCommand(sel);
                   System.out.println(sel);
                   while(rs.next())
                   {
                     i++;
                %>
                    <tr>
                        <td><%= i %></td>
                        <td><%= rs.getString("user_name") %></td>
                        <td><%= rs.getString("booking_date") %></td>
                        <td><%= rs.getString("car_id") %></td>
                        <td><%= rs.getString("user_email") %></td>
                        <td><%= rs.getString("user_address") %></td>
                        <td><%= rs.getString("max_days") %></td>
                        <td><a href="Service_bookings_users.jsp?rid=<%= rs.getString("user_id") %>">Reject</a></td>
                        <td><a href="Replay_user.jsp?uid=<%= rs.getString("user_id") %>">Replay</a></td>
                    </tr>
                    <%}%>
            </table>
            
        </form>
         </div>
    </body>
</html>
