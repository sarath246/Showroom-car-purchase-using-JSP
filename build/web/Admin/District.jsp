<%-- 
    Document   : District
    Created on : 17 Jan, 2020, 12:41:39 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
        <%@include file="HomePage.jsp" %>
        <style>
            img{
                width:10px;height:10px;
            }
            </style>
    </head>
    <body>
        <%
            String dname="",editid="",district_name="",edit="",update="",sname="",s="",dis="";
            dname=request.getParameter("txtdistrict");
            sname=request.getParameter("sel_state");
            
            s="select * from tbl_district where district_name='"+dname+"'";
            ResultSet rr=obj.selectCommand(s);
            if(rr.next()){
                dis=rr.getString("district_name");
            }
            
            if(request.getParameter("btnsave")!=null)
            {
              if(request.getParameter("eid")!=null)
              {
                edit=request.getParameter("eid");
                update="update tbl_district set district_name='"+dname+"',state_name='"+sname+"' where district_id='"+edit+"'";
                obj.executeCommand(update);
                //out.println(update);
               
              }else if(dname.matches(dis))
              {
                  out.println("<script>alert('already exists')</script>");
              }else
              {
                String ins="insert into tbl_district(district_name,state_id) values('"+dname+"','"+sname+"')";
                obj.executeCommand(ins);
                //out.println(ins);
            }
            }
              if(request.getParameter("did")!=null)
            {
              String delid=request.getParameter("did");
              String del="delete from tbl_district where district_id='"+delid+"'";
              obj.executeCommand(del);
              //out.println(del);
            }
               if(request.getParameter("eid")!=null)
            {
                editid=request.getParameter("eid");
                String select="select * from tbl_district where district_id='"+editid+"'";
                ResultSet rs=obj.selectCommand(select);
                if(rs.next())
          {
                district_name=rs.getString("district_name");
            }
            }
            
            %>
            <div id="tab" align="center">
        <form method="post">
        <table border="1">
            <th colspan="2" style="text-align: center;">
                Enter district
            </th>
            <tr>
<!--                <td align="center">
                    District
                </td>-->
                <td>
                    <input type="text" name="txtdistrict" placeholder="Enter district..." value="<% out.println(district_name); %>" required="required">
                </td>
            </tr>
            <tr>
<!--                <td>State</td>-->
                <td> <select name="sel_state" value="" required="required">
            <option >----Select state----</option>
        <%
            String sele="select * from tbl_state ";
            ResultSet rss=obj.selectCommand(sele);
            while(rss.next())
        {
            %>
            <option value="<%= rss.getString("state_id") %>"><%= rss.getString("state_name") %></option>
            <% } %> 
            </select>
            
                </td>
            </tr>
           
            <tr>
                <td align="center" colspan="2">
            <input type="submit" name="btnsave" >
            </td>
            </tr>
        </table><br><br><br><br>
       
            <table border="1">
        
                <tr>
              
                <th style="text-align:center;">Sl.No</th>
                <th style="text-align:center;">District</th>
                <th style="text-align:center;">State</th>
                <th>Edit</th>
                <th>Delete </th>
                
                </tr>
         <%
          
          int i=0;
          String sel="select * from tbl_district d inner join tbl_state s on s.state_id=d.state_id order by d.district_id desc";
          ResultSet rs=obj.selectCommand(sel);
          while(rs.next())
          {
           i++;
         %>
                <tr>
                   
                    <td align="center"><% out.println(i);  %></td>
                    <td style="text-align:center;"><%= rs.getString("district_name")  %></td>
                    <td style="text-align:center;"><%= rs.getString("state_name") %></td>
                    <td><a href="District.jsp?eid=<%= rs.getString("district_id") %>"><img src="../Admin/images/editicon5.png" width="150px" height="150px"/></a></td>
                    <td><a href="District.jsp?did=<%= rs.getString("district_id") %>">
                            <img src="../Admin/images/deleteicon.png" width="250px" height="250px" id="img"/>
                        </a></td>
                </tr>
        <%
          }
         %>
            </table>
         
            
            </form>
            </div>
    </body>
    <br/><br/><br/><br/><br/>
</html>
