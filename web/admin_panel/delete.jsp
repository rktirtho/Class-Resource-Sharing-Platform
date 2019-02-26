<%-- 
    Document   : delete
    Created on : Nov 7, 2018, 1:34:36 AM
    Author     : DELL
--%>

<%@page import="com.dao.BookDBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            BookDBManager.delete(id);
            response.sendRedirect("admin_home.jsp");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
