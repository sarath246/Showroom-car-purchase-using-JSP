<%-- 
    Document   : Accpt_rej_list_showroom
    Created on : 30 Apr, 2020, 12:12:01 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accepted rejected list showroom</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        
           <script>
var fieldName='chkName';
 
function selectall(){
  var i=document.frm.elements.length;
  var e=document.frm.elements;
  var name=new Array();
  var value=new Array();
  var j=0;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      if(document.frm.elements[k].checked==true){
        value[j]=document.frm.elements[k].value;
        j++;
      }
    }
  }
  checkSelect();
}
function selectCheck(obj)
{
 var i=document.frm.elements.length;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      document.frm.elements[k].checked=obj;
    }
  }
  selectall();
}
 
function selectallMe()
{
  if(document.frm.allCheck.checked==true)
  {
   selectCheck(true);
  }
  else
  {
    selectCheck(false);
  }
}
function checkSelect()
{
 var i=document.frm.elements.length;
 var berror=true;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      if(document.frm.elements[k].checked==false)
      {
        berror=false;
        break;
      }
    }
  }
  if(berror==false)
  {
    document.frm.allCheck.checked=false;
  }
  else
  {
    document.frm.allCheck.checked=true;
  }
}
</script>
        
         <div id="tab" align="center">
            
            <div class="btn-group btn-group-lg">
                <a href="Showroom_list.jsp" class="btn btn-primary">Showroom list</a>
                 <a href="Accpt_rej_list_showroom.jsp" class="btn btn-primary">Accepted</a>
    <a href="Rejected_showrooms.jsp" class="btn btn-primary">Rejected</a>
    
  </div>
        <br/><br/><br/><br/>    
             <form acaction="" method="post" name="frm">
            
                 <table border="1">
                <th>Select</th>
                <th>Sl.No</th>
                <th>Company name</th>
                <th style="text-align: center;">Block</th>
                <tr>
                    <td><input type="checkbox" name="allCheck" onClick="selectallMe()" title="Select all"></td>
                    <td></td>
                    <td></td>
                    <td style="text-align: center;"><a href="Acpt_rej_list_comp.jsp" class="btn btn-info">Block</a></td>
                </tr>
                
                <%
                    String sel="",upqury="",upq="";
                    int i=0;
                    
                    if(request.getParameter("bid")!=null)
                    {
                     String block=request.getParameter("bid");
                    upqury="update tbl_showroom set showroom_status='3' where showroom_id='"+block+"'";
                    obj.executeCommand(upqury);
                    System.out.println(upqury);
                    }
                    else if(request.getParameter("uid")!=null)
                    {
                     String unblock=request.getParameter("uid");
                    upq="update tbl_showroom set showroom_status='1' where showroom_id='"+unblock+"'";
                    obj.executeCommand(upq);
                    System.out.println(upq);
                    }
                    
                    sel="select * from tbl_showroom where showroom_status='1'";
                    ResultSet rs=obj.selectCommand(sel);
                    while(rs.next())
                    {    
                       i++;
                    %>
                    <tr>
                        <td><input type="checkbox" name="chkName" onClick="selectall()"></td>
                        <td><%= i %></td>
                        <td><%= rs.getString("showroom_name") %></td>
                        <td><a href="Accpt_rej_list_showroom.jsp?bid=<%= rs.getString("showroom_id") %>" class="btn btn-info">Block</a></td>
<!--                        <td><a href="#">Unblock</a></td>-->
                    </tr>
                    <%}%>
                    
                    <%
                        String sele="";
                        int p=0;
                        sele="select * from tbl_showroom where showroom_status='3'";
                        ResultSet rss=obj.selectCommand(sele);
                        while(rss.next())
                        {
                         p++;
                    %>
                    <tr>
                        <td><%= p %></td>
                        <td><%= rss.getString("showroom_name") %></td>
<!--                        <td ><a href="#" style="color: red;" >Blocked</a></td>-->
                        <td><a href="Accpt_rej_list_showroom.jsp?uid=<%= rss.getString("showroom_id") %>" class="btn btn-danger">Unblock</a></td>
                    </tr>
                    <%}%>
            </table>
            
        </form>
         </div>
    </body>
</html>
