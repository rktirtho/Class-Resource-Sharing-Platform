<%-- 
    Document   : third_semester
    Created on : Nov 6, 2018, 11:52:47 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.Book"%>
<%@page import="com.dao.BookDBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
    ArrayList<Book> books = BookDBManager.getAllBookOfASemester("3rd");
    request.setAttribute("books", books);
    int i=1;
%>
<style>
    table{
        width: 100%
    }
    table, tr, th, td{
        border-collapse: collapse
    }
       caption{
        font-size: 25px;
        font-weight: bolder;
        color: #1e1e1e;
        margin-bottom: 10px
    }
</style>
<table border="1">
    <caption>Third Semester</caption>
   <tr>
        <th>No</th>
        <th>File Name</th>
        <th>Subject</th>
        <th>Download</th>
    </tr>
   
    <c:forEach items="${books}" var="b">
        <tr>
            <td><%= i++%></td>
            <td>${b.getName()}</td>
            <td>${b.getAuthor()}</td>
            <td><a href="${b.getFileLocation()}" download ><i class='fa fa-download'></i></a></td>
        </tr>
       
    </c:forEach>
</table>
