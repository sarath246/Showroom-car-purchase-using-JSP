<%-- 
    Document   : Showroom_login
    Created on : 11 Jun, 2020, 3:28:19 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showroom logins</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
            <form method="post">
         <table>
                <th>Sl.No</th>
                <th>Showroom name</th>
                <th>Login date and time</th>
                <th>Status</th>
                <th>Block</th>
                <%
                    String sel="";
                    int i=0;
                    sel="select * from tbl_online u inner join tbl_showroom r on r.showroom_id=u.showroom_id ";
                    ResultSet rs=obj.selectCommand(sel);
                    System.out.println(sel);
                    while(rs.next())
                    {
                       i++;
                    %>
                <tr>
                    <td><%= i %></td>
                    <td><%= rs.getString("showroom_name") %></td>
                    <td></td>
                    <td class="user-circle-online btn-circle">Online</td>
                    <td><a href="Showroom_login.jsp?bid=<%= rs.getString("showroom_id") %>" >Block</a></td>
                </tr>
                <%}%>
            </table>
        </form>
        </div>
    </body>
</html>
