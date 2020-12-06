<%-- 
    Document   : Replay_user
    Created on : 8 Apr, 2020, 11:02:04 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Replay user</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab"align="center">
        <form action="" method="post">
            <table border="1">
                <%
                   String ins="",s="",id="";
                   String replay=request.getParameter("txt_replay");
                   String userid=request.getParameter("uid");
                   int status=1;
                   System.out.println(userid);
                   if(request.getParameter("btn_submit")!= null)
                   {
                   ins="insert into tbl_userreplay(user_replay,user_id,replay_status)values('"+replay+"','"+userid+"','"+status+"')";
                   boolean b=obj.executeCommand(ins);
                   if(b==true)
                   {
                       s="success";
                   }else
                   {
                       s="failed";
                   }
                      System.out.println(s);
                      out.println("<script>alert('Your replay sended success')</script>");
                      
                      id=request.getParameter("uid");
                      ins="update tbl_carbooking set car_status='1' where user_id='"+id+"'";
                      obj.executeCommand(ins);
                      
                   }
                  %>
                <tr>
<!--                    <td style="color:#ffff;">Replay </td>-->
<td><textarea  name="txt_replay" id="" placeholder="Type your replay..." required=""></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" value="Send"></td>
                </tr>
            </table>
            
        </form>
        </div>
    </body>
</html>
