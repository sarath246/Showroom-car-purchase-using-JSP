<%-- 
    Document   : Transmission_type
    Created on : 18 Jan, 2020, 3:01:14 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transmission_type</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
    <%
        String ins="",trans="",delid="",del="",edit="",update="",sele="";
        trans=request.getParameter("txt_trans");
        edit=request.getParameter("eid");
         
    if(request.getParameter("btn_submit")!=null)
    {
    if(request.getParameter("eid")!=null)
    {
       
        update="update tbl_transmission set transmission_name='"+trans+"' where transmission_id='"+edit+"'";
        obj.executeCommand(update);
        out.println(update);
    }
    else
    {
        ins="insert into tbl_transmission(transmission_name)values('"+trans+"')";
        obj.executeCommand(ins);
        out.println(ins);
    }
    }
    if(request.getParameter("did")!=null)
    {
        delid=request.getParameter("did");
        del="delete from tbl_transmission where transmission_id='"+delid+"'";
        obj.executeCommand(del);
    }
    if(request.getParameter("eid")!=null)
    {
        sele="select * from tbl_transmission where transmission_id='"+edit+"'";
        ResultSet rss=obj.selectCommand(sele);
        if(rss.next())
    {
      trans=rss.getString("transmission_name");
     }
    }
        %>
         <div id="tab" align="center">
        <form action="" method="post">
        <table border="1">
            <tr>
                <th colspan="2">Transmission type</th>
            </tr>
            <tr>
                <td>Type</td>
                <td><input type="text" name="txt_trans" value="<% out.println(trans); %>"></td>
            </tr>
            <tr>
                <td align="center" colspan="2"><input type="submit" name="btn_submit"></td>
            </tr>
        </table>
        </form>
        <br><br><br><br>
        <form action="" method="post">
            <table border="1">
                <tr>
                    <th>Sl.No</th>
                    <th>Tansmission type</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
        <%
          int i=0;
          String sel="";
          sel="select * from tbl_transmission";
          ResultSet rs=obj.selectCommand(sel);
          while(rs.next())
          {
              i++;
        %>
        <tr>
            <td align="center"><% out.println(i); %></td>
            <td><%= rs.getString("transmission_name") %></td>
            <td><a href="Transmission_type.jsp?eid=<%= rs.getString("transmission_id") %>"><img src="../Admin/images/editicon5.png" width="25px" height="25px"/></a></td>
            <td><a href="Transmission_type.jsp?did=<%= rs.getString("transmission_id") %>">
                    <img src="../Admin/images/deleteicon.png" width="25px" height="25px" id="img"/></a></td>
        </tr>
        <%}%>
            </table>
        </form>
         </div>
    </body>
</html>
