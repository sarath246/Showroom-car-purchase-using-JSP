<%-- 
    Document   : Place
    Created on : 19 Jan, 2020, 9:59:49 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
    <%
         String ins="",state="",district="",place="",delid="",del="",edit="",update="",sels="",s="",pl="";
         state=request.getParameter("txt_state");
         district=request.getParameter("txt_district");
         place=request.getParameter("txt_place");
         edit=request.getParameter("eid");
         
         s="select * from tbl_place where place_id='"+place+"'";
         ResultSet rrt=obj.selectCommand(s);
         if(rrt.next()){
             
             pl=rrt.getString("place_name");
         }
            
        if(request.getParameter("txt_state")!=null)
        {
        if(request.getParameter("eid")!=null)
        {
            update="update tbl_place set state_name='"+state+"',district_name='"+district+"',place_id='"+place+"' where place_id='"+edit+"'";
            obj.executeCommand(update);
           // out.println(update);
        }else if(place.matches(pl))
        {
            out.println("<script>alert('already exists')</script>");
        }
        else
        {
            ins="insert into tbl_place(place_name,state_id,district_id)values('"+place+"','"+state+"','"+district+"')";
            obj.executeCommand(ins);
           // out.println(ins);
        }
        }
        if(request.getParameter("did")!=null)
        {
            delid=request.getParameter("did");
            del="delete from tbl_place where place_id='"+delid+"'";
            obj.executeCommand(del);
            //out.println(del);
        }
        if(request.getParameter("eid")!=null)
        {
            sels="select * from tbl_place p inner join tbl_state s inner join tbl_district d on d.district_id=p.district_id and s.state_id=p.state_id where place_id='"+edit+"'";
            ResultSet rr=obj.selectCommand(sels);
            if(rr.next())
            {
                state=rr.getString("state_name");
                district=rr.getString("district_name");
                place=rr.getString("place_name");
            } 
        }
        %>
        <div id="tab" align="center">
        <form action="" method="post">
            <table border="1">
                <tr>
                    <th colspan="2">Place details</th>
                </tr>
                <tr>
                    <td>State</td>
                            <td><select name="txt_state" value="" required="required">---------Select---------
                                    <option value=""><% out.println(state); %></option>
            <%
                String sel="select * from tbl_state ";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
            {
                %>
                <option value="<%= rs.getString("state_id") %>"><%= rs.getString("state_name") %></option>
                <%}%>
                        </select></td>
                </tr>
                <tr>
                    <td>District</td>
                            <td><select name="txt_district" required="required">---------Select---------
                                    <option value=""><% out.println(district); %></option>
                <%
                String selec="select * from tbl_district";
                ResultSet rss=obj.selectCommand(selec);
                while(rss.next())
             {
                %>
                <option value="<%= rss.getString("district_id") %>"><%= rss.getString("district_name") %></option>
                <%}%>
                        </select></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text" name="txt_place" value="<% out.println(place); %>" required="required"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btn_submit"></td>
                </tr>
            </table>    
        </form> 
                        <br><br><br><br>
                        <form action="" method="post">
                            <table border="1">
                                <tr>
                                <th style="text-align:center;">Sl.No</th>
                                <th style="text-align:center;">State</th>
                                <th style="text-align:center;">District</th>
                                <th style="text-align:center;">Place</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                </tr>
         <%
                 int i=0;
                 String select="";
                 select="select * from tbl_place p inner join tbl_state s inner join tbl_district d on d.district_id=p.district_id and s.state_id=p.state_id";
                 ResultSet rsss=obj.selectCommand(select);
                 while(rsss.next())
              {
                  i++;
                %>
                <tr>
                    <td><% out.println(i); %></td>
                    <td><%= rsss.getString("state_name") %></td>
                    <td><%= rsss.getString("district_name") %></td>
                    <td><%= rsss.getString("place_name") %></td>
                    <td><a href="Place.jsp?eid=<%= rsss.getString("place_id") %>"><img src="../Admin/images/editicon5.png" width="25px" height="25px"/></a></td>
                    <td><a href="Place.jsp?did=<%= rsss.getString("place_id") %>">
                            <img src="../Admin/images/deleteicon.png" width="25px" height="25px" id="img"/></a></td>
                </tr>
                <%}%>
                            </table>
                        </form>
        </div>
    </body>
    <br/><br/><br/><br/><br/>
</html>
