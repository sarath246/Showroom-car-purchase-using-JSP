<%-- 
    Document   : Company_products
    Created on : 17 Jun, 2020, 11:22:11 AM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company products</title>
        
       
        <%@include file="HomePage.jsp" %>
        
    </head>
    
    <style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 40%;
  height: 80px;
  background-color: white;
  border-radius: 10px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  background-color: blue;
}

.container {
  padding: 2px 16px;
}
</style>

    <body>
        
        <form method="post">
            
                
     
  
<!--                <th>Sl.No</th>
                <th>Car photo</th>
                <th>Car name</th>
                <th>Type</th>
                <th>Company</th>
                <th>Price</th>
                <th>Status</th>
                <th>Details</th>-->
        <%
            String sel="",sele="",ins="",carid="",cart="";
            int i=0;
            
            sele="select * from tbl_cardetails ";
            ResultSet rss=obj.selectCommand(sele);
            
            if(rss.next())
            {
             carid=rss.getString("car_name");   
            
            
            if(request.getParameter("cid")!=null)
            {
    
                cart="Added";
            
            ins="insert into tbl_cart(car_id,cart_name,showroom_id)values('"+carid+"','"+cart+"','"+session.getAttribute("regid")+"')";
           obj.executeCommand(ins);
            out.println("success");
            }
            }
            sel="select * from tbl_cardetails c inner join tbl_cartype t inner join tbl_company m on m.company_id=c.company_id and t.cartype_id=c.cartype_id";
            ResultSet rs=obj.selectCommand(sel);
            
            while(rs.next())
            {
              
            %>
            <div id="tab"align="center">
                <div class="card" >
                    
                    <br/>
                    <%= rs.getString("car_photo") %>
  <img src="../Company/CarDetails_photos">
  &nbsp;&nbsp;&nbsp;&nbsp;
           
                   
  <%= rs.getString("car_name") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="../Showrooms/Icons/car-types2.png" width="25" height="25"/>
                    <%= rs.getString("cartype_name") %>&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <img src="../Showrooms/Icons/price-tag.png" width="25" height="25"/>
                    <%= rs.getString("car_price") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br/><br/>
                    <a href="Company_products.jsp?cid=<%= rs.getString("company_id") %>" class="btn btn-success" title="Add to cart"><img src="../Showrooms/Icons/cart.png" width="25" height="25"/></a>
                    <a href="Order_details.jsp"  >
                        <img src="../Showrooms/Icons/order-now.png" width="150" height="150"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
                   
                </div><br/><br/><br/><br/>
                <%
            }
                %>
  
            
        </form>
                
        </div>
    </body>
</html>
