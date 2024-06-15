/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.tblUsers;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
public class updateAccountController extends HttpServlet {

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
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String gmail = request.getParameter("gmail");
            String address = request.getParameter("address");
            tblUsers currentUser = (tblUsers) request.getSession().getAttribute("USER");
            UserDAO userDao = new UserDAO();
            // Kiểm tra quyền cập nhật
            boolean canUpdate = (currentUser.getUserID().equals(userID) || currentUser.getRoleID().equals("AD") && roleID.equals("US"));
            if (canUpdate) {
                tblUsers user = new tblUsers(userID, fullName, currentUser.getPassword(), roleID, gmail, address, true);
                boolean result = userDao.updateUser(user);
                if (result) {
                    request.setAttribute("updateStatus", "Cập nhật thông tin người dùng thành công.");
                } else {
                    request.setAttribute("updateStatus", "Cập nhật thông tin người dùng thất bại.");
                }
            } else {
                request.setAttribute("updateStatus", "Bạn không có quyền cập nhật thông tin người dùng này.");
            }

            request.getRequestDispatcher("MainController?action=viewAccount").forward(request, response);

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
