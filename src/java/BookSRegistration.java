/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.bean.Book;
import com.dao.BookDBManager;
import com.dao.DatabaseHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

/**
 *
 * @author DELL
 */
public class BookSRegistration extends HttpServlet {

    Book book = new Book();

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");

            String savePath = "F:\\Projrct\\Web Design\\CSE Library (Jagannath University)\\web\\books";
            String savePathImage = "F:\\Projrct\\Web Design\\CSE Library (Jagannath University)\\web\\images\\books";

            // File file=new File(savePath);
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            Part part = request.getPart("filename");
            Part part1=request.getPart("image");

            String fileName = extractFileName(part);
            book.setName(request.getParameter("name"));
            book.setAuthor(request.getParameter("author"));
            book.setSemester(request.getParameter("semester"));
            book.setAccessLavel(request.getParameter("access_level"));
            String imageName = book.getName().replace(" ", "_") +"_BY_"+ book.getAuthor().replace(" ", "_") + ".jpg";
            String documentName = book.getName().replace(" ", "_") + book.getAuthor().replace(" ", "_")+part.getSubmittedFileName();
            book.setImage("images/books/" + imageName);
            book.setFileLocation("../books/"+documentName);

            if (!part.getSubmittedFileName().equals("")) {

                part.write(savePath + File.separator + documentName);
                part.write(savePathImage + File.separator + imageName);

            }

            out.println("<title>Servlet MedicinesRegister</title>");

            int status = BookDBManager.insert(book);

            out.println("</head>");
            out.println("<body>");
            out.println("<p>"+part.getSubmittedFileName()+"</p>");
            if (status > 0) {
                if (status == 1) {
                    out.println("<h3>Entry Success</h3>");
                } else {
                    out.println("<h3>Updated</h3>");
                }

            } else {
                out.println("<h3>Failled</h3>");
            }

            out.println("<a href=\"medicine-registration\"><h3>Go Back</h3></a>");

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

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
