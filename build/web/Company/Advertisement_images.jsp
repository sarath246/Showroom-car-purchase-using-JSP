<%-- 
    Document   : Advertisement_images
    Created on : 20 May, 2020, 11:47:22 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
    		<%
		String images = request.getParameter("img_advertisement");
		%>

            <tr>
             
            <img src="Get_image.jsp?image=<%= images %>" width="200px" height="200px">
            </tr>
            
        </table>
    </body>
</html>
