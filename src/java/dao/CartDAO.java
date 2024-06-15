/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.tblCart;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Acer
 */
public class CartDAO {

    public ArrayList<tblCart> listCarts() {
        ArrayList<tblCart> carts = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblCart";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        tblCart cart = new tblCart();
                        cart.setCartId(table.getString("cartId"));
                        cart.setIdGlasses(table.getString("idGlasses"));
                        cart.setUserID(table.getString("userID"));
                        cart.setInvId(table.getString("invId"));
                        cart.setPrice(table.getDouble("price"));
                        cart.setTotalPrice(table.getDouble("totalPrice"));
                        cart.setQuantity(table.getInt("quantity"));
                        cart.setImage(table.getString("image"));
                        carts.add(cart);
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
        return carts;
    }

    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        System.out.println(dao.listCarts());
    }
}
