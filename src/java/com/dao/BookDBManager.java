/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.Book;
import static com.dao.DatabaseHelper.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class BookDBManager {

    public static void main(String[] args) {
        Book book = new Book();
        book.setId(1);
        book.setName("Digital System");
        book.setAuthor("Lipson");
        book.setSemester("4nd");
        book.setAccessLavel("Protected");
        book.setImage("images/bosoks/1.jpg");
        book.setFileLocation("images/books/1.jpg");
       // System.out.println("Insert "+BookDBManager.getAllBookOfASemester("6th"));
        System.out.println("Insert "+update(book));
        System.out.println("Searct "+getAllBook());
    }

    public static int insert(Book book) {
        int status = 0;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        try {
            String command = "INSERT INTO " + DatabaseHelper.TB_BOOK + " ( " + DatabaseHelper.KEY_BOOK_NAME + ", "
                    + DatabaseHelper.KEY_BOOK_AUTHOR + ", "
                    + DatabaseHelper.KEY_BOOK_SEMESTER + ", "
                    + DatabaseHelper.KEY_BOOK_ACCESS_LAVEL + ", "
                    + DatabaseHelper.KEY_BOOK_IMAGE + ", "
                    + DatabaseHelper.KEY_BOOK_FILE_LOCATION 
                    + ") values(?,?,?,?,?,?)";
            statement = connection.prepareCall(command);
            statement.setString(1, book.getName());
            statement.setString(2, book.getAuthor());
            statement.setString(3, book.getSemester());
            statement.setString(4, book.getAccessLavel());
            statement.setString(5, book.getImage());
            statement.setString(6, book.getFileLocation());
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

     public static int update(Book book) {
        int status = 0;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        try {
            String command = "UPDATE " + DatabaseHelper.TB_BOOK + " SET " + DatabaseHelper.KEY_BOOK_NAME + " =?, "
                    + DatabaseHelper.KEY_BOOK_AUTHOR + "=?, "
                    + DatabaseHelper.KEY_BOOK_SEMESTER + "=?, "
                    + DatabaseHelper.KEY_BOOK_ACCESS_LAVEL + "=?, "
                    + DatabaseHelper.KEY_BOOK_IMAGE + "=?, "
                    + DatabaseHelper.KEY_BOOK_FILE_LOCATION 
                    + "=? WHERE id=?";
            statement = connection.prepareCall(command);
            statement.setString(1, book.getName());
            statement.setString(2, book.getAuthor());
            statement.setString(3, book.getSemester());
            statement.setString(4, book.getAccessLavel());
            statement.setString(5, book.getImage());
            statement.setString(6, book.getFileLocation());
            statement.setInt(7, book.getId());
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

    
    public static ArrayList<Book> getAllBook() {
        ArrayList<Book> books = new ArrayList<>();
        PreparedStatement statement = null;
        Connection connection = getConnection();
        ResultSet rs = null;
        String command = "select * from " + DatabaseHelper.TB_BOOK;

        try {
            statement = connection.prepareStatement(command);
            rs = statement.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt(DatabaseHelper.KEY_ID));
                book.setName(rs.getString(DatabaseHelper.KEY_BOOK_NAME));
                book.setAuthor(rs.getString(DatabaseHelper.KEY_BOOK_AUTHOR));
                book.setSemester(rs.getString(DatabaseHelper.KEY_BOOK_SEMESTER));
                book.setAccessLavel(rs.getString(DatabaseHelper.KEY_BOOK_ACCESS_LAVEL));
                book.setImage(rs.getString(DatabaseHelper.KEY_BOOK_IMAGE));
                book.setFileLocation(rs.getString(DatabaseHelper.KEY_BOOK_FILE_LOCATION));
                books.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return books;
    }
    
      public static ArrayList<Book> getAllBookForVisitor() {
        ArrayList<Book> books = new ArrayList<>();
        PreparedStatement statement = null;
        Connection connection = getConnection();
        ResultSet rs = null;
        String command = "select * from " + DatabaseHelper.TB_BOOK +" WHERE "+DatabaseHelper.KEY_BOOK_ACCESS_LAVEL+" =?";
        

        try {
            statement = connection.prepareStatement(command);
            statement.setString(1, "Public");
            rs = statement.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt(DatabaseHelper.KEY_ID));
                book.setName(rs.getString(DatabaseHelper.KEY_BOOK_NAME));
                book.setAuthor(rs.getString(DatabaseHelper.KEY_BOOK_AUTHOR));
                book.setSemester(rs.getString(DatabaseHelper.KEY_BOOK_SEMESTER));
                book.setAccessLavel(rs.getString(DatabaseHelper.KEY_BOOK_ACCESS_LAVEL));
                book.setImage(rs.getString(DatabaseHelper.KEY_BOOK_IMAGE));
                book.setFileLocation(rs.getString(DatabaseHelper.KEY_BOOK_FILE_LOCATION));
                books.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return books;
    }
    
     public static ArrayList<Book> getAllBookOfASemester(String semester) {
        ArrayList<Book> books = new ArrayList<>();
        PreparedStatement statement = null;
        Connection connection = getConnection();
        ResultSet rs = null;
        String command = "select * from " + DatabaseHelper.TB_BOOK+" WHERE "+ DatabaseHelper.KEY_BOOK_SEMESTER+" =?";
        

        try {
            statement = connection.prepareStatement(command);
            statement.setString(1, semester);
            rs = statement.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt(DatabaseHelper.KEY_ID));
                book.setName(rs.getString(DatabaseHelper.KEY_BOOK_NAME));
                book.setAuthor(rs.getString(DatabaseHelper.KEY_BOOK_AUTHOR));
                book.setSemester(rs.getString(DatabaseHelper.KEY_BOOK_SEMESTER));
                book.setAccessLavel(rs.getString(DatabaseHelper.KEY_BOOK_ACCESS_LAVEL));
                book.setImage(rs.getString(DatabaseHelper.KEY_BOOK_IMAGE));
                book.setFileLocation(rs.getString(DatabaseHelper.KEY_BOOK_FILE_LOCATION));
                books.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(connection!=null)
                connection.close();
                if(statement!=null)
                statement.close();
                if(rs!=null)
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return books;
    }
     
     
       public static Book getBookById(int id) {
       Book book=new Book();
        PreparedStatement statement = null;
        Connection connection = getConnection();
        ResultSet rs = null;
        String command = "select * from " + DatabaseHelper.TB_BOOK+" WHERE "+ DatabaseHelper.KEY_ID+" =?";
        
        try {
            statement = connection.prepareStatement(command);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            while (rs.next()) {
                book.setId(rs.getInt(DatabaseHelper.KEY_ID));
                book.setName(rs.getString(DatabaseHelper.KEY_BOOK_NAME));
                book.setAuthor(rs.getString(DatabaseHelper.KEY_BOOK_AUTHOR));
                book.setSemester(rs.getString(DatabaseHelper.KEY_BOOK_SEMESTER));
                book.setAccessLavel(rs.getString(DatabaseHelper.KEY_BOOK_ACCESS_LAVEL));
                book.setImage(rs.getString(DatabaseHelper.KEY_BOOK_IMAGE));
                book.setFileLocation(rs.getString(DatabaseHelper.KEY_BOOK_FILE_LOCATION));
                
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(connection!=null)
                connection.close();
                if(statement!=null)
                statement.close();
                if(rs!=null)
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return book;
    }

    public static ArrayList<Book> getAllBookByKeyWord(String key) {
        ArrayList<Book> books = new ArrayList<>();
        PreparedStatement statement = null;
        Connection connection = getConnection();
        ResultSet rs = null;
        String command = "select * from " + DatabaseHelper.TB_BOOK + " where " + DatabaseHelper.KEY_BOOK_NAME + "  like \"%" + key + "%\" OR " + DatabaseHelper.KEY_BOOK_AUTHOR + "  like \"%" + key + "%\"";

        try {
            statement = connection.prepareStatement(command);
            rs = statement.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt(DatabaseHelper.KEY_ID));
                book.setName(rs.getString(DatabaseHelper.KEY_BOOK_NAME));
                book.setAuthor(rs.getString(DatabaseHelper.KEY_BOOK_AUTHOR));
                book.setSemester(rs.getString(DatabaseHelper.KEY_BOOK_SEMESTER));
                book.setAccessLavel(rs.getString(DatabaseHelper.KEY_BOOK_ACCESS_LAVEL));
                book.setImage(rs.getString(DatabaseHelper.KEY_BOOK_IMAGE));
                book.setFileLocation(rs.getString(DatabaseHelper.KEY_BOOK_FILE_LOCATION));
                books.add(book);
            }

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
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(BookDBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return books;
    }

    public static int delete(int id) {
        int status = 0;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        try {
            statement = connection.prepareCall("DELETE FROM books WHERE id=" + id);
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

}
