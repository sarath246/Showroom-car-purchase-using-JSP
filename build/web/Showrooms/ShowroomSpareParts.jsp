<%-- 
    Document   : Car_gallary
    Created on : 8 Feb, 2020, 2:18:51 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showroom spare parts</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <%
            String ins="",spareparts="",quantity="",img="";
            if(request.getParameter("btn_submit")!=null)
    {
            quantity=request.getParameter("spareparts_quantity");
            spareparts=request.getParameter("txt_name");
            img=request.getParameter("img_spareparts");
            ins="insert into tbl_showroomspareparts(spareparts_id,spareparts_quantity,spare_image)values('"+spareparts+"','"+quantity+"','"+img+"')";
            obj.executeCommand(ins);
            System.out.println(ins);
    }
            %>
            <div id="tab"align="center">
        <form action="SparePartsUpload.jsp" enctype="multipart/form-data" method="post">
            <table border="1">
                <th colspan="2" >Showroom Spare parts</th>
                <tr>
                    <td>Spare parts name</td>
                    <td>
                        <select name="txt_name" required="">
                            <option value="">--------Select--------</option>
                        <%
                            String sel="select * from tbl_sparepartsdetails";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                           {
                            %>
                            <option value="<%= rs.getString("spareparts_id") %>"><%= rs.getString("spareparts_name") %></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    
                    <td>Upload an image</td>
                    <td><input type="file" name="img_spareparts"></td>
                    
                </tr>
                
                 <tr>
                     <td style="text-align: center;">Quantity</td>
                    <td>
                        <input type="text" name="spareparts_quantity" placeholder="Type here..." required="">
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
