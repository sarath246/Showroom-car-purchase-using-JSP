<%-- 
    Document   : State
    Created on : 17 Jan, 2020, 12:08:17 PM
    Author     : Sarath
--%>

<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="javafx.scene.control.TitledPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>State details</title>
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
        </style>
        
        <style>
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

            setTimeout(function() {
                $('#alert').fadeOut('fast');
            }, 3000);
        </script>
        
        <script>

            setTimeout(function() {
                $('#alertid').fadeOut('fast');
            }, 3000);
        </script>
        
        <style>
body {
  background-color: black;
  font-family: cursive;
}

.glow {
  font-size: 20px;
  color: #fff;
  text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }
  
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
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
$(document).ready(function(){
  $("#myBtn").click(function(){
    $('.toast').toast('show');
  });
});
</script>
        
<script>
function myFunction() {
  confirm("Press a button!");
}
</script>

    </head>
    
    
    <body>
        <%
            String sname = "", editid = "", state_name = "", edit = "", update = "", s = "", se = "", states = "",delete="",k="";
            sname = request.getParameter("txtstate");
            
           String id[] = request.getParameterValues("ckbox");
           String clickDelete = request.getParameter("submit");

           
          if(request.getParameter("ddid")!= null){
                
                String dele = "update tbl_state set status='1' ";
                obj.executeCommand(dele);
                
                
            }else if(request.getParameter("rdid")!= null){
                
                String recov = "update tbl_state set status='0' ";
                obj.executeCommand(recov);
                
            }
           
           
            s = "select * from tbl_state where state_name='" + sname + "'";
            ResultSet rr = obj.selectCommand(s);
            if (rr.next()) {
                states = rr.getString("state_name");
                System.out.println(states);
            }

            if (request.getParameter("btnsave") != null) {
                if (request.getParameter("eid") != null) {
                    edit = request.getParameter("eid");
                    update = "update tbl_state set state_name='" + sname + "' where state_id='" + edit + "'";
                    obj.executeCommand(update);
                    //out.println(update);
                } else if (sname.matches(states)) {
                   // out.println("<script>alert('already exists')</script>");
                    
                    %>
        
        <div>
            <div class="alertid" id="alertid"  onclick="this.parentElement.style.display = 'none';">
                <strong >Already exists!</strong> Data inserted failed!.
            </div>
        </div>
                    
<!--<div class="toast-body">
      Some text inside the toast body
    </div>-->
                    <%

                } else {
                    String ins = "insert into tbl_state(state_name) values('" + sname + "')";
                    obj.executeCommand(ins);
                    //out.println("sucess");

        %>

        <div >
            <div class="alert" id="alert"  onclick="this.parentElement.style.display = 'none';">
                <strong >Success!</strong> Data inserted successfully.
            </div>
        </div>
        <%                        }

            }
        %>
        <%
         
            if (request.getParameter("did") != null) {
                String delid = request.getParameter("did");
                String del = "delete from tbl_state where state_id='" + delid + "'";
                //PreparedStatement psDelete= null;
                obj.executeCommand(del);
                //out.println(del);
                    
            }else if (request.getParameter("eid") != null) {
                editid = request.getParameter("eid");
                String select = "select * from tbl_state where state_id='" + editid + "'";
                ResultSet rs = obj.selectCommand(select);
                if (rs.next()) {
                    state_name = rs.getString("state_name");

                }
                
                
            }


        %>
        <div id="tab" align="center">

            <form method="post" name="frm">
                
        
                
                <table border="1">
                    
                    <th colspan="2" style="text-align: center;">
                    <h1 class="glow"> Enter States</h1>
                    </th>
                    <tr>
                        <!--                <td align="center">
                                            State
                                        </td>-->
                        <td>
                            <input type="text" spellcheck="" name="txtstate" title="Enter a state" placeholder="Enter here..." value="<% out.println(state_name); %>" required="required">
                        </td>
                    </tr>

                    <tr>
                        <td align="center" colspan="2">

                            <input type="submit" name="btnsave" onclick="btnsave" id="myBtn">

                        </td>
                    </tr>
                </table><br><br><br><br>

                <table border="1">

                    <tr>
                        <th>Select</th>
                        <th style="text-align:center;">Sl.No</th>
                        <th style="text-align:center;">State</th>
                        <th>Edit</th>
                        <th>Delete </th>
                    </tr>
                    <tr>
                        
                        <td colspan="2"><input type="checkbox" name="allCheck" onClick="selectallMe()"  /></td>
                        <td ></td>
                                <td></td>
                                <td colspan="3"><a href="State.jsp?ddid" class="btn btn-success"  onclick="myFunction()">Delete all</a>
                                <a href="State.jsp?rdid" class="btn btn-success" onclick="myFunction()">Recover all</a>
                                </td>
                    </tr>
                    <%

                        int i = 0;
                        String sel = "select * from tbl_state where status='0' order by state_name";
                        ResultSet rs = obj.selectCommand(sel);
                        while (rs.next()) {
                            i++;
                            
                             
                    %>
                    <tr>
                        <td><input type="checkbox" name="chkName" onClick="selectall()" value="<%= rs.getString("state_id") %>" /></td>
                        <td align="center"><% out.println(i);%></td>
                        <td><%= rs.getString("state_name")%></td>
                        <td><a href="State.jsp?eid=<%= rs.getString("state_id")%>"><img src="../Admin/images/editicon5.png" width="25px" height="25px"/></a></td>
                        <td><a href="State.jsp?did=<%= rs.getString("state_id")%>">
                                <img src="../Admin/images/deleteicon.png" width="25px" height="25px" id="img"/></a></td>
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
