<%-- 
    Document   : Car_gallary
    Created on : 8 Feb, 2020, 2:18:51 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car gallary</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab"align="center"> 
        <form action="CarGallary_upload.jsp" enctype="multipart/form-data" method="post">
            <table border="1">
                <th colspan="2">Car gallery</th>
                <tr>
                    <td>Car</td>
                    <td>
                        <select name="txt_name">
                            <option value="">--------Select--------</option>
                        <%
                            String sel="select * from tbl_cardetails";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                           {
                            %>
                            <option value="<%= rs.getString("car_id") %>"><%= rs.getString("car_name") %></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                 <tr>
                    <td style="color:white;">Image</td>
                    <td>
                        <input type="file" name="car_image">
                    </td>
                </tr>
                <tr>
                    <td>Caption</td>
                    <td><input type="text" name="txt_caption" placeholder="Enter caption here..."></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btn_submit"></td>
                </tr>
            </table>
        </form>
        </div>
    </body>
</html>
