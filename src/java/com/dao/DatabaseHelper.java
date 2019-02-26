/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class DatabaseHelper {
    public static void main(String[] args) {
        getConnection();
    }
    

    private final static String DATABASE_HOST = "jdbc:mysql://localhost:3306/";
    private final static String DATABASE_NAME = "JNU_Library";
    private final static String DATABASE_USER_NAME = "root";
    private final static String DATABASE_PASSWORD = "root";
    private final static String CREATE_IF_NOT_EXISTS = "CREATE TABLE IF NOT EXISTS ";
    private final static String PRIMARY_KEY = " int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,";
    private final static String VARCHAR_NOT_NULL = " varchar(50) NOT NULL,";
    
    private final static String DATABASE_CREATE_COMMAND = "CREATE DATABASE IF NOT EXISTS " + DATABASE_NAME;
    public final static String KEY_ID="id";

    public final static String TB_ADMIN="admin";
   
    public final static String KEY_ADMIN_NAME="admin";
    public final static String KEY_ADMIN_USER_NAME="user";
    public final static String KEY_ADMIN_PASSOWOR="password";
    private final static String TABLE_CREATION_COMMAND_ADMIN = CREATE_IF_NOT_EXISTS+TB_ADMIN+" ("
            + "  "+KEY_ID+PRIMARY_KEY
            + "  "+KEY_ADMIN_NAME+VARCHAR_NOT_NULL
            + "  "+KEY_ADMIN_USER_NAME+VARCHAR_NOT_NULL
            + "  "+KEY_ADMIN_PASSOWOR+" varchar(20) NOT NULL"
            + ") ";
    
    
    public final static String TB_STUDENT="student"; 
    public final static String KEY_STUDENT_NAME="name"; 
    public final static String KEY_STUDENT_ROLL="roll"; 
    public final static String KEY_STUDENT_SEMESTER="semester"; 
    public final static String KEY_STUDENT_USER_NAME="user_name"; 
    public final static String KEY_STUDENT_PASSWORD="password"; 
    
    private final static String TABLE_CREATION_COMMAND_STUDENT=CREATE_IF_NOT_EXISTS+TB_STUDENT+" ("
            +" "+KEY_ID+PRIMARY_KEY
            +" "+KEY_STUDENT_NAME+VARCHAR_NOT_NULL
            +" "+KEY_STUDENT_ROLL+VARCHAR_NOT_NULL
            +" "+KEY_STUDENT_SEMESTER+VARCHAR_NOT_NULL
            +" "+KEY_STUDENT_USER_NAME+VARCHAR_NOT_NULL
            +" "+KEY_STUDENT_PASSWORD+" varchar(20) NOT NULL"
            +") ";
    
    
    
    
    public final static String TB_BOOK="books";
     public final static String KEY_BOOK_NAME="name";
     public final static String KEY_BOOK_AUTHOR="author";
     public final static String KEY_BOOK_SEMESTER="semester";
     public final static String KEY_BOOK_ACCESS_LAVEL="access_level";
     public final static String KEY_BOOK_IMAGE="image_location";
     public final static String KEY_BOOK_FILE_LOCATION="file";
     
     private final static String TABLE_CREATION_COMMAND_BOOK=CREATE_IF_NOT_EXISTS+TB_BOOK+" ("
            +" "+KEY_ID+PRIMARY_KEY
            +" "+KEY_BOOK_NAME+VARCHAR_NOT_NULL
            +" "+KEY_BOOK_AUTHOR+VARCHAR_NOT_NULL
            +" "+KEY_BOOK_SEMESTER+VARCHAR_NOT_NULL
            +" "+KEY_BOOK_ACCESS_LAVEL+VARCHAR_NOT_NULL
            +" "+KEY_BOOK_IMAGE+" varchar(200) NOT NULL,"
            +" "+KEY_BOOK_FILE_LOCATION+" varchar(200) NOT NULL"
            +") ";
       
    
        
    
    
     public static Connection getConnection(){
        Connection connection=null;
        Statement statement=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
           connection = DriverManager.getConnection(DATABASE_HOST,
                    DATABASE_USER_NAME, DATABASE_PASSWORD);
           
            statement = connection.createStatement();

            statement.executeUpdate(DATABASE_CREATE_COMMAND);

            connection = DriverManager.getConnection(DATABASE_HOST + DATABASE_NAME,
                    DATABASE_USER_NAME, DATABASE_PASSWORD);
            statement = connection.createStatement();
            
            statement.executeUpdate(TABLE_CREATION_COMMAND_ADMIN);
            statement.executeUpdate(TABLE_CREATION_COMMAND_STUDENT);
            statement.executeUpdate(TABLE_CREATION_COMMAND_BOOK);
            
            
            
            
           
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        
        return connection;
    }

}
