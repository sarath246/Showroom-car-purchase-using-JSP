<%-- 
    Document   : Spareparts_type
    Created on : 8 Feb, 2020, 2:42:18 PM
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
            String ins="",name="";
           if(request.getParameter("btn_submit")!=null)
           {
            name=request.getParameter("txt_parts");
            ins="insert into tbl_spareparts(sparepartstype_name)values('"+name+"')";
            obj.executeCommand(ins);
            out.println(ins);
           }
        %>
        <div id="tab" align="center">
        <form action="" method="post">
            <table border="1">
                <th colspan="2">Spare parts type</th>
                <tr>
                    <td>Spare parts name</td>
                    <td><input type="text" name="txt_parts"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btn_submit"></td>
                </tr>
            </table>
        </form>
        </div>
    </body>
</html>
