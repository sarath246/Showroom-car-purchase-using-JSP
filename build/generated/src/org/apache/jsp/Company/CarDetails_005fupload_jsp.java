package org.apache.jsp.Company;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;

public final class CarDetails_005fupload_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("   \n");
      out.write("   ");
      out.write('\n');
      Database_Package.ConnectionClass obj = null;
      synchronized (_jspx_page_context) {
        obj = (Database_Package.ConnectionClass) _jspx_page_context.getAttribute("obj", PageContext.PAGE_SCOPE);
        if (obj == null){
          obj = new Database_Package.ConnectionClass();
          _jspx_page_context.setAttribute("obj", obj, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>       \n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title></title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

           
             FileItem f_item=null;
             File savedFile=null;
             
       String field_name="";
       String fn="",pf="",proof="";
       String file_name="";


String field[] = new String[20];
String value[] = new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);//true/false

if(isMultipart)
{
   

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields.everything on form adding t itemlist
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);//requeat contains evrything on form this is parsed and stored to item_list
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator used to iterate through all positions in item_lists
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())//checking if there is any value in the position like rs.next()
    {
       
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();// value to which the iterator points  and is coverted to fileitem format

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc) or multipath
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();//field
            value[k]=f_item.getString();//user typing value
                
                k++;//
        }
       else//when it is an image or multipart
       {
		   
		   
            //f_item=(FileItem)itr.next();
            
           file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("car_image"))//write the name of image here it is img_product
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\Web\\Company\\CarDetails_photos\\";//path for storing image
            Random r=new Random();//to generate random number
             int r_num=r.nextInt(1111)+999;//values between this are generated
             
            fn="Spaire_"+r_num+ext;//generating random number for images so this name and format of imagewil be stored inside the server
            //creating a file object
            savedFile=new File(file_path+fn);//fn contains name of file
             try
            {
                //writing the file object
                f_item.write(savedFile);  //writing to server means the folder             
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
           //to upload proof of doctor
           
           /* if(field_name.equals("proof_doctor"))//write the name of image here it is img_product
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\Web\\Doctor\\DoctorProof\\";//path for storing image
            Random r=new Random();//to generate random number
             int r_num=r.nextInt(1111)+999;//values between this are generated
             
            proof="Doctorproof_"+r_num+ext;//generating random number for images so this name and format of imagewil be stored inside the server
            //creating a file object
            savedFile=new File(file_path+proof);//fn contains name of file
             try
            {
                //writing the file object
                f_item.write(savedFile);  //writing to server means the folder             
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }*/
           
           
  
       }
           
           }
    //Strinh str1="insert into tbl_user ()";//inserting file
  String str1="insert into tbl_cardetails(car_name,cartype_id,car_milage,engine_displacement,max_tork,max_power,boot_space,fueltank_cappacity,body_type,power_stering,powerwindow_front,abs,driver_airbag,passenger_airbag,automatic_climatecontrol,flylight_front,alloy_weal,engin_transmission,car_price,car_interior,car_exterior,car_safty,car_photo,showroom_id)values('"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"','"+value[4]+"','"+value[5]+"','"+value[6]+"','"+value[7]+"','"+value[8]+"','"+value[9]+"','"+value[10]+"','"+value[11]+"','"+value[12]+"','"+value[13]+"','"+value[14]+"','"+value[15]+"','"+value[16]+"','"+value[17]+"','"+value[18]+"','"+value[19]+"','"+value[20]+"','"+value[21]+"','"+fn+"','"+session.getAttribute("regid")+"')";
   System.out.println(str1);
   out.println(str1);
   
    boolean status=obj.executeCommand(str1);
    
    if(status==true)
    {
      
      out.write(" \n");
      out.write("       <script type=\"text/javascript\">\n");
      out.write("            alert(\"Upload Successfully..\");\n");
      out.write("            setTimeout(function(){window.location.href='Car_details.jsp'},40);//40millisecend it go to next page\n");
      out.write("        </script>\n");
      out.write("     ");

    }
     }    

        
      out.write("\n");
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
