package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.UserDAO;
import java.util.ArrayList;
import dto.tblUsers;

public final class viewInvoice_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Cart Page</title>\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("        <style>\n");
      out.write("            .nav-link {\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .nav-link:hover {\n");
      out.write("                transform: translateY(-5px);\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"bg-white text-zinc-900\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "notification.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header2.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("            ");

                ArrayList<tblUsers> listUser = (ArrayList<tblUsers>) request.getAttribute("listUser");
                if (listUser == null) {
                    UserDAO userDao = new UserDAO();
                    listUser = userDao.listUsers();
                    request.setAttribute("listUser", listUser);
                }
            
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"bg-white p-4\">\n");
      out.write("                <div class=\"mb-4\">\n");
      out.write("                    <form action=\"MainController?action=searchAccount\" method=\"get\">\n");
      out.write("                        <input type=\"text\" name=\"fullName\" placeholder=\"Search by fullname\" class=\"w-full p-2 border border-zinc-300 rounded\">\n");
      out.write("                        <button type=\"submit\" class=\"mt-2 bg-blue-500 text-white p-2 rounded\">Search</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!-- Table -->\n");
      out.write("                <div class=\"bg-white overflow-auto\">\n");
      out.write("                    <table class=\"min-w-full bg-white\">\n");
      out.write("                        <thead class=\"bg-gray-800 text-white\">\n");
      out.write("                            <tr>\n");
      out.write("                                <th\n");
      out.write("                                    class=\"text-left py-3 px-4 uppercase font-semibold text-sm\"\n");
      out.write("                                    >\n");
      out.write("                                    Invoice ID\n");
      out.write("                                </th>\n");
      out.write("                                <th\n");
      out.write("                                    class=\"text-left py-3 px-4 uppercase font-semibold text-sm\"\n");
      out.write("                                    >\n");
      out.write("                                    User ID\n");
      out.write("                                </th>\n");
      out.write("                                <th\n");
      out.write("                                    class=\"text-left py-3 px-4 uppercase font-semibold text-sm\"\n");
      out.write("                                    >\n");
      out.write("                                    Date\n");
      out.write("                                </th>\n");
      out.write("                                <th\n");
      out.write("                                    class=\"text-left py-3 px-4 uppercase font-semibold text-sm\"\n");
      out.write("                                    >\n");
      out.write("                                    Email\n");
      out.write("                                </th>\n");
      out.write("                                <th\n");
      out.write("                                    class=\"text-left py-3 px-4 uppercase font-semibold text-sm\"\n");
      out.write("                                    >\n");
      out.write("                                    Address\n");
      out.write("                                </th>\n");
      out.write("                                <th\n");
      out.write("                                    class=\"text-left py-3 px-4 uppercase font-semibold text-sm\"\n");
      out.write("                                    >\n");
      out.write("                                    Total\n");
      out.write("                                </th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody id=\"table-body\" class=\"text-gray-700\">\n");
      out.write("                            \n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"w-full h-full mt-12 flex justify-around border-t pt-8\">\n");
      out.write("            <div>\n");
      out.write("                <h2 class=\"font-semibold mb-2\">Navigations</h2>\n");
      out.write("                <ul class=\"text-zinc-600 space-y-1\">\n");
      out.write("                    <li>Create new account</li>\n");
      out.write("                    <li>Login</li>\n");
      out.write("                    <li>Menu</li>\n");
      out.write("                    <li>Shop</li>\n");
      out.write("                    <li>About</li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <h2 class=\"font-semibold mb-2\">Contact Info</h2>\n");
      out.write("                <ul class=\"text-zinc-600 space-y-1\">\n");
      out.write("                    <li>🏫 FPT university</li>\n");
      out.write("                    <li>📞 +2 392 3929 210</li>\n");
      out.write("                    <li>✉️ SE183025emailaddress@gmail.com</li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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
