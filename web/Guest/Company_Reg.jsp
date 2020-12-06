<%-- 
    Document   : Company_Reg
    Created on : 1 Feb, 2020, 10:34:58 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company_registration</title>
        <%@include file="Register.jsp" %>
    </head>
    <body>
    <%
        String ins="",name="",place="",uname="",psw="";
        name=request.getParameter("txt_name");
        place=request.getParameter("txt_place");
        uname=request.getParameter("txt_uname");
        psw=request.getParameter("txt_psw");
    if(request.getParameter("btn_submit")!=null)
    {
        ins="insert into tbl_company(company_name,place_id,company_uname,company_psw)values('"+name+"','"+place+"','"+uname+"','"+psw+"')";
        obj.executeCommand(ins);
        out.println(ins);
    }
        %>
        <div id="tab" align="center">
        <form action="" method="post">
            <table border="1">
                <th colspan="2">Company Registration</th>
                <tr>
                    <td>Company name</td>
                    <td><input type="text" name="txt_name"></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="txt_place">
                            <option value="">-----------Select-----------</option>
            <%
                String sel="select * from tbl_place";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
               {
                %>
                <option value="<%= rs.getString("place_id") %>"><%= rs.getString("place_name") %></option>
                <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="txt_uname"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txt_psw"></td>
                </tr>
                <tr>
                    <td align="center"><input type="submit" name="btn_submit"></td>
                </tr>   
            </table>
        </form>
        </div>
    </body>
</html>
