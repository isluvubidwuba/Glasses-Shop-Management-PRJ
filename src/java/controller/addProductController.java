/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.GlassesDAO;
import dto.tblGlasses;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */
@MultipartConfig
public class addProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Lấy giá trị từ request
            String idGlasses = request.getParameter("idGlasses");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String type = request.getParameter("type");
            double price = Double.parseDouble(request.getParameter("price"));
            boolean status = true; // Mặc định là true khi tạo mới

            // Lưu hình ảnh
            String imagePath = null;
            try {
                Part part = request.getPart("image");
                // Đường dẫn lưu ảnh
                String path = request.getServletContext().getRealPath("/images");
                File dir = new File(path);
                // Nếu không có đường dẫn thì tạo ra
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File imageFile = new File(dir, part.getSubmittedFileName());
                part.write(imageFile.getAbsolutePath());
                imagePath = "images/" + imageFile.getName(); // Đường dẫn tương đối để lưu vào database
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error save image: " + e.getMessage());
            }

            // Tạo đối tượng tblGlasses
            tblGlasses glasses = new tblGlasses();
            glasses.setIdGlasses(idGlasses);
            glasses.setName(name);
            glasses.setDescription(description);
            glasses.setType(type);
            glasses.setImage(imagePath);
            glasses.setPrice(price);
            glasses.setStatus(status);

            // Tạo đối tượng DAO và gọi phương thức insertGlasses
            GlassesDAO dao = new GlassesDAO();
            HttpSession session = request.getSession();
            if (dao.getGlasses(idGlasses) != null) {
                request.setAttribute("createStatus", "ID đã tồn tại, vui lòng chọn ID khác.");
            } else {
                boolean created = dao.insertGlasses(glasses);
                if (created) {
                    request.setAttribute("updateStatus", "Tạo sản phẩm thành công!");
                } else {
                    request.setAttribute("updateStatus", "Tạo sản phẩm thất bại!");
                }
            }
            response.sendRedirect("MainController?action=viewShop");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
