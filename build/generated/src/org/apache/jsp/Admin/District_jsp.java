package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class District_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Admin/HomePage.jsp");
  }

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
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>District</title>\n");
      out.write("        ");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad Template</title>\n");
      out.write("    <!-- Core CSS - Include with every page -->\n");
      out.write("    <link href=\"assets/plugins/bootstrap/bootstrap.css\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"assets/font-awesome/css/font-awesome.css\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"assets/plugins/pace/pace-theme-big-counter.css\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"assets/css/style.css\" rel=\"stylesheet\" />\n");
      out.write("     <link href=\"form.css\" rel=\"stylesheet\" />\n");
      out.write("    <link href=\"assets/css/main-style.css\" rel=\"stylesheet\" />\n");
      out.write("    <!-- Page-Level CSS -->\n");
      out.write("    <link href=\"assets/plugins/morris/morris-0.4.3.min.css\" rel=\"stylesheet\" />\n");
      out.write("   </head>\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("    <!--  wrapper -->\n");
      out.write("    <div id=\"wrapper\">\n");
      out.write("        <!-- navbar top -->\n");
      out.write("        <nav class=\"navbar navbar-default navbar-fixed-top\" role=\"navigation\" id=\"navbar\">\n");
      out.write("            <!-- navbar-header -->\n");
      out.write("            <div class=\"navbar-header\">\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".sidebar-collapse\">\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                </button>\n");
      out.write("                <a class=\"navbar-brand\" href=\"index.html\">\n");
      out.write("                    <div style=\"color:white\"> ADMIN </div>\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("            <!-- end navbar-header -->\n");
      out.write("            <!-- navbar-top-links -->\n");
      out.write("            <ul class=\"nav navbar-top-links navbar-right\">\n");
      out.write("                <!-- main dropdown -->\n");
      out.write("                \n");
      out.write("                \n");
      out.write("\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\n");
      out.write("                        <span class=\"top-label label label-warning\">5</span>  <i class=\"fa fa-bell fa-3x\"></i>\n");
      out.write("                    </a>\n");
      out.write("                    <!-- dropdown alerts-->\n");
      out.write("                    <ul class=\"dropdown-menu dropdown-alerts\">\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\">\n");
      out.write("                                <div>\n");
      out.write("                                    <i class=\"fa fa-comment fa-fw\"></i>New Comment\n");
      out.write("                                    <span class=\"pull-right text-muted small\">4 minutes ago</span>\n");
      out.write("                                </div>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\">\n");
      out.write("                                <div>\n");
      out.write("                                    <i class=\"fa fa-twitter fa-fw\"></i>3 New Followers\n");
      out.write("                                    <span class=\"pull-right text-muted small\">12 minutes ago</span>\n");
      out.write("                                </div>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\">\n");
      out.write("                                <div>\n");
      out.write("                                    <i class=\"fa fa-envelope fa-fw\"></i>Message Sent\n");
      out.write("                                    <span class=\"pull-right text-muted small\">4 minutes ago</span>\n");
      out.write("                                </div>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\">\n");
      out.write("                                <div>\n");
      out.write("                                    <i class=\"fa fa-tasks fa-fw\"></i>New Task\n");
      out.write("                                    <span class=\"pull-right text-muted small\">4 minutes ago</span>\n");
      out.write("                                </div>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\">\n");
      out.write("                                <div>\n");
      out.write("                                    <i class=\"fa fa-upload fa-fw\"></i>Server Rebooted\n");
      out.write("                                    <span class=\"pull-right text-muted small\">4 minutes ago</span>\n");
      out.write("                                </div>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li>\n");
      out.write("                            <a class=\"text-center\" href=\"#\">\n");
      out.write("                                <strong>See All Alerts</strong>\n");
      out.write("                                <i class=\"fa fa-angle-right\"></i>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                    <!-- end dropdown-alerts -->\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\n");
      out.write("                        <i class=\"fa fa-user fa-3x\"></i>\n");
      out.write("                    </a>\n");
      out.write("                    <!-- dropdown user-->\n");
      out.write("                    <ul class=\"dropdown-menu dropdown-user\">\n");
      out.write("                        <li><a href=\"Change_psw.jsp\"><i class=\"fa fa-user fa-fw\"></i>Change password</a>\n");
      out.write("                        </li>\n");
      out.write("                       \n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li><a href=\"../Guest/Index.jsp\"><i class=\"fa fa-sign-out fa-fw\"></i>Logout</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                    <!-- end dropdown-user -->\n");
      out.write("                </li>\n");
      out.write("                <!-- end main dropdown -->\n");
      out.write("            </ul>\n");
      out.write("            <!-- end navbar-top-links -->\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("        <!-- end navbar top -->\n");
      out.write("\n");
      out.write("        <!-- navbar side -->\n");
      out.write("        <nav class=\"navbar-default navbar-static-side\" role=\"navigation\">\n");
      out.write("            <!-- sidebar-collapse -->\n");
      out.write("            <div class=\"sidebar-collapse\">\n");
      out.write("                <!-- side-menu -->\n");
      out.write("                <ul class=\"nav\" id=\"side-menu\">\n");
      out.write("                    <li>\n");
      out.write("                        <!-- user image section-->\n");
      out.write("                        <div class=\"user-section\">\n");
      out.write("                            <div class=\"user-section-inner\">\n");
      out.write("                                <img src=\"assets/img/user.jpg\" alt=\"\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"user-info\">\n");
      out.write("                                <div> <strong>ADMIN</strong></div>\n");
      out.write("                                <div class=\"user-text-online\">\n");
      out.write("                                    <span class=\"user-circle-online btn btn-success btn-circle \"></span>&nbsp;Online\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <!--end user image section-->\n");
      out.write("                    </li>\n");
      out.write("                   \n");
      out.write("                    <li class=\"selected\">\n");
      out.write("                        <a href=\"HomePage.jsp\"><i class=\"fa fa-dashboard fa-fw\"></i>Dashboard</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\"><i class=\"fa fa-bar-chart-o fa-fw\"></i>ADD<span class=\"fa arrow\"></span></a>\n");
      out.write("                        <ul class=\"nav nav-second-level\">\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"State.jsp\">State</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"District.jsp\">District</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"Place.jsp\">Place</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                        <!-- second-level-items -->\n");
      out.write("                    </li>\n");
      out.write("<!--                     <li>\n");
      out.write("                        <a href=\"timeline.html\"><i class=\"fa fa-flask fa-fw\"></i>Timeline</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"tables.html\"><i class=\"fa fa-table fa-fw\"></i>Tables</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"forms.html\"><i class=\"fa fa-edit fa-fw\"></i>Forms</a>\n");
      out.write("                    </li>-->\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\"><i class=\"fa fa-wrench fa-fw\"></i>Details<span class=\"fa arrow\"></span></a>\n");
      out.write("                        <ul class=\"nav nav-second-level\">\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"Colour.jsp\">Colours</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"Car_colors.jsp\">Car colours</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"Car_type.jsp\">Car types</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"Spareparts_type.jsp\">Spareparts types</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"Transmission_type.jsp\">Transmission types</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"fuel_type.jsp\">Fuel types</a>\n");
      out.write("                            </li>\n");
      out.write("                             <li>\n");
      out.write("                                <a href=\"User_list.jsp\">User list</a>\n");
      out.write("                            </li>\n");
      out.write("                             <li>\n");
      out.write("                                <a href=\"User_login.jsp\">User login</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                        <!-- second-level-items -->\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\"><i class=\"fa fa-sitemap fa-fw\"></i>Multi-Level Dropdown<span class=\"fa arrow\"></span></a>\n");
      out.write("                        <ul class=\"nav nav-second-level\">\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"#\">Second Level Item</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"#\">Second Level Item</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"#\">Third Level <span class=\"fa arrow\"></span></a>\n");
      out.write("                                <ul class=\"nav nav-third-level\">\n");
      out.write("                                    <li>\n");
      out.write("                                        <a href=\"#\">Third Level Item</a>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li>\n");
      out.write("                                        <a href=\"#\">Third Level Item</a>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li>\n");
      out.write("                                        <a href=\"#\">Third Level Item</a>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li>\n");
      out.write("                                        <a href=\"#\">Third Level Item</a>\n");
      out.write("                                    </li>\n");
      out.write("                                </ul>\n");
      out.write("                                <!-- third-level-items -->\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                        <!-- second-level-items -->\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\"><i class=\"fa fa-files-o fa-fw\"></i>Sample Pages<span class=\"fa arrow\"></span></a>\n");
      out.write("                        <ul class=\"nav nav-second-level\">\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"blank.html\">Blank Page</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"login.html\">Login Page</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                        <!-- second-level-items -->\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("                <!-- end side-menu -->\n");
      out.write("            </div>\n");
      out.write("            <!-- end sidebar-collapse -->\n");
      out.write("        </nav>\n");
      out.write("        <!-- end navbar side -->\n");
      out.write("        <!--  page-wrapper -->\n");
      out.write("        <div id=\"page-wrapper\">\n");
      out.write("\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <!-- Page Header -->\n");
      out.write("                <div class=\"col-lg-12\">\n");
      out.write("                    <h1 class=\"page-header\">Dashboard</h1>\n");
      out.write("                </div>\n");
      out.write("                <!--End Page Header -->\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("\n");
      out.write("                 \n");
      out.write("                    <!--End Chat Panel Example-->\n");
      out.write("               \n");
      out.write("            \n");
      out.write("\n");
      out.write("\n");
      out.write("         \n");
      out.write("\n");
      out.write("\n");
      out.write("        \n");
      out.write("        <!-- end page-wrapper -->\n");
      out.write("\n");
      out.write("    <!-- end wrapper -->\n");
      out.write("\n");
      out.write("    <!-- Core Scripts - Include with every page -->\n");
      out.write("    <script src=\"assets/plugins/jquery-1.10.2.js\"></script>\n");
      out.write("    <script src=\"assets/plugins/bootstrap/bootstrap.min.js\"></script>\n");
      out.write("    <script src=\"assets/plugins/metisMenu/jquery.metisMenu.js\"></script>\n");
      out.write("    <script src=\"assets/plugins/pace/pace.js\"></script>\n");
      out.write("    <script src=\"assets/scripts/siminta.js\"></script>\n");
      out.write("    <!-- Page-Level Plugin Scripts-->\n");
      out.write("    <script src=\"assets/plugins/morris/raphael-2.1.0.min.js\"></script>\n");
      out.write("    <script src=\"assets/plugins/morris/morris.js\"></script>\n");
      out.write("    <script src=\"assets/scripts/dashboard-demo.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            img{\n");
      out.write("                width:10px;height:10px;\n");
      out.write("            }\n");
      out.write("            </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            String dname="",editid="",district_name="",edit="",update="",sname="";
            dname=request.getParameter("txtdistrict");
            sname=request.getParameter("sel_state");
            if(request.getParameter("btnsave")!=null)
            {
              if(request.getParameter("eid")!=null)
              {
                edit=request.getParameter("eid");
                update="update tbl_district set district_name='"+dname+"',state_name='"+sname+"' where district_id='"+edit+"'";
                obj.executeCommand(update);
                out.println(update);
               
              }
              else
              {
                String ins="insert into tbl_district(district_name,state_id) values('"+dname+"','"+sname+"')";
                obj.executeCommand(ins);
                out.println(ins);
            }
            }
              if(request.getParameter("did")!=null)
            {
              String delid=request.getParameter("did");
              String del="delete from tbl_district where district_id='"+delid+"'";
              obj.executeCommand(del);
              //out.println(del);
            }
               if(request.getParameter("eid")!=null)
            {
                editid=request.getParameter("eid");
                String select="select * from tbl_district where district_id='"+editid+"'";
                ResultSet rs=obj.selectCommand(select);
                if(rs.next())
          {
                district_name=rs.getString("district_name");
            }
            }
            
            
      out.write("\n");
      out.write("            <div id=\"tab\" align=\"center\">\n");
      out.write("        <form method=\"post\">\n");
      out.write("        <table border=\"1\">\n");
      out.write("            <th colspan=\"2\">\n");
      out.write("                District details\n");
      out.write("            </th>\n");
      out.write("            <tr>\n");
      out.write("                <td align=\"center\">\n");
      out.write("                    District\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <input type=\"text\" name=\"txtdistrict\" value=\"");
 out.println(district_name); 
      out.write("\" required=\"required\">\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>State</td>\n");
      out.write("                <td> <select name=\"sel_state\" value=\"\" required=\"required\">\n");
      out.write("            <option >----Select----</option>\n");
      out.write("        ");

            String sele="select * from tbl_state";
            ResultSet rss=obj.selectCommand(sele);
            while(rss.next())
        {
            
      out.write("\n");
      out.write("            <option value=\"");
      out.print( rss.getString("state_id") );
      out.write('"');
      out.write('>');
      out.print( rss.getString("state_name") );
      out.write("</option>\n");
      out.write("            ");
 } 
      out.write(" \n");
      out.write("            </select>\n");
      out.write("            \n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("           \n");
      out.write("            <tr>\n");
      out.write("                <td align=\"center\" colspan=\"2\">\n");
      out.write("            <input type=\"submit\" name=\"btnsave\" >\n");
      out.write("            </td>\n");
      out.write("            </tr>\n");
      out.write("        </table><br><br><br><br>\n");
      out.write("       \n");
      out.write("            <table border=\"1\">\n");
      out.write("        \n");
      out.write("                <tr>\n");
      out.write("              \n");
      out.write("                <th style=\"text-align:center;\">Sl.No</th>\n");
      out.write("                <th style=\"text-align:center;\">District</th>\n");
      out.write("                <th style=\"text-align:center;\">State</th>\n");
      out.write("                <th>Edit</th>\n");
      out.write("                <th>Delete </th>\n");
      out.write("                \n");
      out.write("                </tr>\n");
      out.write("         ");

          
          int i=0;
          String sel="select * from tbl_district d inner join tbl_state s on s.state_id=d.state_id order by d.district_id asc";
          ResultSet rs=obj.selectCommand(sel);
          while(rs.next())
          {
           i++;
         
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                   \n");
      out.write("                    <td align=\"center\">");
 out.println(i);  
      out.write("</td>\n");
      out.write("                    <td style=\"text-align:center;\">");
      out.print( rs.getString("district_name")  );
      out.write("</td>\n");
      out.write("                    <td style=\"text-align:center;\">");
      out.print( rs.getString("state_name") );
      out.write("</td>\n");
      out.write("                    <td><a href=\"District.jsp?eid=");
      out.print( rs.getString("district_id") );
      out.write("\">Edit</a></td>\n");
      out.write("                    <td><a href=\"District.jsp?did=");
      out.print( rs.getString("district_id") );
      out.write("\">\n");
      out.write("                            <img src=\"../includes/Notice-Error-icon.jpg\" id=\"img\"/>\n");
      out.write("                        </a></td>\n");
      out.write("                </tr>\n");
      out.write("        ");

          }
         
      out.write("\n");
      out.write("            </table>\n");
      out.write("         \n");
      out.write("            \n");
      out.write("            </form>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("    <br/><br/><br/><br/><br/>\n");
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
