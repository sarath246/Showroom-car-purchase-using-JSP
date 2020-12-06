<%-- 
    Document   : Car_details
    Created on : 22 Jan, 2020, 3:56:08 PM
    Author     : Sarath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car details</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <body>
        <a href="Change_psw.jsp"></a>
    <%
        String ins="",carname="",cartype="",image="",milage="",engin="",tork="",power="",boot="",fueltank="",bodytype="",stering="",powerwindow="",abs="",driver="",passenger="",auto="",flylight="",weal="",enginetrans="",price="",interior="",exterior="",safty="",company="";
        
    if(request.getParameter("btn_submit")!=null)
    {
        carname=request.getParameter("txt_carname");
        cartype=request.getParameter("sel_cartype");
        milage=request.getParameter("txt_milage");
        engin=request.getParameter("txt_engine");
        tork=request.getParameter("txt_maxtork");
        power=request.getParameter("txt_maxpower");
        boot=request.getParameter("txt_boots");
        stering=request.getParameter("txt_stering");
        fueltank=request.getParameter("txt_fuel");
        bodytype=request.getParameter("txt_body");
        powerwindow=request.getParameter("txt_window");
        abs=request.getParameter("txt_abs");
        driver=request.getParameter("txt_airbag");
        passenger=request.getParameter("txt_pasgairbag");
        auto=request.getParameter("txt_autoclimate");
        flylight=request.getParameter("txt_flylight");
        weal=request.getParameter("txt_alloyweal");
        enginetrans=request.getParameter("txt_enginandtrans");
        price=request.getParameter("txt_price");
        interior=request.getParameter("txt_interior");
        exterior=request.getParameter("txt_exterior");
        safty=request.getParameter("txt_safty");
        image=request.getParameter("car_image");
        
        ins="insert into tbl_cardetails(car_name,cartype_id,car_milage,engine_displacement,max_tork,max_power,boot_space,fueltank_cappacity,body_type,power_stering,powerwindow_front,abs,driver_airbag,passenger_airbag,automatic_climatecontrol,flylight_front,alloy_weal,engin_transmission,car_price,car_interior,car_exterior,car_safty,car_photo,showroom_id)values('"+carname+"','"+cartype+"','"+milage+"','"+engin+"','"+tork+"','"+power+"','"+boot+"','"+fueltank+"','"+bodytype+"','"+stering+"','"+powerwindow+"','"+abs+"','"+driver+"','"+passenger+"','"+auto+"','"+flylight+"','"+weal+"','"+enginetrans+"','"+price+"','"+interior+"','"+exterior+"','"+safty+"','"+image+"','"+session.getAttribute("regid")+"')";
        obj.executeCommand(ins);
        System.out.println(ins);
    } 
      %>
      <div id="tab"align="center">
          <form action="CarDetails_upload.jsp" enctype="multipart/form-data" method="post">
            <table border="1">
                <th colspan="2" style="text-align: center;">Car details</th>
                <tr>
<!--                    <td>Car name</td>-->
<td><input type="text" name="txt_carname" placeholder="Car name..."></td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Car type</td>-->
                            <td><select name="sel_cartype">
                            <option value="">-----------Type-----------</option>
            <%
                String sel="select * from tbl_cartype";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
             {
                %>
                <option value="<%= rs.getString("cartype_id") %>"><%= rs.getString("cartype_name") %></option>
               <%}%>
                        </select></td>
                </tr>
                <tr>
                    <td><input type="text" name="txt_milage" placeholder="Car milage..."></td>
                </tr>
                <tr>
                    <td><input type="text" name="txt_engine" placeholder="Engin displacement..."></td>
                </tr>
                <tr>
                    <td><input type="text" name="txt_maxtork" placeholder="Maximum torque..."></td>
                </tr>
                <tr>
                    <td><input type="text" name="txt_maxpower" placeholder="Maximum power..."></td>
                </tr>
                <tr>
                    <td><input type="text" name="txt_boots" placeholder="Boot space..."></td>
                </tr>
                <tr>
                    <td><input type="text" name="txt_fuel" placeholder="Fuel tank capacity..."></td>
                </tr>
                <tr>
                    <td><input type="text" name="txt_body" placeholder="Body type..."></td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Fuel type</td>-->
                    <td>
                        <select name="txt_fuel">
                            <option value="">--------Fuel type--------</option>
                <%
                    String select="select * from tbl_fueltype";
                    ResultSet rss=obj.selectCommand(select);
                    while(rss.next())
                    {
                     %>
                     <option value="<%= rss.getString("fueltype_id") %>"><%= rss.getString("fueltype_name") %></option>
                     <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
<!--                    <td>Power stering</td>-->
                    <td>
                        <select name="txt_stering">
                            <option value="">--------Power steering--------</option>
                        <option value="">Yes</option>
                        <option value="">No</option></select>
                        </td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Power window front</td>-->
                    <td>
                        <select name="txt_window">
                            <option value="">-----Power window front-----</option>
                        <option value="">Yes</option>
                        <option value="">No</option></select>
                        </td>
                </tr>
                <tr>
<!--                    <td>Abs</td>-->
                    <td>
                        <select name="txt_abs">
                            <option value="">--------ABS--------</option>
                        <option value="">Yes</option>
                        <option value="">No</option></select>
                        </td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Transmission type</td>-->
                    <td>
                        <select name="txt_trnsntype">
                            <option value="">-----Transmission type-----</option>
                 <%
                    String selecttr="select * from tbl_transmission";
                    ResultSet tr=obj.selectCommand(selecttr);
                    while(tr.next())
                    {
                     %>
                     <option value="<%= tr.getString("transmission_id") %>"><%= tr.getString("transmission_name") %></option>
                     <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
<!--                    <td>Driver airbag</td>-->
                    <td>
                        <select name="txt_airbag">
                            <option value="">-----Driver airbag-----</option>
                        <option value="">Yes</option>
                        <option value="">No</option></select>
                        </td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Passenger airbag</td>-->
                    <td>
                        <select name="txt_pasgairbag">
                            <option value="">-----Passenger airbag-----</option>
                        <option value="">Yes</option>
                        <option value="">No</option></select>
                        </td>
                </tr>
                <tr>
<!--                    <td>Automatic climate control</td>-->
                    <td>
                    <select name="txt_autoclimate">
                            <option value="">----Automatic climate control----</option>
                        <option value="">Yes</option>
                        <option value="">No</option></select>
                    </td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Flylight front</td>-->
                    <td>
                    <select name="txt_flylight">
                            <option value="">----Flylight front----</option>
                        <option value="">Yes</option>
                        <option value="">No</option></select>
                    </td>
                </tr>
                <tr>
<!--                    <td>Alloy weal</td>-->
                    <td>
                    <select name="txt_alloyweal">
                            <option value="">-----Alloy weal-----</option>
                        <option value="">Yes</option>
                        <option value="">No</option></select>
                    </td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Engine and transmission</td>-->
<td><input type="text" name="txt_enginandtrans" placeholder="Engine and transmission..."></td>
                </tr>
                <tr>
<!--                    <td>Price</td>-->
<td><input type="text" name="txt_price" placeholder="Price..."></td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Color</td>-->
                    <td>
                        <select name="txt_color">
                            <option value="">--------Color--------</option>
                <%
                    String selectcol="select * from tbl_color";
                    ResultSet col=obj.selectCommand(selectcol);
                    while(col.next())
                    {
                     %>
                     <option value="<%= col.getString("color_id") %>"><%= col.getString("color_name") %></option>
                   <%}%>
                        </select>
                      
                     
                    </td>
                </tr>
                 <tr>
<!--                    <td>Image</td>-->
                    <td>
                        <input type="file" name="car_image" placeholder="Upload an image...">
                    </td>
                </tr>
                <tr>
                    <td>
                    <select name="txt_interior">
                            <option value="">--------Interior--------</option>
                        <option value="">Tachometer</option>
                        <option value="">Electronic Multi-Tripmeter</option>
                    <option value="">Leather Seats</option>
                    <option value="">Fabric Upholstery</option>
                    <option value="">Leather Steering Wheel</option>
                    <option value="">Glove Compartment</option>
                    <option value="">Digital Clock</option>
                    <option value="">Outside Temperature Display</option>
                    <option value="">Cigarette Lighter</option>
                    <option value="">Digital Odometer</option>
                    <option value="">Electric Adjustable Seats</option>
                    <option value="">Driving Experience Control Eco</option>
                    <option value="">Folding Table in The Rear</option>
                    <option value="">Height Adjustable Driver Seat</option>
                    <option value="">Ventilated Seats</option>
                    <option value="">Dual Tone Dashboard</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>
                    <select name="txt_exterior">
                            <option value="">--------Exterior--------</option>
                        <option value="">Adjustable Headlights</option>
                        <option value="">Fog Lights - Front</option>
                    <option value="">Fog Lights - Rear</option>
                    <option value="">Power Adjustable Exterior Rear View Mirror</option>
                    <option value="">Manually Adjustable Ext. Rear View Mirror</option>
                    <option value="">Electric Folding Rear View Mirror</option>
                    <option value="">Rain Sensing Wiper</option>
                    <option value="">Rear Window Wiper</option>
                    <option value="">Rear Window Washer</option>
                    <option value="">Rear Window Defogger</option>
                    <option value="">Wheel Covers</option>
                    <option value="">Power Antenna</option>
                    <option value="">Tinted Glass</option>
                    <option value="">Rear Spoiler</option>
                    <option value="">Sun Roof</option>
                    <option value="">Moon Roof</option>
                    </select>
                    </td>
                </tr>
                <tr>
<!--                    <td style="color:white;">Safty</td>-->
                    <td>
                     <select name="txt_safty">
                            <option value="">--------Safety--------</option>
                        <option value="">Anti-Lock Braking System</option>
                        <option value="">Brake Assist</option>
                    <option value="">Central Locking</option>
                    <option value="">Power Door Locks</option>
                    <option value="">Child Safety Locks</option>
                    <option value="">Driver Airbag</option>
                    <option value="">Side Airbag-Front</option>
                     </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" class="btn btn-success"></td>
                </tr>
            </table>
        </form>
      </div>
                        <br/><br/><br/><br/>
    </body>
</html>
