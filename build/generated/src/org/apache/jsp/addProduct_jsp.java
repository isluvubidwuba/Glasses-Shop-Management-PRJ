package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("                <title>Trang Giỏ Hàng</title>\n");
      out.write("                <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("                <style>\n");
      out.write("                    .nav-link {\n");
      out.write("                        transition: all 0.3s ease;\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    .nav-link:hover {\n");
      out.write("                        transform: translateY(-5px);\n");
      out.write("                        text-align: center;\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    .file-input-container {\n");
      out.write("                        display: flex;\n");
      out.write("                        flex-direction: column;\n");
      out.write("                        align-items: center;\n");
      out.write("                        justify-content: center;\n");
      out.write("                        width: 100%;\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    .file-input {\n");
      out.write("                        width: 100%;\n");
      out.write("                        height: 150px;\n");
      out.write("                        border: 2px dashed #ccc;\n");
      out.write("                        border-radius: 8px;\n");
      out.write("                        display: flex;\n");
      out.write("                        align-items: center;\n");
      out.write("                        justify-content: center;\n");
      out.write("                        background-color: #f8f8f8;\n");
      out.write("                        cursor: pointer;\n");
      out.write("                        margin-top: 10px;\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    .file-input.small {\n");
      out.write("                        width: auto;\n");
      out.write("                        height: auto;\n");
      out.write("                        padding: 10px;\n");
      out.write("                        border: 2px solid #ccc;\n");
      out.write("                        background-color: transparent;\n");
      out.write("                        margin-top: 10px;\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    .file-input input[type=\"file\"] {\n");
      out.write("                        display: none;\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    .file-input-label {\n");
      out.write("                        text-align: center;\n");
      out.write("                        font-size: 14px;\n");
      out.write("                        color: #999;\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    .image-preview {\n");
      out.write("                        width: 100%;\n");
      out.write("                        height: auto;\n");
      out.write("                        margin-bottom: 10px;\n");
      out.write("                        border-radius: 8px;\n");
      out.write("                    }\n");
      out.write("                </style>\n");
      out.write("                <script>\n");
      out.write("                    function previewImage(event) {\n");
      out.write("                        const reader = new FileReader();\n");
      out.write("                        reader.onload = function () {\n");
      out.write("                            const output = document.getElementById('imagePreview');\n");
      out.write("                            output.src = reader.result;\n");
      out.write("                            output.style.display = 'block';\n");
      out.write("\n");
      out.write("                            const fileInput = document.querySelector('.file-input');\n");
      out.write("                            fileInput.classList.add('small');\n");
      out.write("                            fileInput.querySelector('.file-input-label').innerText = 'Đổi ảnh';\n");
      out.write("                        };\n");
      out.write("                        reader.readAsDataURL(event.target.files[0]);\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                    function validateForm() {\n");
      out.write("                        const fileInput = document.getElementById('dropzone-file');\n");
      out.write("                        if (fileInput.files.length === 0) {\n");
      out.write("                            alert('Vui lòng chọn một tệp để tải lên.');\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                        return true;\n");
      out.write("                    }\n");
      out.write("                </script>\n");
      out.write("                </head>\n");
      out.write("\n");
      out.write("                <body>\n");
      out.write("                    <div class=\"bg-white text-zinc-900\">\n");
      out.write("                        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "notification.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("                        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header2.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"bg-white p-6 rounded-lg shadow-md max-w-6xl mx-auto\">\n");
      out.write("                            <h2 class=\"text-2xl font-semibold mb-6\">Tạo Kính</h2>\n");
      out.write("                            <form action=\"MainController?action=createGlasses\" method=\"POST\" enctype=\"multipart/form-data\" onsubmit=\"return validateForm()\">\n");
      out.write("                                <div class=\"grid grid-cols-1 md:grid-cols-12 gap-6\">\n");
      out.write("                                    <div class=\"md:col-span-4 flex items-center justify-center w-full file-input-container\">\n");
      out.write("                                        <img id=\"imagePreview\" class=\"image-preview\" style=\"display: none;\" />\n");
      out.write("                                        <label for=\"dropzone-file\" class=\"file-input\">\n");
      out.write("                                            <div class=\"file-input-label\">\n");
      out.write("                                                <svg class=\"w-6 h-6 mb-2 text-gray-500 dark:text-gray-400\" aria-hidden=\"true\" xmlns=\"http://www.w3.org/2000/svg\" fill=\"none\" viewBox=\"0 0 20 16\">\n");
      out.write("                                                    <path stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M13 13h3a3 3 0 0 0 0-6h-.025A5.56 5.56 0 0 0 16 6.5 5.5 5.5 0 0 0 5.207 5.021C5.137 5.017 5.071 5 5 5a4 4 0 0 0 0 8h2.167M10 15V6m0 0L8 8m2-2 2 2\" />\n");
      out.write("                                                </svg>\n");
      out.write("                                                <span>Click để tải lên</span>\n");
      out.write("                                            </div>\n");
      out.write("                                            <input id=\"dropzone-file\" type=\"file\" name=\"image\" onchange=\"previewImage(event)\" required />\n");
      out.write("                                        </label>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"md:col-span-8\">\n");
      out.write("                                        <div class=\"grid grid-cols-1 md:grid-cols-2 gap-6\">\n");
      out.write("                                            <div>\n");
      out.write("                                                <label class=\"block text-sm font-medium text-gray-700 mb-1\">ID <span class=\"text-red-500\">*</span></label>\n");
      out.write("                                                <input type=\"text\" name=\"idGlasses\" class=\"w-full border border-gray-300 p-2 rounded-md\" required />\n");
      out.write("                                            </div>\n");
      out.write("                                            <div>\n");
      out.write("                                                <label class=\"block text-sm font-medium text-gray-700 mb-1\">Tên <span class=\"text-red-500\">*</span></label>\n");
      out.write("                                                <input type=\"text\" name=\"name\" class=\"w-full border border-gray-300 p-2 rounded-md\" required />\n");
      out.write("                                            </div>\n");
      out.write("                                            <div>\n");
      out.write("                                                <label class=\"block text-sm font-medium text-gray-700 mb-1\">Mô tả</label>\n");
      out.write("                                                <input type=\"text\" name=\"description\" class=\"w-full border border-gray-300 p-2 rounded-md\" />\n");
      out.write("                                            </div>\n");
      out.write("                                            <div>\n");
      out.write("                                                <label class=\"block text-sm font-medium text-gray-700 mb-1\">Loại</label>\n");
      out.write("                                                <select name=\"type\" class=\"w-full border border-gray-300 p-2 rounded-md\" required>\n");
      out.write("                                                    <option value=\"Men\">Men</option>\n");
      out.write("                                                    <option value=\"Women\">Women</option>\n");
      out.write("                                                    <option value=\"Sun Glasses\">Sun Glasses</option>\n");
      out.write("                                                </select>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div>\n");
      out.write("                                                <label class=\"block text-sm font-medium text-gray-700 mb-1\">Giá <span class=\"text-red-500\">*</span></label>\n");
      out.write("                                                <input type=\"number\" name=\"price\" class=\"w-full border border-gray-300 p-2 rounded-md\" min=\"1\" required />\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mt-6\">\n");
      out.write("                                    <button type=\"submit\" class=\"bg-purple-500 text-white py-2 px-4 rounded-md w-full md:w-auto\">TẠO</button>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"w-full h-full mt-12 flex justify-around border-t pt-8\">\n");
      out.write("                        <div>\n");
      out.write("                            <h2 class=\"font-semibold mb-2\">Navigations</h2>\n");
      out.write("                            <ul class=\"text-zinc-600 space-y-1\">\n");
      out.write("                                <li>Create new account</li>\n");
      out.write("                                <li>Login</li>\n");
      out.write("                                <li>Menu</li>\n");
      out.write("                                <li>Shop</li>\n");
      out.write("                                <li>About</li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                        <div>\n");
      out.write("                            <h2 class=\"font-semibold mb-2\">Contact Info</h2>\n");
      out.write("                            <ul class=\"text-zinc-600 space-y-1\">\n");
      out.write("                                <li>🏫 FPT university</li>\n");
      out.write("                                <li>📞 +2 392 3929 210</li>\n");
      out.write("                                <li>✉️ SE183025emailaddress@gmail.com</li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </body>\n");
      out.write("\n");
      out.write("                </html>\n");
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
