<%-- 
    Document   : Rejected_showrooms
    Created on : 12 Jun, 2020, 1:00:17 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rejected showrooms</title>
        <%@include file="HomePage.jsp" %>
    </head>
    
     <style>
            .alert {
                padding: 20px;
                background-color: green;
                color: white;
            }

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }
     </style>
    
    <script>

            setTimeout(function() {
                $('#alert').fadeOut('fast');
            }, 3000);
        </script>
        
    
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
                <th>Accept</th>
                <tr>
                    <td><input type="checkbox" name="allCheck" onClick="selectallMe()" title="Select all"></td>
                    <td></td>
                    <td></td>
                    <td style="text-align: center;"><a href="Acpt_rej_list_comp.jsp" class="btn btn-success">Accept</a></td>
                </tr>
                 <%
                    String sel="",upquery="",aid="",show_name="",show_names="",selectshow="";
                    int i=0;
                    int j=0;
                    aid=request.getParameter("aid");
                    
                     if(request.getParameter("aid")!=null)
            {
            String Accepted=request.getParameter("aid");
            upquery="update tbl_showroom set showroom_status='1' where showroom_id='"+Accepted+"'";
            obj.executeCommand(upquery);
            System.out.println(upquery);
            
            String sele="select * from tbl_showroom where showroom_id='"+aid+"'";   
            ResultSet rl=obj.selectCommand(sele);
            if(rl.next())
            {
                show_name=rl.getString("showroom_name");
            }
            %>
            
        <div >
            <div class="alert" id="alert"  onclick="this.parentElement.style.display = 'none';">
                <strong ><% out.println(show_name); %></strong> Accepted successfully.
            </div>
        </div>
            
                <%
            
            }
                  
                %>
        <%
        
            selectshow="select * from tbl_showroom where showroom_status='2'";
                    ResultSet rsi=obj.selectCommand(selectshow);
                    while(rsi.next())
                    {    
                       i++;
                    %>
                    <tr>
                        <td><input type="checkbox" name="chkName" onClick="selectall()"></td>
                        <td><%= i %></td>
                        <td><%= rsi.getString("showroom_name") %></td>
                        <td><a href="Rejected_showrooms.jsp?aid=<%= rsi.getString("showroom_id") %>" class="btn btn-success">Accept</a></td>
                 
                    </tr>
                    <%}%>
                 </table>
    </form>
        </div>
    </body>
</html>
