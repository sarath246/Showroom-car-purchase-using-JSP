<%-- 
    Document   : Change_psw
    Created on : 7 Feb, 2020, 10:28:18 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
         <% 
            
         if(request.getParameter("btn_submit")!=null)
        {
         String passwordnew=request.getParameter("txt_newpsw");
         String passwordcon=request.getParameter("txt_confpsw");
       
         String upQuery="update tbl_admin set admin_psw='"+passwordnew+"'";   
        obj.executeCommand(upQuery); 
        out.println(upQuery);     
        }
       
        %>
         <div id="tab" align="center">
        <form action="" method="post">            
            <table border="1">
                <th colspan="2">Change your password</th>
                <tr>
                    <td>Current password</td>
                    <%
                        String sel="select * from tbl_admin ";
                        ResultSet rs=obj.selectCommand(sel);
                        while(rs.next())
                       {
                        %>
                        <td><input type="text" name="txt_cpsw" value="<%= rs.getString("admin_psw") %>"></td>
                        <%}%>
                </tr>
                <tr>
                    <td>New password</td>
                    <td><input type="text" name="txt_newpsw"></td>
                </tr>
                <tr>
                    <td>Confirm password</td>
                    <td><input type="text" name="txt_cnfpsw"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btn_submit"></td>
                </tr>
            </table>
        </form>
         </div>
    </body>
</html>
