<%-- 
    Document   : Get_image
    Created on : 20 May, 2020, 12:22:11 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
String id = request.getParameter("advert_image");
 
 
try{
    
    
    String sel="select * from tbl_advertisement";
    ResultSet rs = obj.selectCommand(sel);
 
    if(rs.next()){
        Blob blob = rs.getBlob("advert_image");
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
 
        response.setContentType("image/gif");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }
}
catch(Exception e){
    e.printStackTrace();
}   

%>
    </body>
</html>
