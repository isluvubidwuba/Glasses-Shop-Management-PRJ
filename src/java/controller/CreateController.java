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
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
public class CreateController extends HttpServlet {

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
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            // Kiểm tra dữ liệu hợp lệ
            String errorMessage = null;
            if (userID == null || fullName == null || email == null || address == null || password == null || confirmPassword == null
                    || userID.trim().isEmpty() || fullName.trim().isEmpty() || email.trim().isEmpty() || address.trim().isEmpty() || password.trim().isEmpty() || confirmPassword.trim().isEmpty()) {
                errorMessage = "All fields are required.";
            } else if (!password.equals(confirmPassword)) {
                errorMessage = "Passwords do not match.";
            } else if (!isValidEmail(email)) {
                errorMessage = "Invalid email format.";
            } else {
                UserDAO userDao = new UserDAO();
                if (userDao.isUserIDExist(userID)) {
                    errorMessage = "User ID already exists.";
                } else if (userDao.isEmailExist(email)) {
                    errorMessage = "Email already exists.";
                }
            }

            if (errorMessage != null) {
                request.setAttribute("ERROR", errorMessage);
                request.getRequestDispatcher("MainController?action=Register_page").forward(request, response);
            } else {
                // Thực hiện đăng ký tài khoản mới
                UserDAO userDao = new UserDAO();
                tblUsers user = new tblUsers(userID, fullName, password, "R1", email, address, true);
                boolean success = userDao.insertUser(user);
                if (success) {
                    request.getRequestDispatcher("MainController?action=Login_page").forward(request, response);
                    // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
                } else {
                    request.setAttribute("ERROR", "Failed to create account. Please try again.");
                    request.getRequestDispatcher("MainController?action=Login_page").forward(request, response);

                }
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
    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pat = Pattern.compile(emailRegex);
        if (email == null) {
            return false;
        }
        return pat.matcher(email).matches();

    }

}
