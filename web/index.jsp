<%-- 
    Document   : index
    Created on : Nov 8, 2018, 9:32:27 AM
    Author     : DELL
--%>

<%@page import="com.dao.StudentDBManager"%>
<%@page import="com.bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Resource Home page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="" />
        <!-- css -->
        <link href="css/bootstrap1.min.css" rel="stylesheet" />
        <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
        <link href="css/jcarousel.css" rel="stylesheet" />
        <link href="css/flexslider.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />

        <!-- Theme skin -->
        <link href="skins/default.css" rel="stylesheet" />
        <%
            String isLogin = null;
            String userName = null;
            Student student = null;
            if (session.getAttribute("isLogin") != null) {
                isLogin = (String) session.getAttribute("isLogin");
                userName = (String) session.getAttribute("userName");
                student = StudentDBManager.getStudentByUserName(userName);

            }
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
                            <a class="navbar-brand" href="index.jsp"><span>Class Resource </span>   Sharing Platform</a>
                        </div>
                        <div class="navbar-collapse collapse ">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <!--components-->
                                <li><a href="visitor.jsp">Resource</a></li>        <!-- Pricing box -->
                                <li class="dropdown">
                                    <%
                                        if (isLogin != null) {
                                            if (isLogin.equals("student")) {
                                    %>
                                    <a href="user_panel/home.jsp" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><%= student.getName()%></a>
                                    <%
                                    } else if (isLogin.equals("admin")) {
                                    %>
                                    <a href="admin_panel/admin_home.jsp" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Control Panel</a>
                                    <%
                                        }
                                    %> <li><a href="clearlog.jsp">Logout</a></li> <%
                                    } else {
                                    %>
                                    <a href="login.html" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Login</a>
                                    <%}%>
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
                                    <img src="images/design/banner.jpg">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="box">
                                        <div class="box-gray aligncenter">
                                            <h4>Resource Home</h4>
                                            <div class="icon">
                                                <i class="fa fa-home fa-3x"></i>
                                            </div>

                                            <p>  Important Resource</p>


                                        </div>
                                        <div class="box-bottom">
                                            <%
                                                if (isLogin != null) {
                                                    if (isLogin.equals("student")) {
                                            %>
                                            <a href="user_panel/home.jsp">Resource Center</a>
                                            <%
                                                }else{%>
                                                <a href="admin_panel/book_registration.jsp">Add More Resource</a>
                                            <%}

                                            } else {
                                            %>
                                            <a href="login.html">Learn More</a>
                                            <%
                                                }


                                            %>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="box">
                                        <div class="box-gray aligncenter">
                                            <h4> File Hub </h4>
                                            <div class="icon">
                                                <i class="fa fa-file fa-3x"></i>
                                            </div>
                                            <p>
                                                Important File
                                            </p>

                                        </div>
                                        <div class="box-bottom">
                                            <a href="visitor.jsp">Go</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="box">
                                        <div class="box-gray aligncenter">
                                            
                                             <%
                                                if (isLogin != null) {
                                                    if (isLogin.equals("student")) {
                                            %>
                                            <h4>Account</h4>
                                            <%
                                                }else{ %>
                                            <h4>Control Panel</h4>
                                            <%}

                                            } else {
                                            %>
                                           <h4>Create Account</h4>
                                            <%
                                                }


                                            %>
                                            
                                            
                                            
                                            <div class="icon">
                                                <i class="fa fa-edit fa-3x"></i>
                                            </div>
                                            <p>
                                                condition and apply
                                            </p>

                                        </div>
                                        <div class="box-bottom">
                                            
                                            <%
                                                if (isLogin != null) {
                                                    if (isLogin.equals("student")) {
                                            %>
                                            <a href="user_panel/home.jsp">Resource Center</a>
                                            <%
                                                }else{%>
                                                <a href="admin_panel/admin_home.jsp">Control</a>
                                            <%}

                                            } else {
                                            %>
                                            <a href="signup.html">Sign up</a>
                                            <%
                                                }


                                            %>
                                            
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="box">
                                        <div class="box-gray aligncenter">
                                            <h4>Tutorial</h4>
                                            <div class="icon">
                                                <i class="fa fa-window-maximize fa-3x"></i>
                                            </div>
                                            <p>
                                                Video here
                                            </p>

                                        </div>
                                        <div class="box-bottom">
                                            <a href="">Learn more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- divider -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="solidline">
                            </div>
                        </div>
                    </div>
                    <!-- end divider -->
                    <!-- Portfolio Projects -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h4 class="heading">Recent Works</h4>
                            <div class="row">
                                <section id="projects">
                                    <ul id="thumbs" class="portfolio">
                                        <!-- Item Project and Filter Name -->
                                        <li class="col-lg-3 design" data-id="id-0" data-type="web">
                                            <div class="item-thumbs">
                                                <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                                <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 1" href="img/works/1.jpg">
                                                    <span class="overlay-img"></span>
                                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                                </a>
                                                <!-- Thumb Image and Description -->
                                                <img src="img/works/1.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                                            </div>
                                        </li>
                                        <!-- End Item Project -->
                                        <!-- Item Project and Filter Name -->
                                        <li class="item-thumbs col-lg-3 design" data-id="id-1" data-type="icon">
                                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 2" href="img/works/2.jpg">
                                                <span class="overlay-img"></span>
                                                <span class="overlay-img-thumb font-icon-plus"></span>
                                            </a>
                                            <!-- Thumb Image and Description -->
                                            <img src="img/works/2.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                                        </li>
                                        <!-- End Item Project -->
                                        <!-- Item Project and Filter Name -->
                                        <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 3" href="img/works/3.jpg">
                                                <span class="overlay-img"></span>
                                                <span class="overlay-img-thumb font-icon-plus"></span>
                                            </a>
                                            <!-- Thumb Image and Description -->
                                            <img src="img/works/3.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                                        </li>
                                        <!-- End Item Project -->
                                        <!-- Item Project and Filter Name -->
                                        <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                                            <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                                            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 4" href="img/works/4.jpg">
                                                <span class="overlay-img"></span>
                                                <span class="overlay-img-thumb font-icon-plus"></span>
                                            </a>
                                            <!-- Thumb Image and Description -->
                                            <img src="img/works/4.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                                        </li>
                                        <!-- End Item Project -->
                                    </ul>
                                </section>
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
                                <ul class="social-network">
                                    <li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
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

