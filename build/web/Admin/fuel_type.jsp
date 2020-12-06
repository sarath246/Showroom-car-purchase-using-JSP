
<%-- 
    Document   : fuel_type
    Created on : 18 Jan, 2020, 11:43:31 AM
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
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
    <%
        String ins="",fuel="",sel="",del="",delid="",edit="",update="",editid="",select="";
        fuel=request.getParameter("txt_fuel");
        editid=request.getParameter("hid");
        
     if(request.getParameter("btn_submit")!=null)
     {
     if(request.getParameter("eid")!="")
     {
        edit=request.getParameter("eid");
        out.println(edit);
        update="update tbl_fueltype set fueltype_name='"+fuel+"' where fueltype_id='"+editid+"'";
        obj.executeCommand(update);
        out.println(update);
     }else
     {
         ins="insert into tbl_fueltype(fueltype_name)values('"+fuel+"')";
         obj.executeCommand(ins);
         out.println(ins);
     }
     }
        if(request.getParameter("did")!=null)
        {
            delid=request.getParameter("did");
            del="delete from tbl_fueltype where fueltype_id='"+delid+"'";
            obj.executeCommand(del);
            //out.println(del);
        }
        if(request.getParameter("eid")!="")
        {
            editid=request.getParameter("eid");
            select="select * from tbl_fueltype where fueltype_id='"+editid+"'";
            ResultSet rss=obj.selectCommand(select);
            if(rss.next())
            {
                fuel=rss.getString("fueltype_name");
            }
        }
       
        %>
         <div id="tab" align="center">
        <form action="" methode="post">
            <table border="1">
                <tr>
                    <td colspan="2">Fuel type</td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><input type="text" name="txt_fuel" value="<% out.println(fuel); %>">
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
                <th>Fuel type</th>
                <th>Edit</th>
                <th>Delete</th>
        <%
          int i=0;
          sel="select * from tbl_fueltype";
          ResultSet rs=obj.selectCommand(sel);
          while(rs.next())
          {
              i++;
             
        %>
                <tr>
                    <td align="center"><% out.println(i); %></td>
                    <td><%= rs.getString("fueltype_name") %></td>
                    <td><a href="fuel_type.jsp?eid=<%= rs.getString("fueltype_id") %>"><img src="../Admin/images/editicon5.png" width="25px" height="25px"/></a></td>
                    <td><a href="fuel_type.jsp?did=<%= rs.getString("fueltype_id") %>">
                            <img src="../Admin/images/deleteicon.png" width="25px" height="25px" id="img"/></a></td>
                </tr>
                <%}%>
            </table>
        </form>
         </div>
    </body>
</html>
