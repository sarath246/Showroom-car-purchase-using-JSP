<%-- 
    Document   : Online_status
    Created on : 1 May, 2020, 6:58:54 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online status</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <form action="" method="post">
            <table border="1">
                <th>Sl.No</th>
                <th>Showroom name</th>
                <th>Status</th>
                <%
                    String sel="";
                    int i=0;
                    sel="select * from tbl_online where online_status='1'";
                    ResultSet rs=obj.selectCommand(sel);
                    while(rs.next())
                    {
                       i++;
                    %>
                <tr>
                    <td><%= i %></td>
                    <td><%= rs.getString("showroom_id") %></td>
                    <td><%= rs.getString("online_status") %></td>
                </tr>
                <%}%>
            </table>
        </form>
    </body>
</html>
