<%-- 
    Document   : Spareparts_details
    Created on : 8 Feb, 2020, 3:37:12 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spare parts details</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
    <%
        String ins="",parts="",partstype="",cost="",car="",description="",img="";
       
        parts=request.getParameter("txt_name");
        partstype=request.getParameter("txt_parts");
        cost=request.getParameter("txt_cost");
        car=request.getParameter("txt_car");
        description=request.getParameter("txt_desptn");
        
       if(request.getParameter("btn_submit")!=null)
       { 
        ins="insert into tbl_sparepartsdetails(spareparts_name,sparepartstype_id,spareparts_cost,car_id,car_description)values('"+parts+"','"+partstype+"','"+cost+"','"+car+"','"+description+"')";
        obj.executeCommand(ins);
        out.println(ins);
       } 
        %>
        <div id="tab"align="center">
        <form action="Spairepartsupload.jsp" method="post" enctype="multipart/form-data" >
            <table border="1">
                <th colspan="2">Spare parts details</th>
                <tr>
                    <td>Spare parts name</td>
                    <td><input type="text" name="txt_name" placeholder="Type here..." required=""></td>
                </tr>
                <tr>
                    <td style="color:white;">Spare parts type</td>
                    <td>
                        <select name="txt_parts" required="">
                            <option value="">--------Select--------</option>
            <%
                String sel="select * from tbl_spareparts";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
             {
                %>
                <option value="<%= rs.getString("sparepartstype_id") %>"><%= rs.getString("sparepartstype_name") %></option>
               <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Cost</td>
                    <td><input type="text" name="txt_cost" placeholder="Type here..." required=""></td>
                </tr>
                <tr>
                    <td style="color:white;">Car</td>
                    <td>
                        <select name="txt_car" required="">
                            <option value="">--------Select--------</option>
            <%
                String select="select * from tbl_cardetails";
                ResultSet rss=obj.selectCommand(select);
                while(rss.next())
             {
                %>
                <option value="<%= rss.getString("car_id") %>"><%= rss.getString("car_name") %></option>
               <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Car description</td>
                    <td><input type="text" name="txt_desptn" placeholder="Type here..."></td>
                </tr>
                <tr>
                    <td style="color:white;">Image</td>
                    <td>
                        <input type="file" name="car_image" required="">
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
