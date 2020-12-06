<%-- 
    Document   : User_car_purchase_show
    Created on : 8 Apr, 2020, 10:33:25 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User car purchase show</title>
         <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab"align="center">
        <form action="" method="post">
            <a href="Replayed_users.jsp">Replayed users list</a>
            <table border="1">
                
                <th>Sl.No</th>
                <th>User name</th>
                <th>Purchased car</th>
                <th>Car colour</th>
                <th>Price</th>
                <th>Order date</th>
                <th>Respond</th>
                
                <%
                    String sel="",id="",ins="";
                    int i=0,status=1;
                    
                    sel="select * from tbl_carbooking c inner join tbl_userreg u on u.user_id=c.user_id where showroom_id='"+session.getAttribute("regid")+"' and car_status='0'";
                    ResultSet rs=obj.selectCommand(sel);
                    System.out.println(sel);
                    while(rs.next())
                    {
                      i++;
                 %>
                    <tr>
                        <td><%= i %></td>
                        <td><%= rs.getString("user_name") %></td>
                        <td><%= rs.getString("car_id") %></td>
                        <td><%= rs.getString("car_color") %></td>
                        <td><%= rs.getString("car_price") %></td>
                        <td></td>
                        <td><a href="Replay_user.jsp?uid=<%= rs.getString("user_id") %>">Replay</a></td>
                    </tr>
                   
                    <%}%>
                    <%
                    String sele="";
                    
                    sele="select * from tbl_carbooking ";
                    ResultSet rss=obj.selectCommand(sele);
                    System.out.println(sele);
                    if(rss.next())
                    {
                     String user= rss.getString("user_id");
                     System.out.println(user);
                 %>
                    <tr>
                        <td><a href="Replay_user.jsp?userid=<%= user %>">Replay all</a></td>
                    </tr>
                    <%}%>
            </table>
            
        </form>
        </div>
    </body>
</html>
