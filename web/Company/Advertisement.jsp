<%-- 
    Document   : Advertisement
    Created on : 20 May, 2020, 9:27:39 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advertisement </title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab"align="center">
        <%
            String ins="",s="",img="",description="";
            
            if(request.getParameter("btn_submit")!=null)
            {
            
            img=request.getParameter("img_advertisement");
            description=request.getParameter("txt_description");
            
            ins="insert into tbl_advertisement(advert_image,advert_discription)values('"+img+"','"+description+"')";
            boolean b=obj.executeCommand(ins);
            
            if(b==true)
            {
                s="success";
            }else{
                s="failed";
            }
              System.out.println(s);
              System.out.println(ins);
            }
            %>
            <form action="AdvertisementUpload.jsp" enctype="multipart/form-data" method="post">
            <table>
                <th colspan="2" style="text-align: center;">Advertisement</th>
                <tr>
                    <td>Upload an image</td>
                    <td><input type="file" name="img_advertisement" required=""></td>
                </tr>
                <tr>
                    <td style="color: white;">Description</td>
                    <td><input type="text" name="txt_description" placeholder="Type here..." required=""> </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" ></td>
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>
