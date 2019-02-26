<%-- 
    Document   : user-signup
    Created on : Nov 6, 2018, 9:24:44 PM
    Author     : DELL
--%>

<%@page import="com.dao.StudentDBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="com.bean.Student"></jsp:useBean>
<jsp:setProperty name="student" property="*"></jsp:setProperty>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int status=StudentDBManager.insert(student);
            if(status==1){
                response.sendRedirect("user_panel/home.jsp");
            }else{
                out.print("<h2>Registration Failed</h2>");
                
            }
        %>
    </body>
</html>
