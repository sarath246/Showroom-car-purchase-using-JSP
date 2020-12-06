<%-- 
    Document   : Order_details
    Created on : 17 Jun, 2020, 7:11:39 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="conn"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order details</title>
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
        <div id="tab"align="center">
        <form action="" method="post">
         <%
            String sel="";
            int i=0;
            
            sel="select * from tbl_cardetails c inner join tbl_cartype t inner join tbl_company m on m.company_id=c.company_id and t.cartype_id=c.cartype_id";
            ResultSet rs=obj.selectCommand(sel);
            
            while(rs.next())
            {
              
            %>
            <div class="card" >
        <%= rs.getString("car_name") %>
        <%= rs.getString("cartype_name") %>
        <%= rs.getString("car_milage") %>
        <%= rs.getString("engine_displacement") %>
        <%= rs.getString("max_tork") %>
        <%= rs.getString("max_power") %>
        <%= rs.getString("boot_space") %>
        <%= rs.getString("fueltank_cappacity") %>
        <%= rs.getString("body_type") %>
        <%= rs.getString("power_stering") %>
        <%= rs.getString("powerwindow_front") %>
        <%= rs.getString("abs") %>
        <%= rs.getString("driver_airbag") %>
        <%= rs.getString("passenger_airbag") %>
        <%= rs.getString("automatic_climatecontrol") %>
        <%= rs.getString("flylight_front") %>
        <%= rs.getString("alloy_weal") %>
        <%= rs.getString("engin_transmission") %>
        <%= rs.getString("car_interior") %>
        <%= rs.getString("car_exterior") %>
        <%= rs.getString("car_safty") %>
        <%= rs.getString("car_price") %>
        <%= rs.getString("car-photo") %>
            </div>
        <%
            }
          %>
        
        </form>
        </div>
    </body>
</html>
