<%@page import="project.laporanDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.laporan, project.DBConnection"%>
<jsp:useBean id="lapDAO" class="project.laporanDAO" scope="request"/>
<!DOCTYPE HTML>

<html>
    <head>
        <link rel="icon" href="/FridayPrayer/images/fpci.jpg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Laporan Solat Jumaat</title>
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

        out.println("<script type=\"text/javascript\">");
        out.println("alert(\"Kemaskini Laporan Solat Jumaat Berjaya\")");
        out.println("</script >");
        String lapId = request.getParameter("id");
        DBConnection database = new DBConnection();
        laporanDAO lapDao = new laporanDAO();
        laporan laporan = lapDao.getOneReport(lapId);
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
                            <div id="gtco-logo"><a href=reportList2.jsp?id="<%=laporan.getLokasiId()%>"><i style="font-size: 40px;" class="fas fa-arrow-circle-left"></i></a></div>
                        </div>
                        <div class="col-xs-8 text-right menu-1">
                            <ul>

                                <li class="btn-cta"><a href="logout.jsp"><span>Log Keluar</span></a></li>
                            </ul>	
                        </div>
                    </div>

                </div>
            </nav>

            <header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/p1.jpg)">
                <div class="overlay"></div>
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-12 col-md-offset-0 text-center">


                            <div class="row row-mt-15em">
                                <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                                    <h1 class="cursive-font">Laporan Solat Jumaat</h1>
                                    <p><%=laporan.getNamaMasjid()%></p>
                                    <p><%=laporan.getLapDate()%></p>




                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </header>


            <div class="gtco-section">
                <div class="gtco-container">
                    <div class="row">

                        <div class="col-md-12" style="margin-left: 2em;">

                            <div class="col-md-6 animate-box">
                                <h3>Info Masjid:</h3>
                                <img width="400" height="290" style="margin-left: 12%;" src="/FridayPrayer/imgLoc/image.jsp?id='<%=laporan.getLokasiId()%>'">
                                <p></p>
                                <h3 class="cursive-font" style="text-align: center;"><%=laporan.getNamaMasjid()%></h3>
                                <br><br>
                                <h3>Perincian Laporan:</h3>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label>Nama Imam:</label>
                                        <input type="text" name="imamName" style="color: white; font-weight: 700;" value="<%=laporan.getLapIM()%>" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label>Nama Bilal:</label>
                                        <input type="text" name="BilalName" style="color: white; font-weight: 700;" value="<%=laporan.getLapB()%>" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label>Penerangan Laporan:</label>
                                        <label class="sr-only">Mesej:</label>
                                        <textarea name="repDesc" style="color: white; font-weight: 700;" id="message" cols="20" rows="20" class="form-control" readonly><%=laporan.getLapDesc()%></textarea>
                                    </div>
                                </div>
                                <p>

                                </p>





                                <div class="row form-group">

                                    <input type="hidden" name="ajkid" value="<%=laporan.getAjkid()%>" class="form-control">
                                    <input type="hidden" name="lokasiId" value="<%=laporan.getLokasiId()%>" class="form-control">


                                </div>

                            </div>
                            <div class="col-md-5 col-md-push-1 animate-box">

                                <div class="gtco-contact-info">
                                    <h3>Gambar Laporan:</h3>
                                    <div class="row form-group">
                                        <div class="col-md-12">
                                            <a href="/FridayPrayer/imgReport/image1.jsp?id='<%=laporan.getLaporanId()%>'" class="image-popup">
                                                <figure>
                                                    <label>Gambar 1:</label>

                                                    <img style="width: 20em; height: 10em; margin-left: 4em;" src="/FridayPrayer/imgReport/image1.jsp?id='<%=laporan.getLaporanId()%>'" alt="image"/>
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-12">
                                            <a href="/FridayPrayer/imgReport/image2.jsp?id='<%=laporan.getLaporanId()%>'" class="image-popup">
                                                <figure>
                                                    <label>Gambar 2:</label>

                                                    <img style="width: 20em; height: 10em; margin-left: 4em;" src="/FridayPrayer/imgReport/image2.jsp?id='<%=laporan.getLaporanId()%>'" alt="image"/>
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-12">
                                            <a href="/FridayPrayer/imgReport/image3.jsp?id='<%=laporan.getLaporanId()%>'" class="image-popup">
                                                <figure>
                                                    <label>Gambar 3:</label>

                                                    <img style="width: 20em; height: 10em; margin-left: 4em;" src="/FridayPrayer/imgReport/image3.jsp?id='<%=laporan.getLaporanId()%>'" alt="image"/>
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-12">
                                            <a href="/FridayPrayer/imgReport/image4.jsp?id='<%=laporan.getLaporanId()%>'" class="image-popup">
                                                <figure>
                                                    <label>Gambar 4:</label>

                                                    <img style="width: 20em; height: 10em; margin-left: 4em;" src="/FridayPrayer/imgReport/image4.jsp?id='<%=laporan.getLaporanId()%>'" alt="image"/>
                                                </figure>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-12">
                                            <a href="/FridayPrayer/imgReport/image5.jsp?id='<%=laporan.getLaporanId()%>'" class="image-popup">
                                                <figure>
                                                    <label>Gambar 5:</label>

                                                    <img style="width: 20em; height: 10em; margin-left: 4em;" src="/FridayPrayer/imgReport/image5.jsp?id='<%=laporan.getLaporanId()%>'" alt="image"/>
                                                </figure>
                                            </a>
                                        </div>
                                    </div>

                                </div>


                            </div>

                        </div>
                        <a style="margin-left: 40%;" href=reportList2.jsp?id="<%=laporan.getLokasiId()%>"><button class="btn btn-primary">Selesai</button></a><a href=updateReport.jsp?id="<%=laporan.getLaporanId()%>"><button class="btn btn-primary">Kemaskini</button></a>



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

