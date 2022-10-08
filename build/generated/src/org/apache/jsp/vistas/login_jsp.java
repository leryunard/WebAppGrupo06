package org.apache.jsp.vistas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modeloDAO.loginDAO;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>login</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- Captura de datos del usuario-->\n");
      out.write("        <form action=\"login.jsp\" method=\"POST\">\n");
      out.write("            Usuario:<input type=\"text\" name=\"txtUser\"><br>\n");
      out.write("            Contraseña:<input type=\"text\" name=\"txtPass\"><br>\n");
      out.write("            <input type=\"submit\" name=\"btnIngresar\" value=\"Ingresar\">\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("        ");

            loginDAO log = new loginDAO();
            if (request.getParameter("btnIngresar") != null) {
                String nombre = request.getParameter("txtUser");
                String contra = request.getParameter("txtPass");
                HttpSession sesion = request.getSession();
                switch (log.loguear(nombre, contra)) {
                    case 1:
                        sesion.setAttribute("user", nombre);
                        sesion.setAttribute("nivel", "1");
                        response.sendRedirect("index.jsp");
                        break;
                    case 2:
                        sesion.setAttribute("user", nombre);
                        sesion.setAttribute("nivel", "2");
                        response.sendRedirect("index.jsp");
                        break;
                    default:
                        out.write("usuario no existe o contraseña no valida");
                        break;
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
