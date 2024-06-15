/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.tblGlasses;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @authot Acer
 */
public class GlassesDAO {

    public ArrayList<tblGlasses> listGlasses() {
        ArrayList<tblGlasses> glassesList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblGlasses";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        tblGlasses glasses = new tblGlasses();
                        glasses.setIdGlasses(table.getString("idGlasses"));
                        glasses.setName(table.getString("name"));
                        glasses.setDescription(table.getString("description"));
                        glasses.setType(table.getString("type"));
                        glasses.setImage(table.getString("image"));
                        glasses.setPrice(table.getDouble("price"));
                        glasses.setStatus(table.getBoolean("status"));
                        glassesList.add(glasses);
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
        return glassesList;
    }
    public ArrayList<tblGlasses> listGlassesForUs() {
        ArrayList<tblGlasses> glassesList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblGlasses where status = 1";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        tblGlasses glasses = new tblGlasses();
                        glasses.setIdGlasses(table.getString("idGlasses"));
                        glasses.setName(table.getString("name"));
                        glasses.setDescription(table.getString("description"));
                        glasses.setType(table.getString("type"));
                        glasses.setImage(table.getString("image"));
                        glasses.setPrice(table.getDouble("price"));
                        glasses.setStatus(table.getBoolean("status"));
                        glassesList.add(glasses);
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
        return glassesList;
    }

    // Phương thức lấy thông tin kính theo idGlasses
    public tblGlasses getGlasses(String idGlasses) {
        tblGlasses glasses = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblGlasses WHERE idGlasses = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, idGlasses);
                ResultSet table = pst.executeQuery();
                if (table != null && table.next()) {
                    glasses = new tblGlasses();
                    glasses.setIdGlasses(table.getString("idGlasses"));
                    glasses.setName(table.getString("name"));
                    glasses.setDescription(table.getString("description"));
                    glasses.setType(table.getString("type"));
                    glasses.setImage(table.getString("image"));
                    glasses.setPrice(table.getDouble("price"));
                    glasses.setStatus(table.getBoolean("status"));
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
        return glasses;
    }
// Thêm phương thức searchByCategory

    public ArrayList<tblGlasses> searchByCategory(String category) {
        ArrayList<tblGlasses> glassesList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblGlasses WHERE type = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, category);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    tblGlasses glasses = new tblGlasses();
                    glasses.setIdGlasses(rs.getString("idGlasses"));
                    glasses.setName(rs.getString("name"));
                    glasses.setDescription(rs.getString("description"));
                    glasses.setType(rs.getString("type"));
                    glasses.setImage(rs.getString("image"));
                    glasses.setPrice(rs.getDouble("price"));
                    glasses.setStatus(rs.getBoolean("status"));
                    glassesList.add(glasses);
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
        return glassesList;
    }
    public ArrayList<tblGlasses> searchByCategoryUS(String category) {
        ArrayList<tblGlasses> glassesList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblGlasses WHERE type = ? and status = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, category);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    tblGlasses glasses = new tblGlasses();
                    glasses.setIdGlasses(rs.getString("idGlasses"));
                    glasses.setName(rs.getString("name"));
                    glasses.setDescription(rs.getString("description"));
                    glasses.setType(rs.getString("type"));
                    glasses.setImage(rs.getString("image"));
                    glasses.setPrice(rs.getDouble("price"));
                    glasses.setStatus(rs.getBoolean("status"));
                    glassesList.add(glasses);
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
        return glassesList;
    }

    
    
    public static void main(String[] args) {
        GlassesDAO dao = new GlassesDAO();
        System.out.println(dao.listGlasses());
    }

    // Thêm phương thức searchByPriceRange
    public ArrayList<tblGlasses> searchByPriceRange(double minPrice, double maxPrice) {
        ArrayList<tblGlasses> glassesList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblGlasses WHERE price BETWEEN ? AND ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setDouble(1, minPrice);
                pst.setDouble(2, maxPrice);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    tblGlasses glasses = new tblGlasses();
                    glasses.setIdGlasses(rs.getString("idGlasses"));
                    glasses.setName(rs.getString("name"));
                    glasses.setDescription(rs.getString("description"));
                    glasses.setType(rs.getString("type"));
                    glasses.setImage(rs.getString("image"));
                    glasses.setPrice(rs.getDouble("price"));
                    glasses.setStatus(rs.getBoolean("status"));
                    glassesList.add(glasses);
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
        return glassesList;
    }
    public ArrayList<tblGlasses> searchByPriceRangeUS(double minPrice, double maxPrice) {
        ArrayList<tblGlasses> glassesList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM tblGlasses WHERE price BETWEEN ? AND ? AND status = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setDouble(1, minPrice);
                pst.setDouble(2, maxPrice);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    tblGlasses glasses = new tblGlasses();
                    glasses.setIdGlasses(rs.getString("idGlasses"));
                    glasses.setName(rs.getString("name"));
                    glasses.setDescription(rs.getString("description"));
                    glasses.setType(rs.getString("type"));
                    glasses.setImage(rs.getString("image"));
                    glasses.setPrice(rs.getDouble("price"));
                    glasses.setStatus(rs.getBoolean("status"));
                    glassesList.add(glasses);
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
        return glassesList;
    }
// Thêm phương thức deleteGlasses

    public boolean deleteGlasses(String idGlasses) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE tblGlasses SET status = 0 WHERE idGlasses = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, idGlasses);
                result = pst.executeUpdate() > 0;
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
    // Thêm phương thức insertGlasses

    public boolean insertGlasses(tblGlasses glasses) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO tblGlasses (idGlasses, name, description, type, image, price, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, glasses.getIdGlasses());
                pst.setString(2, glasses.getName());
                pst.setString(3, glasses.getDescription());
                pst.setString(4, glasses.getType());
                pst.setString(5, glasses.getImage());
                pst.setDouble(6, glasses.getPrice());
                pst.setBoolean(7, glasses.isStatus());
                result = pst.executeUpdate() > 0;
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

    public boolean updateGlasses(tblGlasses glasses) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE tblGlasses SET name = ?, description = ?, type = ?, image = ?, price = ?, status = ? WHERE idGlasses = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, glasses.getName());
                pst.setString(2, glasses.getDescription());
                pst.setString(3, glasses.getType());
                pst.setString(4, glasses.getImage());
                pst.setDouble(5, glasses.getPrice());
                pst.setBoolean(6, glasses.isStatus());
                pst.setString(7, glasses.getIdGlasses());
                result = pst.executeUpdate() > 0;
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
}
