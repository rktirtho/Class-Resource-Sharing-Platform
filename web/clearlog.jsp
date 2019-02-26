<%-- 
    Document   : clearlog
    Created on : Nov 8, 2018, 10:14:32 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.setAttribute("isLogin", null);
    response.sendRedirect("index.jsp");
%>
