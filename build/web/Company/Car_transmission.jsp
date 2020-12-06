<%-- 
    Document   : Car_transmission
    Created on : 31 Jan, 2020, 10:29:38 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car_transmission</title>
         <%@include file="HomePage.jsp" %>
    </head>
    <body>
    <%
        String ins="",car="",transmission="";
      
        if(request.getParameter("btn_submit")!=null)
        {
        car=request.getParameter("txt_carname");
        transmission=request.getParameter("txt_trans");
        ins="insert into tbl_cartransmission(car_id,transmission_id)values('"+car+"','"+transmission+"')";
        obj.executeCommand(ins);
        out.println(ins);
        }
        %>
        <div id="tab"align="center">
        <form action="" method="post">
            <table border="1">
                <th colspan="2" >Car transmission</th>
                <tr>
                    <td>Car name</td>
                    <td>
                        <select name="txt_carname">
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
                    <td style="color:white;">Transmission</td>
                    <td>
                        <select name="txt_trans">
                            <option value="">--------Select--------</option>
             <%
                String select="select * from tbl_transmission";
                ResultSet rss=obj.selectCommand(select);
                while(rss.next())
               {
                %>
                <option value="<%= rss.getString("transmission_id") %>"><%= rss.getString("transmission_name") %></option>
                <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btn_submit"></td>
                </tr>
            </table>
        </form>
        </div>
    </body>
</html>
