package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class amortizacao_002dconstante_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Amortizacao Constante</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Amortizacao Constante!</h1>\n");
      out.write("        <form>\n");
      out.write("            <input type=\"text\" name=\"vl_debito\" placeholder=\"Digite um valor\" />\n");
      out.write("            <input type=\"text\" name=\"taxa\" placeholder=\"Digite uma taxa\" />\n");
      out.write("            <input type=\"number\" name=\"periodo\" placeholder=\"Digite um periodo\" />\n");
      out.write("            <button type=\"submit\">Calcular</button>\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        ");

            double valor = 0;
            double taxa = 0;
            int periodo = 0;
                
            try {
                valor = Double.parseDouble(request.getParameter("vl_debito"));
                taxa = Double.parseDouble(request.getParameter("taxa"));
                periodo = Integer.parseInt(request.getParameter("periodo"));
            } catch (Exception ex) {
                periodo = 1;
                out.println("<div class='erro'><p>Erro ao converter numeros</p></div>");
            }
        
      out.write("\n");
      out.write("        \n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                <th>N. Parcelas</th>\n");
      out.write("                <th>Saldo Devedor</th>\n");
      out.write("                <th>Amortização</th>\n");
      out.write("                <th>Juros</th>\n");
      out.write("                <th>Prestação</th>\n");
      out.write("                \n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            ");
 for (int i = 0; i<periodo; i++) { 
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print( i );
      out.write("</td>\n");
      out.write("                ");
 if (i > 0) { 
      out.write("\n");
      out.write("                    <td>");
      out.print( valor );
      out.write("</td>\n");
      out.write("                    <td>-</td>\n");
      out.write("                    <td>-</td>\n");
      out.write("                    <td>-</td>\n");
      out.write("                ");
 } else { 
      out.write("\n");
      out.write("                    <td></td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td>");
      out.print( taxa );
      out.write("</td>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("        </table>\n");
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
