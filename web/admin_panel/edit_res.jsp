<%-- 
    Document   : edit_res
    Created on : Nov 7, 2018, 2:19:14 PM
    Author     : DELL
--%>
<%-- 
    Document   : book_registration
    Created on : Nov 7, 2018, 1:40:50 AM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.Book"%>
<%@page import="com.dao.BookDBManager"%>
<%@page import="com.dao.BookDBManager"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Resource Home page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="" />
        <!-- css -->
        <link href="../css/bootstrap1.min.css" rel="stylesheet" />
        <link href="../css/fancybox/jquery.fancybox.css" rel="stylesheet">
        <link href="../css/jcarousel.css" rel="stylesheet" />
        <link href="../css/flexslider.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
        <link rel="../stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

        <!-- Theme skin -->
        <link href="../skins/default.css" rel="stylesheet" />


        <style>
            th{
                background-color: #666666;
                color: #FFF;

            }
            th, td, tr{
                padding: 10px;
                font-size: 20px;
                font-weight: bold;
                text-align: center

            }
            td{
                color: #1e1e1e;
            }
            tr:nth-child(even){
                background: #FFF
            }
            table{
                background-color:  #cccccc;
                width: 100%
            }
            nav{
                background-color: #5F5F5F;
                height: 60px;
            }
            nav ul{

            }
            nav ul li{
                float: left;
                list-style: none;

            }
            nav ul li a{
                text-decoration: none;
                padding: 20px 10px;
                line-height: 60px;
                color: #fff;
                transition:  2s;
                font-weight: bold
            }
            nav ul li a:hover{
                background-color: #000;
                text-decoration: none


            }
            input[type=text],select{
                height: 30px;
                width: 80%
            }
            


        </style>

        <%
            int id=Integer.parseInt(request.getParameter("id"));
            Book book = BookDBManager.getBookById(id);
           

        %>

    </head>

    <body>
        <div id="wrapper">
            <!-- start header -->
            <header>
                <div class="navbar navbar-default navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="index.html"><span>Class Resource </span>   Sharing Platform</a>
                        </div>
                        <div class="navbar-collapse collapse ">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="../index.jsp">Home</a></li>
                                <!--components-->
                                <li><a href="visitor.jsp">Resource</a></li>        <!-- Pricing box -->
                                <li class="dropdown">

                                </li>   
                            </ul>

                        </div>
                    </div>
                </div>
            </header>
            <!-- end header -->

            <section class="callaction">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="big-cta">

                                <div class="col-lg-12">
                                    <div class="main">
                                        <nav>
                                            <ul>
                                                <li><a href="admin_home.jsp">Home</a></li>
                                                <li><a href="book_registration.jsp">Add Resource</a></li>


                                            </ul>

                                        </nav>
                                        <main>




                                            <div id="contentOfAjax"> 

                                                <form action="../update" method="POST" enctype="multipart/form-data">
                                                    <input type="hidden" value="<%= id%>" name="id">
                                                    <table border="1">
                                                        <tr>
                                                            <td colspan="2" width="50%">File Name</td>
                                                            <td colspan="2" width="50%"><input type="text" name="name" placeholder="Java How to Program" autofocus required value="<%= book.getName()%>"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" width="50%">Subject</td>
                                                            <td colspan="2" width="50%"><input type="text" name="author" placeholder="Paul Deitel" require value="<%= book.getAuthor()%>"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="25%">Select Semester</td>
                                                            <td>
                                                                <select name="semester">
                                                                    <option value="1st">First</option>
                                                                    <option value="2nd">Second</option>
                                                                    <option value="3rd">Third</option>
                                                                    <option value="4th">Fourth</option>
                                                                    <option value="5th">Fifth</option>
                                                                    <option value="6th">Sixth</option>
                                                                    <option value="7th">Seventh</option>
                                                                    <option value="8th">Eighth</option>

                                                                </select>
                                                            </td>
                                                            <td>Access Level</td>
                                                            <td>
                                                                <input type="radio" name="access_level" required="" value="Public">Public <input type="radio" name="access_level" required="" value="Protected">Protected
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="25%">Cover Image</td>
                                                            <td width="25%"><input type="file" accept="image/*" name="image"></td>
                                                            <td width="25%">File</td>
                                                            <td width="25%"><input type="file"  name="filename"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2"><input type="reset"></td>
                                                            <td colspan="2"><input type="submit" value="Update"></td>

                                                        </tr>


                                                    </table>
                                                </form>

                                            </div>

                                        </main>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="widget">
                                <h5 class="widgetheading">Get in touch with us</h5>

                                <p>
                                    <i class="icon-phone"></i> (123) 456-7890 - (123) 555-7891 <br>
                                    <i class="icon-envelope-alt"></i> faisal.wasek@gmail.com
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="widget">
                                <h5 class="widgetheading">Pages</h5>
                                <ul class="link-list">
                                    <li><a href="#">Press release</a></li>
                                    <li><a href="#">Terms and conditions</a></li>
                                    <li><a href="#">Privacy policy</a></li>
                                    <li><a href="#">Career center</a></li>
                                    <li><a href="#">Contact us</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="widget">
                                <h5 class="widgetheading">Latest posts</h5>

                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="widget">
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="sub-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="copyright">
                                    <p>&copy; Class Resource Sharing Platform All right reserved.</p>
                                    <div class="credits">
                                        <!--
All the links in the footer should remain intact.
You can delete the links only if you purchased the pro version.
Licensing information: https://bootstrapmade.com/license/
Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Moderna
                                        -->

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">

                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
        <!-- javascript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.fancybox.pack.js"></script>
        <script src="js/jquery.fancybox-media.js"></script>
        <script src="js/google-code-prettify/prettify.js"></script>
        <script src="js/portfolio/jquery.quicksand.js"></script>
        <script src="js/portfolio/setting.js"></script>
        <script src="js/jquery.flexslider.js"></script>
        <script src="js/animate.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>
