<%-- 
    Document   : Editprofile
    Created on : 7 Feb, 2020, 11:24:36 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
    <% 
            
         if(request.getParameter("btn_submit")!=null)
        {
        String place="",address="",email="",contact="";
       
        String name=request.getParameter("txt_name");
        place=request.getParameter("txt_place");
        address=request.getParameter("txt_adrs");
        contact=request.getParameter("txt_contact");
        email=request.getParameter("txt_email");
       
        String upQuery="update tbl_showroom set showroom_name='"+name+"',place_id='"+place+"',showroom_address='"+address+"',showroom_email='"+email+"',showroom_contact='"+contact+"' where showroom_id='"+session.getAttribute("regid")+"' ";   
        obj.executeCommand(upQuery); 
        out.println(upQuery);     
        }
         %>
        <div id="tab"align="center">
        <form action="" method="post">
            <table border="1">
                <th colspan="2">Edit your profile</th>
                <%
                    String sel="select * from tbl_showroom s inner join tbl_place p on p.place_id=s.place_id where showroom_id='"+session.getAttribute("regid")+"'";
                    ResultSet rs=obj.selectCommand(sel);
                    if(rs.next())
                  { 
                    %>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" value="<%= rs.getString("showroom_name") %>"></td>
                </tr>
                <tr>
                    <td style="color:white;">Place</td>
                    <td><select name="txt_place">
                  <%
                      String select="select * from tbl_place";
                      ResultSet rss=obj.selectCommand(select);
                      while(rss.next())
                     {
                         %>
                        <option value="<%= rss.getString("place_id") %>"><%= rss.getString("place_name") %></option>
                      <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txt_adrs" value="<%= rs.getString("showroom_address") %>"></td>
                </tr>
                <tr>
                    <td style="color:white;">Contact no</td>
                    <td><input type="text" name="txt_contact" value="<%= rs.getString("showroom_contact") %>"></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><input type="text" name="txt_email" value="<%= rs.getString("showroom_email") %>"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btn_submit" onclick="myFunction()"></td>
                </tr>
                <%}%>
            </table>


        </form>
        </div>
                        <script>
function myFunction() {
  alert('your profile have been updated');
}
</script>
    </body>
</html>
