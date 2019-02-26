<%-- 
    Document   : logincheck
    Created on : Nov 7, 2018, 12:49:16 AM
    Author     : DELL
--%>

<%@page import="com.dao.AdminDBManager"%>
<%@page import="com.dao.StudentDBManager"%>
<%@page import="com.dao.DatabaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
          String userName=request.getParameter("userName");
          String password=request.getParameter("password");
          if(userName!=null && password !=null){
              
              if(userName.equals("admin")){
                   out.print(userName);
                  int status=AdminDBManager.login(userName, password);
                  
                  if(status == 1){
                      session.setAttribute("isLogin", "admin");
                  response.sendRedirect("admin_panel/admin_home.jsp");
                  }
                  
              }else{
                  int status=StudentDBManager.studentLogin(userName, password);
                  if(status==1){
                       session.setAttribute("userName", userName);
                       session.setAttribute("isLogin", "student");
                  response.sendRedirect("user_panel/home.jsp");
                  }
              
              }
          
          }else{
              response.sendRedirect("index.jsp");
          
          }
          
      %>
      <h2>Login Failed</h2>
      <hr>
      <a href="index.html">Try Again</a>
    </body>
</html>
