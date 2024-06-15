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
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class addProductToCartController extends HttpServlet {

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
        GlassesDAO d = new GlassesDAO();
        try (PrintWriter out = response.getWriter()) {
            String itemid = request.getParameter("txtItemId");
            HttpSession session = request.getSession();

            // Debugging: Check the type of the 'cart' session attribute
            Object cartObj = session.getAttribute("cart");
            if (cartObj != null) {
                out.println("Cart type: " + cartObj.getClass().getName());
            }

            HashMap<tblGlasses, Integer> giohang;
            if (cartObj == null) {
                giohang = new HashMap<>();
            } else if (cartObj instanceof HashMap<?, ?>) {
                giohang = (HashMap<tblGlasses, Integer>) cartObj;
            } else {
                throw new ServletException("Invalid cart type in session.");
            }

            tblGlasses FoundItem = null;
            for (tblGlasses it : giohang.keySet()) {
                if (it.getIdGlasses().equals(itemid.trim())) {
                    FoundItem = it;
                    break;
                }
            }

            if (FoundItem != null) {
                int quantity = giohang.get(FoundItem);
                quantity++;
                giohang.put(FoundItem, quantity);
            } else {
                // lay item trong db dua vao itemid
                tblGlasses item = d.getGlasses(itemid);
                if (item != null) {
                    giohang.put(item, 1);
                }
            }

            // 3. luu gio hang vao session memory
            session.setAttribute("cart", giohang);
            // 4. mo trang ke tiep
            request.setAttribute("updateStatus", "Thêm đơn hàng thành công!");
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
