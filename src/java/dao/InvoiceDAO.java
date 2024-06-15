/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.tblInvoice;
import dto.tblGlasses;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import mylib.DBUtils;

/**
 *
 * @author Acer
 */
public class InvoiceDAO {

    public ArrayList<tblInvoice> listInvoices() {
        ArrayList<tblInvoice> invoices = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblInvoice";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        tblInvoice invoice = new tblInvoice();
                        invoice.setInvId(table.getString("invId"));
                        invoice.setUserID(table.getString("userID"));
                        invoice.setTotal(table.getDouble("total"));
                        invoice.setDateBuy(table.getDate("dateBuy"));
                        invoice.setGmail(table.getString("gmail"));
                        invoice.setAddress(table.getString("address"));
                        invoices.add(invoice);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return invoices;
    }

    public int insertInvoice(tblInvoice newInvoice, HashMap<String, Integer> cartItems) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                cn.setAutoCommit(false);
                // Insert invoice
                String sql = "INSERT INTO tblInvoice (invId, userID, total, dateBuy, gmail, address) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newInvoice.getInvId());
                pst.setString(2, newInvoice.getUserID());
                pst.setDouble(3, newInvoice.getTotal());
                pst.setDate(4, new Date(newInvoice.getDateBuy().getTime()));
                pst.setString(5, newInvoice.getGmail());
                pst.setString(6, newInvoice.getAddress());
                result = pst.executeUpdate();
                if (result > 0) {
                    // Lấy invId vừa chèn
                    sql = "SELECT top 1 invId FROM tblInvoice ORDER BY invId DESC";
                    pst = cn.prepareStatement(sql);
                    ResultSet table = pst.executeQuery();
                    if (table != null && table.next()) {
                        String invId = table.getString("invId");
                        if (invId != null) {
                            // Insert các items vào tblCart
                            for (String glassesId : cartItems.keySet()) {
                                int quantity = cartItems.get(glassesId);
                                tblGlasses glasses = new GlassesDAO().getGlasses(glassesId);
                                double price = glasses.getPrice();
                                sql = "INSERT INTO tblCart (cartId, idGlasses, userID, invId, price, totalPrice, quantity, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                                pst = cn.prepareStatement(sql);
                                pst.setString(1, "C" + System.currentTimeMillis()); // Tạo cartId duy nhất
                                pst.setString(2, glassesId);
                                pst.setString(3, newInvoice.getUserID());
                                pst.setString(4, invId);
                                pst.setDouble(5, price);
                                pst.setDouble(6, price * quantity);
                                pst.setInt(7, quantity);
                                pst.setString(8, glasses.getImage());
                                result = pst.executeUpdate();
                            }
                        }
                    }
                }
                cn.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
// Phương thức tìm kiếm hóa đơn theo userID

    public ArrayList<tblInvoice> searchInvoicesByUserID(String userID) {
        ArrayList<tblInvoice> invoices = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblInvoice WHERE userID LIKE ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + userID + "%");
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    tblInvoice invoice = new tblInvoice();
                    invoice.setInvId(rs.getString("invId"));
                    invoice.setUserID(rs.getString("userID"));
                    invoice.setTotal(rs.getDouble("total"));
                    invoice.setDateBuy(rs.getDate("dateBuy"));
                    invoice.setGmail(rs.getString("gmail"));
                    invoice.setAddress(rs.getString("address"));
                    invoices.add(invoice);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return invoices;
    }

    public static void main(String[] args) {
        InvoiceDAO dao = new InvoiceDAO();
        System.out.println(dao.listInvoices());

        HashMap<String, Integer> cartItems = new HashMap<>();
        cartItems.put("G001", 2);
        cartItems.put("G002", 1);

        tblInvoice newInvoice = new tblInvoice();
        newInvoice.setInvId("INV004");
        newInvoice.setUserID("U003");
        newInvoice.setTotal(450.00);
        newInvoice.setDateBuy(new java.util.Date());
        newInvoice.setGmail("levanc@gmail.com");
        newInvoice.setAddress("Da Nang");

        int result = dao.insertInvoice(newInvoice, cartItems);
        System.out.println("Insert result: " + result);
    }
}
