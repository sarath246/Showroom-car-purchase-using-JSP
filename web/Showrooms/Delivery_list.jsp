<%-- 
    Document   : Delivery_list
    Created on : 21 May, 2020, 9:13:13 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Lists</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
       
        <div id="tab"align="center">
        <form action="" method="post">
            <table border="1">
                
                <th>Sl.No</th>
                <th>User name</th>
                <th>Purchased car</th>
                <th>Car colour</th>
                <th>Price</th>
                <th style="text-align: center;">Status</th>
                
                <%
                    String sel="",id="",ins="";
                    int i=0,status=1;
                    
                    sel="select * from tbl_carbooking c inner join tbl_userreg u on u.user_id=c.user_id where showroom_id='"+session.getAttribute("regid")+"' and delivery_status='1'";
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
                        <td><a href="">Delivered   <img src="../Showrooms/img/tik.png" width="30px" height="30px"/></a></td>
                    </tr>
                   
                    <%}%>
                   
            </table>
            
        </form>
        </div>
        
    </body>
</html>
