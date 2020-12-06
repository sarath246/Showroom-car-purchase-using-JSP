<%-- 
    Document   : User_list
    Created on : 7 Apr, 2020, 9:24:05 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User list</title>
         <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
            <a href="Accepted_rejected_list.jsp">Accepted/Rejected list</a>
        <form action="" method="post">
                <table border="1">
                    <th>Sl.No</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>E-mail</th>
                    <th>Gender</th>
                    <th>Accept/Reject</th>
        <%
            String sel="",upquery="";
            int i=0;
            
            if(request.getParameter("aid")!=null)
            {
            String Accepted=request.getParameter("aid");
            upquery="update tbl_userreg set user_status='1' where user_id='"+Accepted+"'";
            obj.executeCommand(upquery);
            System.out.println(upquery);
            }
            sel="select * from tbl_userreg where user_status='0'";
            ResultSet rs=obj.selectCommand(sel);
            System.out.println(sel);
            while(rs.next()){
                i++;
            %>
            
                    <tr>
                        <td><%= i %></td>
                        <td><%= rs.getString("user_name") %></td>
                        <td><%= rs.getString("user_address") %></td>
                        <td><%= rs.getString("user_contact") %></td>
                        <td><%= rs.getString("user_email") %></td>
                        <td><%= rs.getString("user_gender") %></td>
                        <td><a href="User_list.jsp?aid=<%= rs.getString("user_id") %>">Accept</a>||
                            <a href="User_reject.jsp?eid=<%= rs.getString("user_id") %>">Reject</a></td>
                    </tr>
                    <%}%>
                </table>
            </form>
                </div>
    </body>
</html>
