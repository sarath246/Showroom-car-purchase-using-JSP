package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html class=\"no-js\" lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    ");
      Database_Package.ConnectionClass obj = null;
      synchronized (_jspx_page_context) {
        obj = (Database_Package.ConnectionClass) _jspx_page_context.getAttribute("obj", PageContext.PAGE_SCOPE);
        if (obj == null){
          obj = new Database_Package.ConnectionClass();
          _jspx_page_context.setAttribute("obj", obj, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n");
      out.write("    <title>Login | Nalika - Material Admin Template</title>\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <!-- favicon\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"img/favicon.ico\">\n");
      out.write("    <!-- Google Fonts\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900\" rel=\"stylesheet\">\n");
      out.write("    <!-- Bootstrap CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("    <!-- Bootstrap CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/font-awesome.min.css\">\n");
      out.write("    <!-- owl.carousel CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/owl.carousel.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/owl.theme.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/owl.transitions.css\">\n");
      out.write("    <!-- animate CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/animate.css\">\n");
      out.write("    <!-- normalize CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/normalize.css\">\n");
      out.write("    <!-- main CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/main.css\">\n");
      out.write("    <!-- morrisjs CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/morrisjs/morris.css\">\n");
      out.write("    <!-- mCustomScrollbar CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/scrollbar/jquery.mCustomScrollbar.min.css\">\n");
      out.write("    <!-- metisMenu CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/metisMenu/metisMenu.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/metisMenu/metisMenu-vertical.css\">\n");
      out.write("    <!-- calendar CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/calendar/fullcalendar.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/calendar/fullcalendar.print.min.css\">\n");
      out.write("    <!-- forms CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/form/all-type-forms.css\">\n");
      out.write("    <!-- style CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("    <!-- responsive CSS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/responsive.css\">\n");
      out.write("    <!-- modernizr JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/vendor/modernizr-2.8.3.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("   ");

            String uname="",psw="",select="",inserts="";
            int k=1;
            String st=Integer.valueOf(k).toString();
            uname=request.getParameter("txt_uname");
            psw=request.getParameter("txt_psw");
            char[] chars={'@','-','='};
            String characters=new String(chars);
            
        String sel="select * from tbl_company where company_uname='"+uname+"' and company_psw='"+psw+"' and company_status='1'";
        ResultSet rs=obj.selectCommand(sel);
        
        String sele="select * from tbl_admin where admin_uname='"+uname+"' and admin_psw='"+psw+"'";
        ResultSet rr=obj.selectCommand(sele);
        
        select="select * from tbl_showroom where showroom_uname='"+uname+"' and showroom_psw='"+psw+"' and showroom_status='1'";
        ResultSet rss=obj.selectCommand(select);
        int i=0;
        String no=String.valueOf(i);
       
        if(request.getParameter("btn_submit")!=null)
        {
        if(rs.next())
        {
            session.setAttribute("regid", rs.getString("company_id"));
            session.setAttribute("uname", rs.getString("company_uname"));
            response.sendRedirect("../Company/HomePage.jsp");
        }else if(rr.next())
        {
            response.sendRedirect("../Admin/HomePage.jsp");
        }
        else if(rss.next())
        {
            session.setAttribute("regid", rss.getString("showroom_id"));
            session.setAttribute("uname", rss.getString("showroom_uname"));
            response.sendRedirect("../Showrooms/HomePage.jsp");
            
        inserts="insert into tbl_online(online_status,showroom_id)values('"+st+"','"+request.getAttribute("regid")+"')";
        obj.executeCommand(inserts);
        out.println(inserts);
            
            String status=rss.getString("showroom_status");
           if(status==no)
        {
            
            out.println("<script>alert('Admin not accepted you')</script>");
            
        }
        }else if(psw.contains(characters))
        {
            out.println("<script>alert('failed')</script>");
        }
        else
        {
            out.println("<script>alert('Invalid login')</script>");
        }
        
        String ins="",s="";
        int j=1;
        String status=String.valueOf(j);
        ins="insert into tbl_online(online_status,showroom_id)values('"+status+"','"+session.getAttribute("regid")+"')";
        boolean b=obj.executeCommand(ins);
        //System.out.println(ins);
        if(b==true)
        {
            s="success";
        }else
        {
            s="failed";
        }
         System.out.println(s);
        }
            
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"color-line\"></div>\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">\n");
      out.write("                <div class=\"back-link back-backend\">\n");
      out.write("                    <a href=\"index.html\" class=\"btn btn-primary\">Back to Dashboard</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-12\"></div>\n");
      out.write("            <div class=\"col-md-4 col-md-4 col-sm-4 col-xs-12\">\n");
      out.write("                <div class=\"text-center m-b-md custom-login\">\n");
      out.write("                    <h3>PLEASE LOGIN TO APP</h3>\n");
      out.write("                    <p>This is the best app ever!</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"hpanel\">\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                        <form action=\"#\" id=\"loginForm\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"control-label\" for=\"username\">Username</label>\n");
      out.write("                                <input type=\"text\" name=\"txt_uname\" placeholder=\"example@gmail.com\" title=\"Please enter you username\" required=\"\" value=\"\" name=\"username\" id=\"username\" class=\"form-control\">\n");
      out.write("                                <span class=\"help-block small\">Your unique username to app</span>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label class=\"control-label\" for=\"password\">Password</label>\n");
      out.write("                                <input type=\"password\" name=\"txt_psw\" title=\"Please enter your password\" placeholder=\"******\" required=\"\" value=\"\" name=\"password\" id=\"password\" class=\"form-control\">\n");
      out.write("                                <span class=\"help-block small\">Yur strong password</span>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"checkbox login-checkbox\">\n");
      out.write("                                <label>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" class=\"i-checks\"> Remember me </label>\n");
      out.write("                                <p class=\"help-block small\">(if this is a private computer)</p>\n");
      out.write("                            </div>\n");
      out.write("                            <input type=\"submit\" name=\"btn_submit\" class=\"btn btn-success btn-block loginbtn\" value=\"Login\">\n");
      out.write("                            <a class=\"btn btn-default btn-block\" href=\"index.html\">Register</a>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-12\"></div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-12 col-md-12 col-sm-12 col-xs-12 text-center\">\n");
      out.write("                <p>Copyright © 2018 <a href=\"https://colorlib.com/wp/templates/\">Colorlib</a> All rights reserved.</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- jquery\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/vendor/jquery-1.11.3.min.js\"></script>\n");
      out.write("    <!-- bootstrap JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    <!-- wow JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/wow.min.js\"></script>\n");
      out.write("    <!-- price-slider JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/jquery-price-slider.js\"></script>\n");
      out.write("    <!-- meanmenu JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/jquery.meanmenu.js\"></script>\n");
      out.write("    <!-- owl.carousel JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/owl.carousel.min.js\"></script>\n");
      out.write("    <!-- sticky JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/jquery.sticky.js\"></script>\n");
      out.write("    <!-- scrollUp JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/jquery.scrollUp.min.js\"></script>\n");
      out.write("    <!-- mCustomScrollbar JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/scrollbar/jquery.mCustomScrollbar.concat.min.js\"></script>\n");
      out.write("    <script src=\"js/scrollbar/mCustomScrollbar-active.js\"></script>\n");
      out.write("    <!-- metisMenu JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/metisMenu/metisMenu.min.js\"></script>\n");
      out.write("    <script src=\"js/metisMenu/metisMenu-active.js\"></script>\n");
      out.write("    <!-- tab JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/tab.js\"></script>\n");
      out.write("    <!-- icheck JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/icheck/icheck.min.js\"></script>\n");
      out.write("    <script src=\"js/icheck/icheck-active.js\"></script>\n");
      out.write("    <!-- plugins JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/plugins.js\"></script>\n");
      out.write("    <!-- main JS\n");
      out.write("\t\t============================================ -->\n");
      out.write("    <script src=\"js/main.js\"></script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
