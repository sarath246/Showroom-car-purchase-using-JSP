<%-- 
    Document   : User_login
    Created on : 8 Apr, 2020, 8:40:30 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User login</title>
         <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <form>
            <table>
                <th>Sl.No</th>
                <th>User name</th>
                <th>Login date and time</th>
                <th>Status</th>
                <th>Block</th>
                <%
                    String sel="";
                    int i=0;
                    sel="select * from tbl_userlogin u inner join tbl_userreg r on r.user_id=u.user_id order by user_date";
                    ResultSet rs=obj.selectCommand(sel);
                    System.out.println(sel);
                    while(rs.next())
                    {
                       i++;
                    %>
                <tr>
                    <td><%= i %></td>
                    <td><%= rs.getString("user_name") %></td>
                    <td><%= rs.getString("user_date") %></td>
                    <td class="user-circle-online btn-circle">Online</td>
                    <td><a href="User_login.jsp?bid=<%= rs.getString("user_id") %>" >Block</a></td>
                </tr>
                <%}%>
            </table>
        </form>
        </div>
    </body>
</html>
