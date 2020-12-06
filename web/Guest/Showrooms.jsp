<%-- 
    Document   : Showrooms
    Created on : 19 Jan, 2020, 6:54:22 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showrooms</title>
    </head>
    <body>
    <%
        String ins="",sname="",place="",address="",contact="",email="",uname="",psw="",delid="",del="",company="";

        sname=request.getParameter("txt_name");
        place=request.getParameter("txt_place");
        company=request.getParameter("txt_company");
        address=request.getParameter("txt_address");
        contact=request.getParameter("txt_contact");
        email=request.getParameter("txt_email");
        uname=request.getParameter("txt_uname");
        psw=request.getParameter("txt_psw");
        
        if(request.getParameter("btn_submit")!=null)
        {
            ins="insert into tbl_showroom(showroom_name,place_id,showroom_address,showroom_contact,showroom_email,showroom_uname,showroom_psw,company_id)values('"+sname+"','"+place+"','"+address+"','"+contact+"','"+email+"','"+uname+"','"+psw+"','"+company+"')";
            obj.executeCommand(ins);
            out.println(ins);
        }
        if(request.getParameter("did")!=null)
        {
            delid=request.getParameter("did");
            del="delete from tbl_showroom where showroom_id='"+delid+"'";
            obj.executeCommand(del);
            out.println(del);
        }
        %>
        <form action="" method="post">
            <table border="1">
                <tr>
                    <th colspan="2">Showroom details</th>
                </tr>
                <tr>
                    <td>Showroom name</td>
                    <td><input type="text" name="txt_name" required=""></td>
                </tr>
                <tr>
                    <td>place</td>
                    <td><select name="txt_place" required="">
                            <option value="">-----------Select-----------</option>
            <%
                String sel="";
                sel="select * from tbl_place";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
              {
                %>
                <option value="<%= rs.getString("place_id") %>"><%= rs.getString("place_name") %></option>
                     <%}%>
                 
                        </select></td>
                        
                    </tr>
                
                <tr>
                    <td>Address</td>
                    <td><input type="text"  name="txt_address" required=""></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txt_contact" required=""></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><input type="text" name="txt_email" required=""></td>
                </tr>
                 <tr>
                    <td>company</td>
                    <td><select name="txt_company" required="">
                            <option value="">-----------Select-----------</option>
            <%
                String select="";
                select="select * from tbl_company";
                ResultSet rss=obj.selectCommand(select);
                while(rss.next())
              {
                %>
                <option value="<%= rss.getString("company_id") %>"><%= rss.getString("company_name") %></option>
                     <%}%>
                 
                        </select></td>
                        
                    </tr>
                <tr>
                    <td>Username</td>
                    <td> <input type="text" name="txt_uname" required=""></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txt_psw" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit"></td>
                </tr>
            </table>
        </form>
                  </body>
</html>
