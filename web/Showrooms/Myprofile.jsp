<%-- 
    Document   : Myprofile
    Created on : 7 Feb, 2020, 11:07:10 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
       <div id="tab"align="center">
        <form action="" method="post">
            <table border="1">
                <th colspan="2">My profile</th>
        <%
            String sel="select * from tbl_showroom c inner join tbl_place p on p.place_id=c.place_id where showroom_id='"+session.getAttribute("regid")+"'";
            ResultSet rs=obj.selectCommand(sel);
            if(rs.next())
           {
            %>
                <tr><td>Name</td>
                    <td><%= rs.getString("showroom_name") %></td>
                </tr>
                 <tr><td style="color:white;">Place</td>
                    <td style="color:white;"><%= rs.getString("place_name") %></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%= rs.getString("showroom_address") %></td>
                </tr>
                <tr>
                    <td style="color:white;">Contact no</td>
                    <td style="color:white;"><%= rs.getString("showroom_contact") %></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><%= rs.getString("showroom_email") %></td>
                </tr>
                <%}%>
            </table>
        </form>
       </div>
    </body>
</html>
