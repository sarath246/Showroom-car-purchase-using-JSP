package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Showroom_005freg_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      Database_Package.ConnectionClass obj = null;
      synchronized (_jspx_page_context) {
        obj = (Database_Package.ConnectionClass) _jspx_page_context.getAttribute("obj", PageContext.PAGE_SCOPE);
        if (obj == null){
          obj = new Database_Package.ConnectionClass();
          _jspx_page_context.setAttribute("obj", obj, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n");
      out.write("    <title>Register | Nalika - Material Admin Template</title>\n");
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
      out.write("    ");

        String ins="",name="",place="",uname="",psw="";
        name=request.getParameter("txt_name");
        place=request.getParameter("txt_place");
        uname=request.getParameter("txt_uname");
        psw=request.getParameter("txt_psw");
        
    if(request.getParameter("btn_submit")!=null)
    {
        ins="insert into tbl_showroom(company_name,place_id,company_uname,company_psw)values('"+name+"','"+place+"','"+uname+"','"+psw+"')";
        obj.executeCommand(ins);
        out.println(ins);
    }
        
      out.write("\n");
      out.write("    <div class=\"color-line\"></div>\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\">\n");
      out.write("                <div class=\"back-link back-backend\">\n");
      out.write("                    <a href=\"Login.jsp\" class=\"btn btn-primary\">Back to Dashboard</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-12\"></div>\n");
      out.write("            <div class=\"col-md-6 col-md-6 col-sm-6 col-xs-12\">\n");
      out.write("                <div class=\"text-center custom-login\">\n");
      out.write("                    <h3>Registration</h3>\n");
      out.write("                    <p>Admin template with very clean and aesthetic style prepared for your next app. </p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"hpanel\">\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                        <form action=\"#\" id=\"loginForm\">\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"form-group col-lg-12\">\n");
      out.write("                                    <label>Name</label>\n");
      out.write("                                    <input type=\"text\" name=\"txt_name\" class=\"form-control\" required=\"\">\n");
      out.write("                                </div>\n");
      out.write("                               \n");
      out.write("                                <div class=\"form-group col-lg-6\">\n");
      out.write("                                    <label>Place</label>\n");
      out.write("                                    <select name=\"txt_place\" class=\"form-control\" required=\"\">\n");
      out.write("                                        <option value=\"\">-----------Select-----------</option>\n");
      out.write("            ");

                String sel="select * from tbl_place";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
               {
                
      out.write("\n");
      out.write("                <option value=\"");
      out.print( rs.getString("place_id") );
      out.write('"');
      out.write('>');
      out.print( rs.getString("place_name") );
      out.write("</option>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-lg-6\">\n");
      out.write("                                    <label>Email Address</label>\n");
      out.write("                                    <input class=\"form-control\">\n");
      out.write("                                </div>\n");
      out.write("                                \n");
      out.write("                                    <div class=\"form-group col-lg-6\">\n");
      out.write("                                    <label>Username</label>\n");
      out.write("                                    <input type=\"text\" name=\"txt_uname\" class=\"form-control\" required=\"\">\n");
      out.write("                                </div>\n");
      out.write("                                     <div class=\"form-group col-lg-6\">\n");
      out.write("                                    <label>Password</label>\n");
      out.write("                                    <input type=\"password\" name=\"txt_psw\" class=\"form-control\" required=\"\">\n");
      out.write("                                </div>\n");
      out.write("                                    \n");
      out.write("                                <div class=\"checkbox col-lg-12\">\n");
      out.write("                                    <input type=\"checkbox\" class=\"i-checks\" checked> Sigh up for our newsletter\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"text-center\">\n");
      out.write("                                <input type=\"submit\" class=\"btn btn-success loginbtn\" name=\"btn_submit\" value=\"Register\" onclick=\"<script>alert('Registration successfully completed')</script>\">\n");
      out.write("                                <button class=\"btn btn-default\">Cancel</button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-12\"></div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-12 text-center\">\n");
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
      out.write("    </body>\n");
      out.write("</html>\n");
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
