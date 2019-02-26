/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.Book;
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
public class StudentDBManager {
    
    public static void main(String[] args) {
        Student student=new Student();
        student.setName("Test Student");
        student.setRoll("2");
        student.setSemester("4th");
        student.setUserName("test");
        student.setPassword("123");
//        System.out.println(studentLogin("test", "123"));
System.out.println(""+getStudentByUserName("test"));
    }
    
     public static int insert(Student student) {
        int status = 0;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        try {
            String command = "INSERT INTO " + DatabaseHelper.TB_STUDENT + " ( " + DatabaseHelper.KEY_STUDENT_NAME + ", "
                    + DatabaseHelper.KEY_STUDENT_ROLL + ", "
                    + DatabaseHelper.KEY_STUDENT_SEMESTER + ", "
                    + DatabaseHelper.KEY_STUDENT_USER_NAME + ", "
                    + DatabaseHelper.KEY_STUDENT_PASSWORD
                    + ") values(?,?,?,?,?)";
            statement = connection.prepareCall(command);
            statement.setString(1, student.getName());
            statement.setString(2, student.getRoll());
            statement.setString(3, student.getSemester());
            statement.setString(4, student.getUserName());
            statement.setString(5, student.getPassword());
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
     
     public static int studentLogin(String userName, String password) {
        int status = 0;
        Connection connection = getConnection();
        PreparedStatement pst;

        try {
            String command = "select "+DatabaseHelper.KEY_STUDENT_USER_NAME+ " ,"+DatabaseHelper.KEY_STUDENT_PASSWORD
                    +" from "+DatabaseHelper.TB_STUDENT+" where "+DatabaseHelper.KEY_STUDENT_USER_NAME
                    +"=? and "+DatabaseHelper.KEY_STUDENT_PASSWORD+"=?";
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
     
     public static Student getStudentByUserName(String userName){
         Student student = new Student();
         Connection connection=getConnection();
         PreparedStatement statement=null;
         ResultSet rs=null;
         String command = "SELECT "+DatabaseHelper.KEY_STUDENT_NAME+ " FROM " +DatabaseHelper.TB_STUDENT 
                 +" WHERE "+DatabaseHelper.KEY_STUDENT_USER_NAME+ "=?";
         
        try {
            statement = connection.prepareCall(command);
            statement.setString(1, userName);
            rs = statement.executeQuery();
            while (rs.next()) {                
                student.setName(rs.getString(DatabaseHelper.KEY_STUDENT_NAME));
            }
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBManager.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (rs!=null) {
                    rs.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
         
         
         return student;      
     
     }
    
}
