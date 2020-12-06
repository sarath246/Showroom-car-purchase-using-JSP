<%-- 
    Document   : Car_gallary
    Created on : 8 Feb, 2020, 2:18:51 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spare parts gallary</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <%
            String ins="",image="",spareparts="";
            if(request.getParameter("btn_submit")!=null)
    {
            image=request.getParameter("spareparts_image");
            spareparts=request.getParameter("txt_name");
            ins="insert into tbl_sparepartsgallary(spareparts_id,spareparts_image)values('"+spareparts+"','"+image+"')";
            obj.executeCommand(ins);
            System.out.println(ins);
    }
            %>
            <div id="tab"align="center">
        <form action="SpareParts_gallary_upload.jsp" enctype="multipart/form-data" method="post">
            <table border="1">
                <th colspan="2">Spare parts gallary</th>
                <tr>
                    <td>spare parts name</td>
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
                    <td style="color:white;">Image</td>
                    <td>
                        <input type="file" name="spareparts_image" required="">
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
