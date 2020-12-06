<%-- 
    Document   : Company_list
    Created on : 30 Apr, 2020, 12:04:12 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company list</title>
        <%@include file="HomePage.jsp" %>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
    
    <body>
        <div id="tab" align="center">
          <div class="btn-group btn-group-lg">
                <a href="Company_list.jsp" class="btn btn-primary">Company list</a>
                 <a href="Acpt_rej_list_comp.jsp" class="btn btn-primary">Accepted</a>
    <a href="" class="btn btn-primary">Rejected</a>
    
  </div>
            <br/><br/><br/><br/>
        <form action="" method="post" name="frm">
            <table border="1">
                <th>Select</th>
                <th>Sl.No</th>
                <th style="text-align: center;">Company name</th>
                <th style="text-align: center;">Place</th>
                <th style="text-align: center;">Accept/Reject</th>
                <tr>
                    <td><input type="checkbox" name="allCheck" onClick="selectallMe()" title="Select all"></td>
                    <td colspan=""></td>
                    <td></td>
                    <td></td>
                    <td><a href="Company_list.jsp" class="btn btn-success">Accept</a>|
                        <a href="Company_list.jsp" class="btn btn-danger">Reject</a></td>
                </tr>
                
                <%
                   String sel="",upquery="",cmp_name="";
                   int i=0;
                   
             if(request.getParameter("aid")!=null)
            {
            String Accepted=request.getParameter("aid");
            upquery="update tbl_company set company_status='1' where company_id='"+Accepted+"'";
            obj.executeCommand(upquery);
            System.out.println(upquery);
            
            String sele="select * from tbl_company where company_id='"+Accepted+"'";   
            ResultSet rl=obj.selectCommand(sele);
            if(rl.next())
            {
                cmp_name=rl.getString("company_name");
            }
            
            %>
            
        <div>
            <div class="alert" id="alert"  onclick="this.parentElement.style.display = 'none';">
                <i class='fas fa-exclamation-triangle' style='font-size:36px'></i>
                <strong class="far fa-smile-beam" ><% out.println(cmp_name); %></strong> Accepted successfully.
            </div>
        </div>
            <br/><br/><br/><br/>
            
            <%
            
            }
            else if(request.getParameter("eid")!=null)
            {
            String Rejected=request.getParameter("eid");
            upquery="update tbl_company set company_status='2' where company_id='"+Rejected+"'";
            obj.executeCommand(upquery);
            System.out.println(upquery);
            
            String selec="select * from tbl_company where company_id='"+Rejected+"'";   
            ResultSet rll=obj.selectCommand(selec);
            if(rll.next())
            {
              cmp_name=rll.getString("company_name");
            }
            
            
            %>
            
        <div>
            <div class="alertid" id="alertid"  onclick="this.parentElement.style.display = 'none';">
                <strong ><% out.println(cmp_name); %></strong> Rejected successfully.
            </div>
        </div>
            <br/><br/><br/><br/>
            
            <%
            
            }
                   
                   sel="select * from tbl_company c inner join tbl_place p on p.place_id=c.place_id where company_status='0'";
                   ResultSet rs=obj.selectCommand(sel);
                   while(rs.next())
                   { 
                      i++;
                %>
                <tr>
                    <td><input type="checkbox" name="chkName" onClick="selectall()"></td>
                    <td><%= i %></td>
                    <td><%= rs.getString("company_name") %></td>
                    <td><%= rs.getString("place_name") %></td>
                    <td ><a href="Company_list.jsp?aid=<%= rs.getString("company_id") %>" class="btn btn-success">Accept</a>|
                        <a href="Company_list.jsp?eid=<%= rs.getString("company_id") %>" class="btn btn-danger">Reject</a></td>
                </tr>
                <%}%>
            </table>
        </form>
        </div>
    </body>
</html>
