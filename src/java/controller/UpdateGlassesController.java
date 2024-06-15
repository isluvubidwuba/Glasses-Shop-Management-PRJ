/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.GlassesDAO;
import dto.tblGlasses;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class UpdateGlassesController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Lấy giá trị từ request
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String type = request.getParameter("type");
            String priceStr = request.getParameter("price");
            int status = Integer.parseInt(request.getParameter("status"));
            double price = Double.parseDouble(priceStr);

            // Gọi phương thức getGlasses để lấy đối tượng tblGlasses
            GlassesDAO dao = new GlassesDAO();
            tblGlasses glasses = dao.getGlasses(id);

            // Cập nhật các giá trị mới vào đối tượng tblGlasses
            glasses.setName(name);
            glasses.setDescription(description);
            glasses.setType(type);
            glasses.setPrice(price);
            glasses.setStatus(status == 1 ? true : false);
            // Gọi phương thức updateGlasses để cập nhật đối tượng trong cơ sở dữ liệu
            boolean updated = dao.updateGlasses(glasses);
            if (updated) {
                request.setAttribute("updateStatus", "Cập nhật sản phẩm thành công!");
            } else {
                request.setAttribute("updateStatus", "Cập nhật sản phẩm thất bại!");
            }
            request.getRequestDispatcher("MainController?action=viewShop").forward(request, response);


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
