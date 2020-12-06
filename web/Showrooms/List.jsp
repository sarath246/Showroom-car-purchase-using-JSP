<%-- 
    Document   : List
    Created on : 22 May, 2020, 11:41:15 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab"align="center">
        <form action="" method="post">
            <table border="1">
                <th><a href="Delivery_list.jsp">Delivery list</a></th>
                <th><a href="Replayed_users.jsp">Replayed list</a></th>
                <th><a href="#">Service list</a></th>
            </table>
    </body>
</html>
