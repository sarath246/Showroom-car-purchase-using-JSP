<%-- 
    Document   : Details_showrooms
    Created on : 13 Jun, 2020, 7:57:37 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showroom details</title>
        <%@include file="HomePage.jsp" %>
    </head>
    
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
    
    <body>
        <div id="tab" align="center">
            <form method="post" name="frm">
                <table border="1">
                    <th>Select</th>
                    <th>Sl.No</th>
                    <th style="text-align: center;">Showroom</th>
                    <th style="text-align: center;">E mail</th>
                    <th style="text-align: center;">Address</th>
                    <th style="text-align: center;">Company</th>
                    <th>Share others</th>
                    <tr>
                    <td><input type="checkbox" name="allCheck" onClick="selectallMe()" title="Select all"></td>
                    <td colspan="5" ><input type="text" value="" style="width: 250px;" placeholder="Search here..."/>&nbsp;&nbsp;&nbsp;<a href="Details_showrooms.jsp" class="btn btn-success">Search</a></td>
                    <td style="text-align: center;"><a href="Showroom_list.jsp" class="btn btn-success">Share</a></td>
                </tr>
         <%
            String sel="";
            int i=0;
              
             sel="select * from tbl_showroom s inner join tbl_company c on c.company_id=s.company_id ";
             ResultSet rs=obj.selectCommand(sel);
             System.out.println(sel);
             while(rs.next())
              {
               i++;
              %>
                <tr>
                    <td><input type="checkbox" name="chkName" onClick="selectall()"></td>
                    <td><%= i %></td>
                    <td><%= rs.getString("showroom_name") %></td>
                    <td><%= rs.getString("showroom_email") %></td>
                    <td><%= rs.getString("showroom_address") %></td>
                    <td><%= rs.getString("company_name") %></td>
                    <td style="text-align: center;"><a href="Showroom_list.jsp?aid=<%= rs.getString("showroom_id") %>" class="btn btn-success">Share</a></td>
                </tr>
                <%}%>
                </table>
            </form>
        </div>
                <br/><br/><br/><br/>
    </body>
</html>
