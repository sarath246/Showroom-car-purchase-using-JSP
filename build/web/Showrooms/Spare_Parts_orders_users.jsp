<%-- 
    Document   : Spare_Parts_orders_users
    Created on : 11 Apr, 2020, 6:19:11 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users spareparts orders view</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab"align="center">
        <form action="" method="post" >
            <table border="1" >
                <th>Sl.No</th>
                <th>User name</th>
                <th>Spareparts name</th>
                <th>Car name</th>
                <th>Company name</th>
                <th>No.items</th>
                <th style="text-align: center">Location</th>
                <th style="text-align: center"> Order date</th>
                
                <%
                   String sel="";
                   int i=0;
                   sel="select * from tbl_sparepartsbuy s inner join tbl_userreg u on u.user_id=s.user_id where showroom_id='"+session.getAttribute("regid")+"'";
                   ResultSet rs=obj.selectCommand(sel);
                   System.out.println(sel);
                   while(rs.next())
                   {
                     i++;
                %>
                    <tr>
                        <td><%= i %></td>
                        <td><%= rs.getString("user_name") %></td>
                        <td><%= rs.getString("spareparts_name") %></td>
                        <td><%= rs.getString("car_id") %></td>
                        <td><%= rs.getString("company_name") %></td>
                        <td></td>
                        <td><%= rs.getString("user_address") %></td>
                        <td><%= rs.getString("sparepartsorder_date") %></td>
                        <td><a href="Replay_user.jsp?uid=<%= rs.getString("user_id") %>">Replay</a></td>
                    </tr>
                    <%}%>
            </table>
            
        </form>
        </div>
    </body>
</html>
