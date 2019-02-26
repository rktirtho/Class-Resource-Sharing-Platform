/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.Admin;
import com.bean.Student;
import static com.dao.DatabaseHelper.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class AdminDBManager {
    public static void main(String[] args) {
        Admin admin=new Admin();
        admin.setName("Test");
        admin.setUserName("admin");
        admin.setPassword("123");
        makeAdmin(admin);
        System.out.println(""+login("admin", "123"));
    }
    
     public static int makeAdmin(Admin admin) {
        int status = 0;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        try {
            String command = "INSERT INTO " + DatabaseHelper.TB_ADMIN + " ( " + DatabaseHelper.KEY_ADMIN_NAME + ", "
                    + DatabaseHelper.KEY_ADMIN_USER_NAME + ", "
                    + DatabaseHelper.KEY_ADMIN_PASSOWOR 
                    + ") values(?,?,?)";
            statement = connection.prepareCall(command);
            statement.setString(1, admin.getName());
            statement.setString(2, admin.getUserName());
            statement.setString(3, admin.getPassword());
            status = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return status;
    }
    
    
    public static int login(String userName, String password) {
        int status = 0;
        Connection connection = getConnection();
        PreparedStatement pst;

        try {
            String command = "select "+DatabaseHelper.KEY_ADMIN_USER_NAME+ " ,"+DatabaseHelper.KEY_ADMIN_PASSOWOR
                    +" from "+DatabaseHelper.TB_ADMIN+" where "+DatabaseHelper.KEY_ADMIN_USER_NAME
                    +"=? and "+DatabaseHelper.KEY_ADMIN_PASSOWOR+"=?";
            pst = connection.prepareStatement(command);

            pst.setString(1, userName);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                status = 1;
                System.out.println("Valid login credentials");
            } else {
                System.out.println("Invalid login credentials");
            }

        } catch (Exception ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return status;
    }
    
    
}
