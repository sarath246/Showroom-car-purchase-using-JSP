<%-- 
    Document   : Car_colors
    Created on : 29 Jan, 2020, 3:54:14 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car colours</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
    <%
        String ins="",car="",color="",s="",col="";
        color=request.getParameter("txt_color");
        
        s="select * from tbl_carcolor where car_color='"+color+"'";
        ResultSet rrt=obj.selectCommand(s);
        if(rrt.next()){
            
            col=rrt.getString("color_id");
        }
        
        if(request.getParameter("btn_submit")!=null)
        {
        car=request.getParameter("txt_carname");
        ins="insert into tbl_carcolor(car_id,color_id)values('"+car+"','"+color+"')";
        obj.executeCommand(ins);
        out.println(ins);
        }
        %>
        <div id="tab" align="center">
        <form action="" method="post">
            <table border="1">
                <th colspan="2">Car colors</th>
                <tr><td>Car name</td>
                            <td><select name="txt_carname">
                                    <option value="">--------Select--------</option>
            <%
                String sel="select * from tbl_cardetails";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
              {
                %>
                <option value="<%= rs.getString("car_id") %>"><%= rs.getString("car_name") %></option>
                <%}%>
                        </select></td>
                </tr>
                <tr><td>Color</td>
                    <td>
                        <select name="txt_color">
                            <option value="">--------Select--------</option>
                <%
                   String select="select * from tbl_color";
                   ResultSet rss=obj.selectCommand(select);
                   while(rss.next())
                 {
                    %>
                    <option value="<%= rss.getString("color_id") %>"><%= rss.getString("color_name") %></option>
                    
                    <%}%>
<!--                    if(color=="Green"){
                    
                    }-->
                        </select>
                    </td>
                </tr>
                <tr><td align="center" colspan="2"><input type="submit" name="btn_submit"></td></tr>
            </table>
        </form>
        </div>
    </body>
</html>
