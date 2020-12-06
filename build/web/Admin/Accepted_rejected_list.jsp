<%-- 
    Document   : Accepted_rejected_list
    Created on : 7 Apr, 2020, 10:24:53 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accepted/rejected list</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab" align="left">
        <form action="" metode="post">
            <table border="1">
                <thead align="center">Accepted list</thead>
                <th>Sl.No</th>
                <th>Name</th>
                <th>Block</th>
                <th>Unblock</th>
                <%
                    String sel="",upqury="",select="",upq="";    
                    int i=0;
                    
                    if(request.getParameter("bid")!=null)
                    {
                     String block=request.getParameter("bid");
                    upqury="update tbl_userreg set user_status='3' where user_id='"+block+"'";
                    obj.executeCommand(upqury);
                    System.out.println(upqury);
                    }
                    else if(request.getParameter("uid")!=null)
                    {
                     String unblock=request.getParameter("uid");
                    upq="update tbl_userreg set user_status='1' where user_id='"+unblock+"'";
                    obj.executeCommand(upq);
                    System.out.println(upq);
                    }
                    
                    sel="select * from tbl_userreg where user_status='1'";
                    ResultSet rs=obj.selectCommand(sel);
                    while(rs.next()){
                        i++;
                    %>
                <tr>
                    <td><%= i %></td>
                    <td><%= rs.getString("user_name") %></td>
                    <td><a href="Accepted_rejected_list.jsp?bid=<%= rs.getString("user_id") %>">Block</a></td>
                    <td><a href="">Unblock</a></td>
                    
                </tr> <%}%>
             
                <%
                    int p=1;
                 select="select * from tbl_userreg where user_status='3'";
                    ResultSet rr=obj.selectCommand(select);
                    while(rr.next()){
                        p++;
                    %>
             <tr>
                    <td><%= p %></td>
                    <td><%= rr.getString("user_name") %></td> 
                    <td><a href="#" style="color: red;">Blocked</a></td>
                    <td><a href="Accepted_rejected_list.jsp?uid=<%= rr.getString("user_id") %>">Unblock</a></td>
                </tr>
                <%}%>    
               
                
            </table></form></div>
              
                
                
      
         <div id="tab" align="center">
        <form action="" metode="post">
            <table border="1">
                <thead align="center">Rejected list</thead>
                <th>Sl.No</th>
                <th>Name</th>
                <%
                    String sele="";
                    int j=0;
                    sele="select * from tbl_userreg where user_status='2'";
                    ResultSet rss=obj.selectCommand(sele);
                    while(rss.next()){
                        j++;
                    %>
                <tr>
                    <td><%= j %></td>
                    <td><%= rss.getString("user_name") %></td>
                </tr>
                <%}%>
            </table>
        </form>
        </div>
    </body>
</html>
