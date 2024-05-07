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
import model.Products;
import model.Users;

/**
 *
 * @author badao
 */
public class DAOUsers extends DBContext {
  
    //get User by username and password
    public Users Login(String user, String pass) {
        String sql = "  select * from Users\n"
                + "  where [username] = ? and [password] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("Role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //insert a new User
    public void insert(int userid, String name, String pass) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([UserID]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[Role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userid);
            pre.setString(2, name);
            pre.setString(3, pass);
            pre.setInt(4, 1);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Check duplicate Users
    public Users checkUsers(String user) {
        String sql = "  select * from Users\n"
                + "  where [username] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("Role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
// get id last
    public int getLastId() {
        String sql = "select top 1  * from Users\n"
                + "order by UserID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int number = rs.getInt("UserID");
                return number;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    //get Users by name
    public int getIDByName(String name) {
        String sql = "select UserID from Users where Username like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("UserID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    //get all Users in DB
    public List<Users> getAllUsersByRole() {
        String sql = "select * from Users where Role = 0";
        List<Users> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("Role"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //admin delete account user
    public void deleteUser(int id) {
        String sql = "DELETE FROM [dbo].[Users]\n"
                + "      WHERE UserID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //insert a new User with role admin or user
    public void insertUser(int userid, String name, String pass, int role) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([UserID]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[Role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userid);
            pre.setString(2, name);
            pre.setString(3, pass);
            pre.setInt(4, role);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //get Users by id
    public Users getUserByID(int id) {
        String sql = "  select * from Users\n"
                + "  where [UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("Role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //update role for user
    public void updateRole(int role, int id) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [Role] = ?\n"
                + " WHERE UserID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role);
            st.setInt(2, id);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //change password user
    public void change(String pass, String user) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [Password] = ?\n"
                + " WHERE [Username]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, user);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //get total Users
    public int getTotalUsers() {
        String sql = "select COUNT(*) from Users where Role=0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int number = rs.getInt(1);
                return number;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    //get next 18 Users with wole = 0
    public List<Users> getUsersOffFetch(int index) {
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users where Role=0 order by UserID offset ? rows fetch next 18 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index-1)*18);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("Role"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //get name Users by id
    public Users getNameUserByID(int id) {
        String sql = " select Username from Users\n"
                + "  where [UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("Role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        DAOUsers dao = new DAOUsers();
        
    }
}
