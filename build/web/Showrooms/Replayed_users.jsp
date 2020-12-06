<%-- 
    Document   : Replayed_users
    Created on : 21 May, 2020, 8:25:24 PM
    Author     : Sarath
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Replayed users</title>
         <%@include file="HomePage.jsp" %>
         
       
         
    </head>
    <body>
        
        
        
         <div id="tab"align="center">
        <form action="" method="post">
            <a href="Delivery_list.jsp">Delivery list</a>
            <table border="1">
                
                
                <th>Sl.No</th>
                <th>User name</th>
                <th>Purchased car</th>
                <th>Car colour</th>
                <th>Price</th>
                <th>Status</th>
                <th>Delivery status</th>
                   
                <%
                    String sel="",id="",ins="",delivery="";
                    int i=0,status=1;
                   
                    if(request.getParameter("rid")!= null){
                        
                        delivery=request.getParameter("rid");
                        
                        ins="update tbl_carbooking set delivery_status='1' where user_id='"+delivery+"'";
                        obj.executeCommand(ins);
                    }
                    
                    sel="select * from tbl_carbooking c inner join tbl_userreg u on u.user_id=c.user_id where showroom_id='"+session.getAttribute("regid")+"' and car_status='1' and delivery_status='0'";
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
                        <td style="background-color: lightblue; "><a href="#">Replayed</a></td>
                        <td style="color: white; text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue; font-size: 20px;"><a href="Replayed_users.jsp?rid=<%= rs.getString("user_id") %> " onclick="typeWriter()">Delivered here</a></td>
                        <%}%>
                        
                   
            </table>
            
        </form>
        </div>
    </body>
</html>
