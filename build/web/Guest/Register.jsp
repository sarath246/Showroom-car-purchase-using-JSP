
<%@page import="javafx.scene.control.Alert"%>
<%@page import="javax.swing.JOptionPane"%>
<%--<%@page import="org.apache.catalina.util.MD5Encoder"%>--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database_Package.ConnectionClass" id="obj"></jsp:useBean>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Register | Nalika - Material Admin Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="css/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
    <!-- forms CSS
		============================================ -->
    <link rel="stylesheet" href="css/form/all-type-forms.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <%
        String ins="",name="",place="",uname="",psw="";
        name=request.getParameter("txt_name");
        place=request.getParameter("txt_place");
        uname=request.getParameter("txt_uname");
        psw=request.getParameter("txt_psw");
        char s='a';
        char se='z';
        String a=String.valueOf(s);
        String z=String.valueOf(se);
        
    if(request.getParameter("btn_submit")!=null)
    {
        ins="insert into tbl_company(company_name,place_id,company_uname,company_psw)values('"+name+"','"+place+"','"+uname+"','"+psw+"')";
        obj.executeCommand(ins);
        out.println(ins);
        out.println("<script>alert('Registration successfull')</script>");
        response.sendRedirect("../Guest/Login.jsp");
    }
        %>
    <div class="color-line"></div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="back-link back-backend">
                    <a href="Login.jsp" class="btn btn-primary">Back to Login</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
            <div class="col-md-6 col-md-6 col-sm-6 col-xs-12">
                <div class="text-center custom-login">
                    <h3 style="color: white;">Registration</h3>
                </div><br/><br/><br/>
                <div class="hpanel">
                    <div class="panel-body">
                        <form action="#" id="loginForm">
                            <div class="row">
                                <div class="form-group col-lg-12">
                                    <label>Name</label>
                                    <input type="text" name="txt_name" placeholder="Company name..." style="text-transform: capitalize;" class="form-control" required="">
                                </div>
                               
                                <div class="form-group col-lg-6">
                                    <label>Place</label>
                                    <select name="txt_place" class="form-control" required="">
                                        <option value="">-----------Select-----------</option>
            <%
                String sel="select * from tbl_place";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
               {
                %>
                <option value="<%= rs.getString("place_id") %>"><%= rs.getString("place_name") %></option>
                <%}%>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Email Address</label>
                                    <input class="form-control" 
                                           pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Contains Upper or Lower case letters,White space is not allowed,contains characters or digits!" placeholder="example@gmail.com">
                                </div>
                                
                                    <div class="form-group col-lg-6">
                                    <label>Username</label>
                                    <input type="text" name="txt_uname" style="text-transform: capitalize;" placeholder="Enter username..." class="form-control" required="">
                                </div>
                                     <div class="form-group col-lg-6">
                                    <label>Password</label>
                                    <input type="password" name="txt_psw" class="form-control" placeholder="Enter password..." required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                                </div>
                                    
<!--                                <div class="checkbox col-lg-12">
                                    <input type="checkbox" class="i-checks" checked> Sigh up for our newsletter
                                </div>-->
                            </div><br/><br/><br/>
                            <div class="text-center">
                                <input type="submit" class="btn btn-success loginbtn" name="btn_submit" value="Register" onclick="<script>alert('Registration successfully completed')</script>">
                                <button class="btn btn-default"><a href="index.html">Cancel</a></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <p style="color: white;">Copyright © 2018 <a href="../Guest/index.html">Spices</a> All rights reserved.</p>
            </div>
        </div>
    </div>

    <!-- jquery
		============================================ -->
    <script src="js/vendor/jquery-1.11.3.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="js/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="js/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="js/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="js/metisMenu/metisMenu.min.js"></script>
    <script src="js/metisMenu/metisMenu-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="js/tab.js"></script>
    <!-- icheck JS
		============================================ -->
    <script src="js/icheck/icheck.min.js"></script>
    <script src="js/icheck/icheck-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</body>

</html>