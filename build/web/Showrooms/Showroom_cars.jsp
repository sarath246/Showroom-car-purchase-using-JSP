<%-- 
    Document   : Showroom_cars
    Created on : 31 Jan, 2020, 10:48:06 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showroom_cars</title>
        <%@include file="HomePage.jsp" %>
       
    </head>
    <body>
        <%
        String ins="",car="",showroom="",price="",img="";
      
        if(request.getParameter("btn_submit")!=null)
        {
        car=request.getParameter("txt_carname");
        showroom=request.getParameter("txt_showroom");
        price=request.getParameter("txt_price");
        img=request.getParameter("img_car");
        ins="insert into tbl_showroomcars(showroom_id,car_id,car_price,car_image)values('"+car+"','"+showroom+"','"+price+"','"+img+"')";
        obj.executeCommand(ins);
        out.println(ins);
        }
        %>
        <div id="tab"align="center">
        <form action="ShowroomCarsUpload.jsp" enctype="multipart/form-data" method="post">
            <table border="1">
                <th colspan="2">Showroom Cars</th>
               
                <tr>
                    <td style="text-align: center;">Car name</td>
                    <td>
                        <select name="txt_carname" required="">
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
                    
                    <td style="color: white;">Upload an image</td>
                    <td><input type="file" name="img_car"></td>
                    
                </tr>
                
                <tr>
                    <td style="text-align: center;">Price</td>
                    <td><input type="text" name="txt_price" placeholder="Type here..." required=""></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btn_submit" ></td>
                </tr>
            </table>
        </form>
</div>
    </body>
</html>
