<%-- 
    Document   : search
    Created on : Nov 7, 2018, 12:04:53 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.Book"%>
<%@page import="com.dao.BookDBManager"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
    String key = request.getParameter("key");
    ArrayList<Book> books=null;
    if(key.trim()!=null || key!=null){
    books = BookDBManager.getAllBookByKeyWord(key);
    }
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
    <caption>Search Result</caption>
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
