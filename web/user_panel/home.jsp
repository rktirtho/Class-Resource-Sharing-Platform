<%-- 
    Document   : home
    Created on : Nov 6, 2018, 9:35:02 PM
    Author     : DELL
--%>

<%@page import="com.dao.StudentDBManager"%>
<%@page import="com.bean.Student"%>
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
                background-color:  #cccccc
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
            #search{
                width: 300px;
                height: 40px;
                border-radius: 10px 10px ;
                border-style: none;
                position: relative;
                margin: 10px 0px;
                background-image: url('../images/design/search.png');
                background-size: 30px;
                background-position: left;
                background-repeat:  no-repeat;
                padding-left: 35px;
                transition: 1s
            }
            #search:focus{
                width: 600px
            }
            #searchCon{
                width: 100%;
                background: #00cccc
            }
        </style>
        <%
            String userName = (String) session.getAttribute("userName");
            Student student = StudentDBManager.getStudentByUserName(userName);
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
                            <a class="navbar-brand" href="../index.jsp"><span>Class Resource </span>   Sharing Platform</a>
                        </div>
                        <div class="navbar-collapse collapse ">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href=""><%= student.getName() %></a></li>
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
                                                <li><a onclick="searchInfo('../ajax/first_semester.jsp')" >First Semester</a></li>
                                                <li><a onclick="searchInfo('../ajax/second_semester.jsp')">Second Semester</a></li>
                                                <li><a onclick="searchInfo('../ajax/third_semester.jsp')" >Third Semester</a></li>
                                                <li><a onclick="searchInfo('../ajax/fourth_semester.jsp')" >Fourth Semester</a></li>
                                                <li><a onclick="searchInfo('../ajax/fifth_semester.jsp')" >Fifth Semester</a></li>
                                                <li><a onclick="searchInfo('../ajax/sixth_semester.jsp')" >Sixth Semester</a></li>
                                                <li><a onclick="searchInfo('../ajax/seventh_semester.jsp')" >Seventh Semester</a></li>
                                                <li><a onclick="searchInfo('../ajax/eight_semester.jsp')" >Eight Semester</a></li>

                                            </ul>

                                        </nav>
                                        <main>

                                            <table id="searchCon" widht="100%" cellpadding="2">
                                                <tr>
                                                    <td align="center"><input type="search" id="search" onkeydown="searchByKey('../ajax/search.jsp?key=')"></td>
                                                </tr>
                                            </table>


                                            <hr>


                                            <div id="contentOfAjax"> 


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


        <script>


                                                        var request = new XMLHttpRequest();
                                                        function searchInfo(destinationUrl) {

                                                            var url = destinationUrl;

                                                            try {
                                                                request.onreadystatechange = function () {
                                                                    if (request.readyState == 4) {
                                                                        var val = request.responseText;
                                                                        document.getElementById('contentOfAjax').innerHTML = val;
                                                                    }
                                                                }//end of function  
                                                                request.open("GET", url, true);
                                                                request.send();
                                                            } catch (e) {
                                                                alert("Unable to connect to server");
                                                            }
                                                        }

                                                        function searchByKey(destinationUrl) {

                                                            var text = document.getElementById('search').value;
                                                            var url = destinationUrl + text;


                                                            try {
                                                                request.onreadystatechange = function () {
                                                                    if (request.readyState == 4) {
                                                                        var val = request.responseText;
                                                                        document.getElementById('contentOfAjax').innerHTML = val;
                                                                    }
                                                                }//end of function  
                                                                request.open("GET", url, true);
                                                                request.send();
                                                            } catch (e) {
                                                                alert("Unable to connect to server");
                                                            }
                                                        }

                                                        Event.observe(this, 'load', searchInfo('../ajax/first_semester.jsp'));
        </script> 
    </body>

</html>