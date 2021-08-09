<%@page import="project.tempahan"%>
<%@page import="project.DBConnection"%>
<!DOCTYPE HTML>
<%@page import="project.ajkmasjid"%>
<%@page import="project.ajkDAO"%> 
<jsp:useBean id="tempDao" class="project.tempahanDAO" scope="request"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

<%

    ajkmasjid ajkmasjid = (ajkmasjid) request.getSession().getAttribute("ajkmasjid");
%>
<html>
    <head>
        <link rel="icon" href="/FridayPrayer/images/fpci.jpg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Perkhidmatan AJK Masjid</title>
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
    <body>

        <div class="gtco-loader"></div>

        <div id="page">


            <!-- <div class="page-inner"> -->
            <nav class="gtco-nav" role="navigation">
                <div class="gtco-container">

                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <div id="gtco-logo"><a href="serviceAJK.jsp">FPCI SYSTEM <em>.</em></a></div>
                        </div>
                        <div class="col-sm-4 col-xs-12">

                        </div>
                        <div class="col-xs-8 text-right menu-1">
                            <ul>
                                <li>AJK Masjid</li>
                                <li class="btn-cta"><a href="logout.jsp"><span>Log Keluar</span></a></li>
                            </ul>	
                        </div>
                    </div>

                </div>
            </nav>

            <header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/p1.jpg); height: 100%;">
                <div class="overlay"></div>
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-12 col-md-offset-0 text-center">


                            <div class="row row-mt-15em">
                                <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                                    <h1 class="cursive-font">Assalamualaikum <%=ajkmasjid.getAjkname()%> !</h1>	
                                    <p style="text-align: center;">وَاشْكُرُوا نِعْمَتَ اللَّـهِ إِن كُنتُمْ إِيَّاهُ تَعْبُدُونَ</p>
                                    <p style="text-align: center;">Maksudnya: Bersyukurlah akan nikmat Allah, jika benar kamu hanya menyembah-Nya semata-mata.

                                        Surah al-Nahl (114)</p>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </header>



            <div id="gtco-features">
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
                            <h2 class="cursive-font">Tawaran Perkhidmatan</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                <span class="icon"><a href=kuotaInfo.jsp?id="<%=ajkmasjid.getAjkid()%>">
                                        <i style="color: black;" class="fas fa-mosque"></i>
                                    </a>
                                </span>
                                <h3>Urus Kuota</h3>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                <span  class="icon"><a href=infoDetails.jsp?id="<%=ajkmasjid.getLokasiId()%>">
                                        <i style="color: black;" class="fas fa-info-circle"></i>
                                    </a>
                                </span>
                                <h3>Info Solat Jumaat</h3>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                <span class="icon"><a href=addReport.jsp?id="<%=ajkmasjid.getAjkid()%>">
                                        <i style="color: black;" class="fas fa-clipboard"></i>
                                    </a>
                                </span>
                                <h3>Laporan Solat Jumaat</h3>
                            </div>
                        </div>



                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                <span class="icon"><a href="graphJemCat.jsp">
                                        <i style="color: black;" class="fas fa-chart-pie"></i>
                                    </a>
                                </span>
                                <h3>Statistik Jemaah Mingguan</h3>
                            </div>
                        </div>
                        <%
                            Date dNow = new Date();
                            SimpleDateFormat ft
                                    = new SimpleDateFormat("E");

                            Calendar c = Calendar.getInstance();
                            c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);

                            SimpleDateFormat ft1
                                    = new SimpleDateFormat("dd-MM-yyyy");
                            SimpleDateFormat ft2
                                    = new SimpleDateFormat("E dd/MM/yyyy");

                            
                            String tempdate = ft1.format(c.getTime());
                            DBConnection database = new DBConnection();
                            List<tempahan> tempAll = tempDao.ListJemTem(ajkmasjid.getLokasiId(), tempdate);
                        %>
                        
                        <div class="col-md-4 col-sm-6">
                            <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                <%
                                    if((tempAll.size() != 0) && (tempAll.get(0).getStatusKehadiran().equals("pending"))){
                                %>
                                
                                
                                
                                <span class="icon"><a href=senaraiKehadiranJem.jsp?id=<%=ajkmasjid.getLokasiId()%>>
                                        <i style="color: black;" class="fas fa-clipboard-list"></i>
                                    </a>
                                </span>
                                <h3>Senarai Kehadiran Jemaah</h3>
                               
                                
                                <%} else {%>
                                <span class="icon"><a href=senaraiJemaah1.jsp?id=<%=ajkmasjid.getLokasiId()%>>
                                        <i style="color: black;" class="fas fa-clipboard-list"></i>
                                    </a>
                                </span>
                                        <h3>Senarai Kehadiran Jemaah</h3>
                                <%}%>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6">
                            <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                <span class="icon"><a href=AJKInformation.jsp?id="<%=ajkmasjid.getAjkid()%>">
                                        <i style="color: black;" class="fas fa-user-edit"></i>
                                    </a>
                                </span>
                                <h3>Urus Profil</h3>
                            </div>
                        </div>

                    </div>
                </div>
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

