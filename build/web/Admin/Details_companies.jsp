<%-- 
    Document   : Details_showrooms
    Created on : 13 Jun, 2020, 7:57:37 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company details</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
            <form method="post">
                <table border="1">
         <%
            String sel="";
            int i=0;
              
             sel="select * from tbl_company where showroom_status='0'";
             ResultSet rs=obj.selectCommand(sel);
             System.out.println(sel);
             while(rs.next())
              {
               i++;
              %>
                <tr>
                    <td><input type="checkbox" name="chkName" onClick="selectall()"></td>
                    <td><%= i %></td>
                    <td><%= rs.getString("company_name") %></td>
                    <td><%= rs.getString("company_email") %></td>
                    <td><%= rs.getString("company_address") %></td>
                    <td><%= rs.getString("company_name") %></td>
                    <td></td>
                </tr>
                <%}%>
                </table>
            </form>
        </div>
    </body>
</html>
