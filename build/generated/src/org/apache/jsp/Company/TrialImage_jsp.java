package org.apache.jsp.Company;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import java.sql.*;

public final class TrialImage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("   \n");
      out.write("   \n");
      out.write("  \n");
      out.write("   \n");
      out.write("   \n");
      out.write("   \n");
      out.write("   \n");
      out.write("   \n");
      out.write("   \n");
      out.write("   \n");
      out.write("   \n");
      out.write("   <html>\n");
      out.write(" <body>\n");
 
Blob image = null;
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String iurl1=null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con =           DriverManager.getConnection("jdbc:mysql://localhost/carpurchase","root","");
    stmt = con.createStatement();
    rs = stmt.executeQuery("select * from advertisement");
}
catch (Exception e) {
    out.println("DB problem"); 
    return;
}
finally {
    try {
        rs.close();
        stmt.close();
        con.close();
    }
    catch (SQLException e) {
        e.printStackTrace();
    }
}

      out.write("\n");
      out.write("    <table border=\"2\">\n");
      out.write("     <tr><th>DISPLAYING IMAGE</th></tr>\n");
      out.write("     <tr><td>Image 2</td></tr>\n");
      out.write("     <tr>\n");
      out.write("       <td>\n");
      out.write("         <img src=\"");
      out.print(rs.getString("advert_image") );
      out.write("\" width=\"500\" height=\"500\"/>\n");
      out.write("       </td>\n");
      out.write("     </tr>\n");
      out.write("    </table>\n");
      out.write("\n");
      out.write(" </body>\n");
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
