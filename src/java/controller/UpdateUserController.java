package controller;

import dao.UserDAO;
import dto.tblUsers;
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
public class UpdateUserController extends HttpServlet {

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
            HttpSession session = request.getSession();
            tblUsers user = (tblUsers) session.getAttribute("USER");
            if (user != null) {
                String userID = request.getParameter("userID");
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String oldPassword = request.getParameter("oldPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");

                // Kiểm tra dữ liệu hợp lệ
                String errorMessage = null;
                if (!oldPassword.equals(user.getPassword())) {
                    errorMessage = "Old password is incorrect.";
                } else if (newPassword != null && !newPassword.trim().isEmpty()) {
                    if (!newPassword.equals(confirmPassword)) {
                        errorMessage = "New passwords do not match.";
                    } else {
                        user.setPassword(newPassword);
                    }
                }

                UserDAO userDao = new UserDAO();
                if (userDao.isEmailExistForOtherUser(email, userID)) {
                    errorMessage = "Email already exists.";
                }

                if (errorMessage != null) {
                    request.setAttribute("ERROR", errorMessage);
                } else {
                    user.setFullName(fullName);
                    user.setGmail(email);
                    user.setAddress(address);

                    boolean success = userDao.updateUser(user);
                    if (success) {
                        session.setAttribute("USER", user);
                        request.setAttribute("SUCCESS", "Update account successful.");
                    } else {
                        request.setAttribute("ERROR", "Failed to update account. Please try again.");
                    }
                }
                request.getRequestDispatcher("MainController?action=UpdateAccount_page").forward(request, response);
            } else {
                response.sendRedirect("Login.jsp");
            }
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
