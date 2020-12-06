/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package WebservicePkg;

import Database_Package.ConnectionClass;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.mail.Session;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Sarath
 */
@WebService(serviceName = "CarPurchaseWebservice")
public class CarPurchaseWebservice {
    
    ConnectionClass con=new ConnectionClass();
    private String b;

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
     /**
     * Web service operation
     */
    @WebMethod(operationName = "GetPlace")
    public String GetPlace() {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_district";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("placeid",rs.getString("district_id"));
                    obj.put("place_name",rs.getString("district_name"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "InsertUser")
    public String InsertUser(@WebParam(name = "name") String name, @WebParam(name = "address") String address, @WebParam(name = "gender") String gender, @WebParam(name = "contact") String contact, @WebParam(name = "username") String username, @WebParam(name = "password") String password, @WebParam(name = "email") String email, @WebParam(name = "placeid") String placeid) {
        //TODO write your implementation code here:
        java.util.Date d=new java.util.Date();
        String s="";
        String ins="insert into tbl_userreg(user_name,user_address,user_gender,user_contact,user_uname,user_psw,user_email,reg_date,place_id)values('"+name+"','"+address+"','"+gender+"','"+contact+"','"+username+"','"+password+"','"+email+"','"+d+"','"+placeid+"')";
        boolean b=con.executeCommand(ins);
        System.out.println(b);
        if(b==true)
        {
           s="success" ;
        }else
        {
            s="failed";
        }
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "LoginUser")
    public String LoginUser(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        //TODO write your implementation code here:
        String sel="select * from tbl_userreg where user_uname='"+username+"' and user_psw='"+password+"' and user_status='1'";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            if(rs.next())
            {
                JSONObject obj=new JSONObject();
                try {
                    obj.put("userid",rs.getString("user_id"));
                    obj.put("username",rs.getString("user_uname"));
                    //obj.put("user_status",rs.getString("user_status"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println(j.toString());
     return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "UserPro")
    public String UserPro(@WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
        String select="select * from tbl_userreg";
        ResultSet rs=con.selectCommand(select);
        System.out.println(rs);
        JSONArray js=new JSONArray();
        try {
            if(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("userid",rs.getString("user_id"));
                    obj.put("Name",rs.getString("user_name"));
                    obj.put("Gender",rs.getString("user_gender"));
                    obj.put("Address",rs.getString("user_address"));
                    obj.put("Email",rs.getString("user_email"));
                    obj.put("Phone",rs.getString("user_contact"));
                    js.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }            }

        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(js.toString());
        return js.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "EditPro")
    public String EditPro(@WebParam(name = "userid") String userid,@WebParam(name = "Name") String Name, @WebParam(name = "Address") String Address, @WebParam(name = "Email") String Email, @WebParam(name = "Phone") String Phone) {
        //TODO write your implementation code here:
        String s="";
        String update="update tbl_userreg set user_name='"+Name+"',user_address='"+Address+"',user_email='"+Email+"',user_contact='"+Phone+"' where user_id='"+userid+"'";
        boolean b=con.executeCommand(update);
        System.out.println(update);
        if(b==true){
            s="Profile updated";
        }else{
            s="Update failed";
        }
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ChPsw")
    public String ChPsw(@WebParam(name = "userid") String userid, @WebParam(name = "Cpsw") String Cpsw, @WebParam(name = "NewPsw") String NewPsw, @WebParam(name = "ConfPsw") String ConfPsw) {
        //TODO write your implementation code here:
         String s="";
        String sel="select * from tbl_userreg where user_id='"+userid+"' and user_psw='"+Cpsw+"'";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        try {
            if(rs.next())
            {
                if(NewPsw.equals(ConfPsw))
                {
                   
        String update="update tbl_userreg set user_psw='"+NewPsw+"' where user_id='"+userid+"'";
        boolean b=con.executeCommand(update);
        System.out.println(update);
        if(b==true){
            s="Profile updated";
        }else{
            s="Update failed";
        }
                }else{
                    s="Passwords mismatch";
                }
            }else{
                s="Password mismatch";
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Car")
    public String Car(@WebParam(name = "carid") String carid) {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_cardetails";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("carid",rs.getString("car_id"));
                    obj.put("carname",rs.getString("car_name"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }
    /**
     * Web service operation
     */
//    @WebMethod(operationName = "CarShow")
//    public String CarShow(@WebParam(name = "carSelected") String carSelected) {
//        //TODO write your implementation code here:
//        String sel="";
//        sel="select * from tbl_showroom where car_id='"+carSelected+"'";
//        ResultSet rs=con.selectCommand(sel);
//        System.out.println(sel);
//        JSONArray j=new JSONArray();
//        try {
//            JSONObject obj=new JSONObject();
//            while(rs.next()){
//                try {
//                    obj.put("carid",rs.getString("car_id"));
//                    obj.put("showroomid",rs.getString("showroom_id"));
//                    obj.put("showroomname",rs.getString("showroom_name"));
//                    j.put(obj);
//                } catch (JSONException ex) {
//                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
//                }
//                
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        System.out.println(j.toString());
//        return j.toString();
//    }
    

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Search")
    public String Search() {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_company";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray js=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("companyid",rs.getString("company_id"));
                    obj.put("companyname",rs.getString("company_name"));
                    js.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(js.toString());
        return js.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "SearchShow")
    public String SearchShow(@WebParam(name = "companySelected") String companySelected) {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_showroom where company_id='"+companySelected+"'";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("companyid",rs.getString("company_id"));
                    obj.put("showroomid",rs.getString("showroom_id"));
                    obj.put("showroomname",rs.getString("showroom_name"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetCar")
    public String GetCar(@WebParam(name = "showid") String showid) {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_cardetails c inner join tbl_cartype t on t.cartype_id=c.cartype_id where showroom_id='"+showid+"'";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("car_id",rs.getString("car_id"));
                    obj.put("car_name",rs.getString("car_name"));
                    obj.put("car_type_id",rs.getString("cartype_id"));
                    obj.put("car_type",rs.getString("cartype_name"));
                    obj.put("car_rate",rs.getString("car_price"));
                    obj.put("showroom_id",rs.getString("showroom_id"));
                    
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Cardetails")
    public String Cardetails(@WebParam(name = "carid") String carid) {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_cardetails where car_id='"+carid+"'";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        System.out.println(carid);
        JSONArray j=new JSONArray();
        try {
            if(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    //obj.put("carid",rs.getString("car_id"));
                    obj.put("carname",rs.getString("car_name"));
                    obj.put("showroomid",rs.getString("showroom_id"));
                    
                    obj.put("carmilage",rs.getString("car_milage"));
                    
                    obj.put("engine_displacement",rs.getString("engine_displacement"));
                    obj.put("max_tork",rs.getString("max_tork"));
                    obj.put("max_power",rs.getString("max_power"));
                    obj.put("boot_space",rs.getString("boot_space"));
                    obj.put("fueltank_cappacity",rs.getString("fueltank_cappacity"));
                    
                    obj.put("body_type",rs.getString("body_type"));
                    obj.put("power_stering",rs.getString("power_stering"));
                    obj.put("powerwindow_front",rs.getString("powerwindow_front"));
                    obj.put("abs",rs.getString("abs"));
                    
                    obj.put("driver_airbag",rs.getString("driver_airbag"));
                    obj.put("passenger_airbag",rs.getString("passenger_airbag"));
                    obj.put("automatic_climatecontrol",rs.getString("automatic_climatecontrol"));
                    obj.put("flylight_front",rs.getString("flylight_front"));
                    
                    obj.put("alloy_weal",rs.getString("alloy_weal"));
                    obj.put("engin_transmission",rs.getString("engin_transmission"));
                    obj.put("car_interior",rs.getString("car_interior"));
                    obj.put("car_exterior",rs.getString("car_exterior"));
                    obj.put("car_safty",rs.getString("car_safty"));
                    obj.put("car_price",rs.getString("car_price"));
                    obj.put("car_photo",rs.getString("car_photo"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
              
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "CarBooking")
    public String CarBooking( @WebParam(name = "carprice") String carprice,@WebParam(name = "carid") String carid,@WebParam(name = "showroomid") String showroomid,@WebParam(name = "color") String color,@WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
        String s="";
        String ins="insert into tbl_carbooking(car_price,car_id,showroom_id,car_color,user_id)values('"+carprice+"','"+carid+"','"+showroomid+"','"+color+"','"+userid+"')";
        boolean b=con.executeCommand(ins);
        System.out.println(b);
//        System.out.println(userid);
        System.out.println(carid);
        System.out.println(carprice);
        System.out.println(showroomid);
        System.out.println(color);
        System.out.println(userid);
        if(b==true)
        {
           s="success" ;
        }else
        {
            s="failed";
        }
        System.out.println(s);
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetSpareParts")
    public String GetSpareParts(@WebParam(name = "carid") String carid) {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_sparepartsdetails s inner join tbl_spareparts p inner join tbl_company c on c.company_id=s.company_id and p.sparepartstype_id=s.sparepartstype_id where car_id='"+carid+"'";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("car_id",rs.getString("car_id"));
                    obj.put("spareparts_name",rs.getString("spareparts_name"));
                    obj.put("sparepartstype_id",rs.getString("sparepartstype_id"));
                    obj.put("sparepartstype_name",rs.getString("sparepartstype_name"));
                    obj.put("company_id",rs.getString("company_id"));
                    obj.put("company_name",rs.getString("company_name"));
                    obj.put("spareparts_cost",rs.getString("spareparts_cost"));
                    obj.put("car_description",rs.getString("car_description"));
                    obj.put("showroom_id",rs.getString("showroom_id"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Home")
    public String Home() {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_cardetails c inner join tbl_showroom s on s.showroom_id=c.showroom_id inner join tbl_cartype t on t.cartype_id=c.cartype_id";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("car_name",rs.getString("car_name"));
                    obj.put("showroom_id",rs.getString("showroom_name"));
                    obj.put("cartype_id",rs.getString("cartype_name"));
                    obj.put("car_price",rs.getString("car_price"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "CarOrders")
    public String CarOrders(@WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_carbooking c inner join tbl_cardetails d on d.car_id=c.car_id inner join tbl_showroom s on s.showroom_id=c.showroom_id where user_id='"+userid+"'";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("car_id",rs.getString("car_name"));
                    obj.put("car_color",rs.getString("car_color"));
                    obj.put("car_price",rs.getString("car_price"));
                    obj.put("showroom_id",rs.getString("showroom_name"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "SpareOrders")
    public String SpareOrders(@WebParam(name = "carid") String carid, @WebParam(name = "userid") String userid, @WebParam(name = "spareparts_name") String spareparts_name, @WebParam(name = "spareparts_type") String spareparts_type, @WebParam(name = "company_name") String company_name, @WebParam(name = "rate") String rate, @WebParam(name = "showroomid") String showroomid) {
        //TODO write your implementation code here:
         String s="";
        java.util.Date d=new java.util.Date();        
        String ins="insert into tbl_sparepartsbuy(car_id,user_id,spareparts_name,spareparts_type,company_name,spareparts_cost,showroom_id,sparepartsorder_date)values('"+carid+"','"+userid+"','"+spareparts_name+"','"+spareparts_type+"','"+company_name+"','"+rate+"','"+showroomid+"','"+d+"')";
        boolean b=con.executeCommand(ins);
        System.out.println(b);
        System.out.println(userid);
//        System.out.println(carid);
//        System.out.println(carprice);
//        System.out.println(showroomid);
//        System.out.println(color);
        System.out.println(ins);
        if(b==true)
        {
           s="success" ;
        }else
        {
            s="failed";
        }
        System.out.println(s);
        
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "InsertLogin")
    public String InsertLogin(@WebParam(name = "uid") String uid) {
        //TODO write your implementation code here:
        String ins="",s="";
        java.util.Date d=new java.util.Date();
        ins="insert into tbl_userlogin(user_id,user_date)values('"+uid+"','"+d+"')";
         boolean b=con.executeCommand(ins);
        System.out.println(b);
         if(b==true)
        {
           s="Login inserted success" ;
        }else
        {
            s="Login inserted failed";
        }
        System.out.println(s);
        
        return s;
    }
     /**
     * Web service operation
     */
    @WebMethod(operationName = "GetShowroom")
    public String GetShowroom() {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_showroom where";
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ServiceBooking")
    public String ServiceBooking(@WebParam(name = "name") String name, @WebParam(name = "email") String email, @WebParam(name = "address") String address, @WebParam(name = "phone") String phone, @WebParam(name = "car_name") String car_name, @WebParam(name = "Last_service_date") String Last_service_date, @WebParam(name = "Max_days") String Max_days, @WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
        String ins="",s="";
        java.util.Date d=new java.util.Date();
        ins="insert into tbl_servicebooking(user_name,user_email,user_address,phone,last_service_date,max_days,user_id,booking_date)values('"+name+"','"+email+"','"+address+"','"+phone+"','"+Last_service_date+"','"+Max_days+"','"+userid+"','"+d+"')";
        boolean b=con.executeCommand(ins);
        System.out.println(ins);
        if (b==true) 
        {
           s="Success";    
        }else
        {
            s="Failed";
        }
        System.out.println(s);
        System.out.println(userid);
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "UserDetails")
    public String UserDetails(@WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_userreg where user_id='"+userid+"'";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("user_name",rs.getString("user_name"));
                    obj.put("user_address",rs.getString("user_address"));
                    obj.put("user_contact",rs.getString("user_contact"));
                    obj.put("user_email",rs.getString("user_email"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "SearchPlace")
    public String SearchPlace() {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_place";
        ResultSet rs=con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                
                JSONObject obj=new JSONObject();
                try {
                    
                    obj.put("place_id",rs.getString("place_id"));
                    obj.put("place_name",rs.getString("place_name"));
                    j.put(obj);
                    
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Image")
    public String Image() {
        //TODO write your implementation code here:
        String sel="";
        sel="select * from tbl_advertisement";
        ResultSet rs=con.selectCommand(sel);
        JSONArray j=new JSONArray();
        try {
            while(rs.next()){
                JSONObject obj=new JSONObject();
                try {
                    obj.put("advert_image",rs.getString("advert_image"));
                    j.put(obj);
                } catch (JSONException ex) {
                    Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarPurchaseWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    
        
    }

    /**
     * Web service operation
     */


    /**
     * Web service operation
     */
    
    