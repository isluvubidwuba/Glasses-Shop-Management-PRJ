/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.InvoiceDAO;
import dto.tblGlasses;
import dto.tblInvoice;
import dto.tblUsers;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class createInvoiceController extends HttpServlet {

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
            String invoiceId = (String) session.getAttribute("invoiceId");
            Date dateBuy = new Date();
            HashMap<tblGlasses, Integer> cart = (HashMap<tblGlasses, Integer>) session.getAttribute("cart");
            // Tính tổng tiền
            double total = 0;
            for (Map.Entry<tblGlasses, Integer> entry : cart.entrySet()) {
                tblGlasses item = entry.getKey();
                int quantity = entry.getValue();
                total += item.getPrice() * quantity;
            }
            tblInvoice newInvoice = new tblInvoice();
            newInvoice.setInvId(invoiceId);
            newInvoice.setUserID(user.getUserID());
            newInvoice.setDateBuy(new java.sql.Date(dateBuy.getTime()));
            newInvoice.setGmail(user.getGmail());
            newInvoice.setAddress(user.getAddress());
            newInvoice.setTotal(total);
            // Chuyển đổi giỏ hàng thành HashMap<String, Integer> để truyền vào phương thức insertInvoice
            HashMap<String, Integer> cartItems = new HashMap<>();
            for (tblGlasses item : cart.keySet()) {
                cartItems.put(item.getIdGlasses(), cart.get(item));
            }
            // Gọi phương thức insertInvoice từ InvoiceDAO
            InvoiceDAO invoiceDAO = new InvoiceDAO();
            int result = invoiceDAO.insertInvoice(newInvoice, cartItems);
            System.out.println("Hanh Hanh Hanh" + result);
            if (result > 0) {
                request.setAttribute("message", "success");
                session.removeAttribute("cart"); // Xóa giỏ hàng khỏi session
                session.removeAttribute("invoiceId"); // Xóa invoiceId khỏi session
                request.setAttribute("updateStatus", "Tạo đơn hàng thành công!");

            } else {
                request.setAttribute("updateStatus", "Tạo đơn hàng thất bại !");
                request.setAttribute("message", "error");
            }

            request.getRequestDispatcher("MainController?action=thankYouPage").forward(request, response);
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
