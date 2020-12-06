<%-- 
    Document   : Car_type
    Created on : 18 Jan, 2020, 10:02:00 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car_type_details</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
    <% 
        String cartype_name="",edit="",upqry="",ins="",editid="";
         String cartype="";
         cartype=request.getParameter("car_type");
         editid=request.getParameter("hid");
         
        if(request.getParameter("btn_submit")!=null)
       {
          
           if(request.getParameter("eid")!=null)
        {
            edit=request.getParameter("eid");
            upqry="update tbl_cartype set cartype_name='"+cartype+"' where cartype_id='"+editid+"''";
            obj.executeCommand(upqry);
            out.println(upqry);
        }else
           {
            ins="insert into tbl_cartype(cartype_name)values('"+cartype+"')";
            obj.executeCommand(ins);
            out.println(ins);
       }
       }
        if(request.getParameter("did")!=null)
        {
          String del="",delid="";
          delid=request.getParameter("did");
          del="delete from tbl_cartype where cartype_id='"+delid+"'";
          obj.executeCommand(del);
          out.println(del);
        }
         if(request.getParameter("eid")!="")
         {
             String eid=request.getParameter("eid");
             String select="select * from tbl_cartype where cartype_id='"+eid+"'";
             ResultSet rss=obj.selectCommand(select);
             out.println(select);
             if(rss.next())
             {
                  cartype_name=rss.getString("cartype_name");
             }
         }
            %>
            <div id="tab" align="center">
        <form action="" methode="post">
            <table border="1">
                <th colspan="2" align="center">Car type details</th>
                <tr>
                    <td>Car type</td>
                    <td><input type="text" name="car_type" value="<% out.println(cartype_name); %>">
                    <input type="hidden" name="hid" value="<% out.println(editid); %>">
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btn_submit"></td>
                </tr>
            </table>
            <br><br><br><br>
            <table border="1">
                <th>Sl.No</th>
                <th>Car type</th>
                <th>Edit</th>
                <th>Delete</th>
        <%
          int i=0;
          String sel="";
          sel="select * from tbl_cartype";
          ResultSet rs=obj.selectCommand(sel);
          while(rs.next())
          {
              i++;
        %>
                <tr>
                    <td align="center"><% out.println(i); %></td>
                    <td><%= rs.getString("cartype_name") %></td>
                    <td><a href="Car_type.jsp?eid=<%= rs.getString("cartype_id") %>"><img src="../Admin/images/editicon5.png" width="25px" height="25px"/></a></td>
                    <td><a href="Car_type.jsp?did=<%= rs.getString("cartype_id") %>">
                            <img src="../Admin/images/deleteicon.png" width="25px" height="25px" id="img"/></a></td>
                </tr>
         <%}%>
            </table>
        </form>
            </div>
    </body>
</html>
