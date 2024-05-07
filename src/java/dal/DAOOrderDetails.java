/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Products;

/**
 *
 * @author badao
 */
public class DAOOrderDetails extends DBContext {

    //get id Product have count max
    public int getProducIdByOrderDetails() {
        String sql = "select ProductID from OrderDetails\n"
                + "group by ProductID\n"
                + "order by COUNT(Quantity) desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int number = rs.getInt("ProductID");
                return number;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    //Insert new Orderdetails
    public void insertOrderDetails(int orderid, int productid, int quantity) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([OrderID]\n"
                + "           ,[ProductID]\n"
                + "           ,[Quantity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderid);
            st.setInt(2, productid);
            st.setInt(3, quantity);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //get Top 5 best selling products
    public List<Integer> getTop5() {
        List<Integer> list = new ArrayList();
        String sql = "select top 5 ProductID from OrderDetails\n"
                + "group by ProductID\n"
                + "order by COUNT(Quantity) desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int number = rs.getInt("ProductID");
                list.add(number);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //get quantity Top 5 best selling products
    public List<Integer> getQuantityTop5() {
        List<Integer> list = new ArrayList();
        String sql = "select top 5 COUNT(Quantity) from OrderDetails\n"
                + "group by ProductID\n"
                + "order by COUNT(Quantity) desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int number = rs.getInt("");
                list.add(number);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        DAOOrderDetails dao = new DAOOrderDetails();
        List<Integer> list = dao.getQuantityTop5();
        for (Integer integer : list) {
            System.out.println(integer);
        }
    }
}
