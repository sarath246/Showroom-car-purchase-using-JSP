<%-- 
    Document   : Colour
    Created on : 18 Jan, 2020, 1:03:06 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Colour</title>
        <%@include file="HomePage.jsp" %>
        
        <style>
#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>
        
    </head>
    <body>
         <script>
function myFunction() {
  var x = document.getElementById("snackbar");
  x.className = "show";
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 8000);
}
</script>
    <%
        String ins="",color="",sel="",del="",delid="",editid="",update="",select="",s="",col="";
        color=request.getParameter("txt_color");
         editid=request.getParameter("eid");
         
        s="select * from tbl_color where color_name='"+color+"'";
        ResultSet rrt=obj.selectCommand(s);
        if(rrt.next()){
            
            col=rrt.getString("color_name");
        }
         
    if(request.getParameter("btn_color")!=null)
    {
    if(request.getParameter("eid")!=null)
    {
        update="update tbl_color set color_name='"+color+"' where color_id='"+editid+"'";
        obj.executeCommand(update);
        out.println(update);
    }else if(color.matches(col)){
        out.println("<script>alert('already exist')</script>");
        
        %>
        
        <div id="snackbar">Some text some message..</div>
        
        <%
        
    }
    else
    {
        ins="insert into tbl_color(color_name)values('"+color+"')";
        obj.executeCommand(ins);
        out.println(ins);
    }
    }
    if(request.getParameter("did")!=null)
    {
        delid=request.getParameter("did");
        del="delete from tbl_color where color_id='"+delid+"'";
        obj.executeCommand(del);
        out.println(del);
    }
    if(request.getParameter("eid")!=null)
    {
        editid=request.getParameter("eid");
        select="select * from tbl_color where color_id='"+editid+"'";
        ResultSet rss=obj.selectCommand(select);
        if(rss.next())
        {
            color=rss.getString("color_name");
        }
    }
        %>
        <div id="tab" align="center">
        <form action="" method="post">
           
                <table border="1">
                    <tr>
                        <th colspan="2">Colour details</th>
                    </tr>
                    <tr>
                        <td>Colour</td>
                        <td><input type="text" name="txt_color" value="<% out.println(color); %>" required="required"></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2"><input type="submit" name="btn_color" onclick="myFunction()"></td>
                    </tr>
                </table>
               </form>
            <br><br><br><br>
            <table border="1">
                <tr>
                    <th>Sl.No</th>
                    <th>Colour</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
        <%
            int i=0;
            sel="select * from tbl_color";
            ResultSet rs=obj.selectCommand(sel);
            while(rs.next())
            {
                i++;
           %>
           <tr>
               <td><% out.println(i); %></td>
               <td><%= rs.getString("color_name") %></td>
               <td><a href="Colour.jsp?eid=<%= rs.getString("color_id") %>"><img src="../Admin/images/editicon5.png" width="25px" height="25px"/></a></td>
               <td><a href="Colour.jsp?did=<%= rs.getString("color_id") %>">
                       <img src="../Admin/images/deleteicon.png" width="25px" height="25px" id="img"/></a></td>
           </tr>
           <%}%>
            </table>
        </div>
    </body>
</html>
