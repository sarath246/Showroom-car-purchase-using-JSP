<%-- 
    Document   : User_reg
    Created on : 21 Feb, 2020, 10:48:30 AM
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
        <form action="" method="post">
            <table border="1">
                <th>Registration</th>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name"></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    
                </tr>
                <tr>
                    <td>DOB</td>
                    <td><input type="date" name="txt_dob"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txt_address"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txt_contact"></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><input type="text" name="txt_email"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
