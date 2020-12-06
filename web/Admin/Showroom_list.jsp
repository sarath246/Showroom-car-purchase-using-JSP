<%-- 
    Document   : Showroom_list
    Created on : 15 Apr, 2020, 8:22:57 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showroom list</title>
        <%@include file="HomePage.jsp" %>
       
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
            
            .alertid {
                padding: 20px;
                background-color: red;
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

<script>

            setTimeout(function() {
                $('#alert').fadeOut('fast');
            }, 3000);
        </script>
        
        <script>

            setTimeout(function() {
                $('#alertid').fadeOut('fast');
            }, 3000);
        </script>
        
    </head>
    <body>
        <div id="tab" align="center">

    
        <form action="" method="post" name="frm"> 
            
            <div class="btn-group btn-group-lg">
                <a href="Showroom_list.jsp" class="btn btn-primary">Showroom list</a>
                 <a href="Accpt_rej_list_showroom.jsp" class="btn btn-primary">Accepted</a>
    <a href="Rejected_showrooms.jsp" class="btn btn-primary">Rejected</a>
    
  </div>
            
           
            <table border="1">
                
                <th>Select</th>
                <th>Sl.No</th>
                <th>Showroom</th>
                <th style="text-align: center">E-mail</th>
                <th style="text-align: center">Location</th>
                <th style="text-align: center">Company</th>
                <th>Accept/Reject</th>
                <tr>
                    <td><input type="checkbox" name="allCheck" onClick="selectallMe()" title="Select all"></td>
                    <td colspan="5"></td>
                    <td><a href="Showroom_list.jsp" class="btn btn-success">Accept</a>|
                        <a href="Showroom_list.jsp" class="btn btn-danger">Reject</a></td>
                </tr>
                <%
                    String sel="",upquery="",aid="",show_name="",show_names="";
                    int i=0;
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
                     
            else if(request.getParameter("rid")!=null)
            {
            String Rejected=request.getParameter("rid");
            upquery="update tbl_showroom set showroom_status='2' where showroom_id='"+Rejected+"'";
            obj.executeCommand(upquery);
            System.out.println(upquery);
            
             String selec="select * from tbl_showroom where showroom_id='"+Rejected+"'";   
            ResultSet rll=obj.selectCommand(selec);
            if(rll.next())
            {
              show_names=rll.getString("showroom_name");
            }
            
            %>
            
            <div >
            <div class="alertid" id="alertid"  onclick="this.parentElement.style.display = 'none';">
                <strong ><% out.println(show_names); %></strong> Rejected successfully.
            </div>
        </div>
            
            <%
            
            }  
             sel="select * from tbl_showroom s inner join tbl_company c on c.company_id=s.company_id where showroom_status='0'";
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
                    <td><a href="Showroom_list.jsp?aid=<%= rs.getString("showroom_id") %>" class="btn btn-success">Accept</a>|
                        <a href="Showroom_list.jsp?rid=<%= rs.getString("showroom_id") %>" class="btn btn-danger">Reject</a></td>
                </tr>
                <%}%>
            </table>
            
        </form>
        </div>
            

             
    </body>
</html>
