<%-- 
    Document   : User_reject
    Created on : 10 Jun, 2020, 11:16:33 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User reject</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <form method="post">
            
        <%
            String sel="",uid="",upquery="";
            
             if(request.getParameter("btn_submit")!=null)
            {
            if(request.getParameter("eid")!=null)
            {
            String Rejected=request.getParameter("eid");
            String Rej=request.getParameter("txt_area");
            upquery="update tbl_userreg set user_status='2' where user_id='"+Rejected+"'";
            obj.executeCommand(upquery);
            System.out.println(upquery);
            
            String ins="insert into tbl_rejectedreason(rej_name,user_id) values('"+Rej+"','"+Rejected+"')";
            obj.executeCommand(ins);
            out.println("sucess");
            out.println(ins);
            
            }
            }else if(request.getParameter("btn_cancel")!=null)
            {
                response.sendRedirect("../Admin/User_list.jsp");
            }
            sel="select * from tbl_userreg where user_status='0'";
            ResultSet rs=obj.selectCommand(sel);
            System.out.println(sel);
            while(rs.next())
            {
                uid=rs.getString("user_id");
            }
            %>
            
            <table border="1" style="width: 30%; height: 80%;">
                
                <tr>
                    <th colspan="2" style="text-align: center;">Any reason send to the user</th>
                </tr>
                <tr>
<!--                    <td>Reason</td>-->
<td><textarea name="txt_area" placeholder="Enter here..." ></textarea></td>
                </tr>
                <tr>
                    <td colspan="4" style="alignment-adjust: central; width: 80px;"><input type="submit" name="btn_submit" value="Send|reject">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="btn_cancel" value="Cancel"></td>
                </tr>
            </table>
            
        </form>
        </div>
    </body>
</html>
