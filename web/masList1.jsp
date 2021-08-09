<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.lokasi, project.DBConnection"%>
<jsp:useBean id="lokDao" class="project.lokasiDAO" scope="request"/>
<!DOCTYPE HTML>

<html>
    <head>
        <link rel="icon" href="/FridayPrayer/images/fpci.jpg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Rekod masjid berdaftar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Free HTML5 Website Template by GetTemplates.co" />
        <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
        <meta name="author" content="GetTemplates.co" />

        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Themify Icons-->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css">

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.css">

        <!-- Bootstrap DateTimePicker -->
        <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">



        <!-- Owl Carousel  -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->
        <script src="https://kit.fontawesome.com/889366029b.js" crossorigin="anonymous"></script>

    </head>
    <%
        String Daerah = request.getParameter("daerah");
        String Mukim = request.getParameter("mukim");

        List<lokasi> locAll = lokDao.retrieveLoc(Daerah, Mukim);
        DBConnection database = new DBConnection();
        database.closeConnection();
    %>
    <body>

        <div class="gtco-loader"></div>

        <div id="page">


            <!-- <div class="page-inner"> -->
            <nav class="gtco-nav" role="navigation">
                <div class="gtco-container">

                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <div id="gtco-logo"><a href="addLocation.jsp"><i style="font-size: 40px;" class="fas fa-arrow-circle-left"></i></a></div>
                        </div>
                        <div class="col-xs-8 text-right menu-1">
                            <ul>

                                <li class="btn-cta"><a href="logout.jsp"><span>Log Keluar</span></a></li>
                            </ul>	
                        </div>
                    </div>

                </div>
            </nav>

            <header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/p1.jpg)" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-12 col-md-offset-0 text-center">


                            <div class="row row-mt-15em">
                                <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                                    <h1 class="cursive-font">Senarai Masjid Berdaftar!</h1>	
                                    <a href="addLocation.jsp"><button class="btn btn-primary">Tambah Lokasi Masjid</button></a>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </header>



            <div class="gtco-section">
                <% if (locAll.size() <= 0) {
                    %>
                    <i style="margin-left: 45.5%; font-size: 150px; color: red;" class="fas fa-binoculars"></i>
                    <p align="center">Carian dilakukan dengan sangat teliti tapi</p>
                    <h1 class="cursive-font" style="margin-left: 38%;">Tiada rekod yang ditemui!</h1>
                    <%} else {
                    %>

                <table style="background-color: #faf3f3; margin-left: auto; margin-right: auto; width: 70%;" border='1'>
                    <tr>

                        <th style="text-align: center;">Masjid</th>
                        <th style="text-align: center;">Nama Masjid</th>
                        <th style="text-align: center;">Latitud</th>
                        <th style="text-align: center;">Longitud</th>
                        <th style="text-align: center;">Poskod</th>
                        <th style="text-align: center;">Daerah</th>
                        <th style="text-align: center;">Mukim</th>
                        <th style="text-align: center;">Perincian Masjid</th>
                    </tr>

                    <% for (int i = 0; i < locAll.size(); i++) {%>
                    <tr>
                        <td><center><img width="150" height="100" src="/FridayPrayer/imgLoc/image.jsp?id='<%=locAll.get(i).getLokasiId()%>'"></center></td>
                    <td><%=locAll.get(i).getNamaMasjid()%></td>
                    <td><%=locAll.get(i).getLatitude()%></td>
                    <td><%= locAll.get(i).getLongitude()%></td>
                    <td><%= locAll.get(i).getPoskod()%></td>
                    <td><%= locAll.get(i).getDaerah()%></td>
                    <td><%= locAll.get(i).getMukim()%></td>
                    <td><a href=locList.jsp?id="<%=locAll.get(i).getLokasiId()%>"><center><i style="color: #f21170; font-size: 30px;" class="fas fa-map-marked-alt"></i></center></a>

                    </td>
                    </tr>
                    <%}%>
                </table>	
                <%}%>
            </div>




            <footer id="gtco-footer" role="contentinfo" style="background-image: url(images/img_bg_1.jpg)" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="gtco-container">
                    <div class="row row-pb-md">




                        <div class="col-md-12 text-center">
                            <div class="gtco-widget">
                                <h3>Segala Kesulitan, berhubung dengan maklumat dibawah:</h3>
                                <ul class="gtco-quick-contact">
                                    <li><a href="#"><i class="icon-phone"></i> +06 019-7935208</a></li>
                                    <li><a href="#"><i class="icon-mail2"></i> nurfitrixyni@gmail.com</a></li>
                                    <li><a href="https://wa.me/60197935208"><i class="icon-chat"></i> Live Chat</a></li>
                                </ul>
                            </div>
                            <div class="gtco-widget">
                                <h3>Media Sosial</h3>
                                <ul class="gtco-social-icons">
                                    <li><a href="#"><i class="icon-twitter"></i></a></li>
                                    <li><a href="#"><i class="icon-facebook"></i></a></li>
                                    <li><a href="#"><i class="icon-linkedin"></i></a></li>
                                    <li><a href="#"><i class="icon-dribbble"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-12 text-center copyright">
                            <p><small class="block">&copy; 2021 Project Tahun Akhir S52188</small> 
                                <small class="block">Dibangunkan oleh Muhamad Nurfitri Bin Zaini </small></p>
                        </div>

                    </div>



                </div>
            </footer>
            <!-- </div> -->

        </div>

        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- countTo -->
        <script src="js/jquery.countTo.js"></script>

        <!-- Stellar Parallax -->
        <script src="js/jquery.stellar.min.js"></script>

        <!-- Magnific Popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>

        <script src="js/moment.min.js"></script>
        <script src="js/bootstrap-datetimepicker.min.js"></script>


        <!-- Main -->
        <script src="js/main.js"></script>

    </body>
</html>

