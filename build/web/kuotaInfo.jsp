<%@page import="project.ajkDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.ajkmasjid, project.DBConnection"%>
<jsp:useBean id="ajkDao" class="project.ajkDAO" scope="request"/>
<!DOCTYPE HTML>


<html>
    <head>
        <link rel="icon" href="/FridayPrayer/images/fpci.jpg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Info Kuota Masjid</title>
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
        String ajkid = request.getParameter("id");
        DBConnection database = new DBConnection();
        ajkDAO aDao = new ajkDAO();
        ajkmasjid ajkmasjid = ajkDao.ajkKuota(ajkid);
        database.closeConnection();
    %>
    <body>

        <div class="gtco-loader"></div>

        <div id="page">

            <% if (ajkmasjid.getKuotaProv() <= 0) {

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(\"Sila masukkan kuota yang tersedia di masjid anda!!!\")");
                    out.println("</script >");
                    String path = "/addKuota.jsp?id='"+ajkmasjid.getAjkid()+"'";
                    RequestDispatcher rd = request.getRequestDispatcher(path);
                    rd.include(request, response);
            %>





            <%} else {
            %>
            <!-- <div class="page-inner"> -->
            <nav class="gtco-nav" role="navigation">
                <div class="gtco-container">

                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <div id="gtco-logo"><a href="serviceAJK.jsp"><i style="font-size: 40px;" class="fas fa-arrow-circle-left"></i></a></div>
                        </div>
                        <div class="col-xs-8 text-right menu-1">
                            <ul>

                                <li class="btn-cta"><a href="logout.jsp"><span>Log Keluar</span></a></li>
                            </ul>	
                        </div>
                        <div class="col-xs-8 text-right menu-1">

                        </div>
                    </div>

                </div>
            </nav>

            <header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/p1.jpg)" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-12 col-md-offset-0 text-left">


                            <div class="row row-mt-15em1">
                                <div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
                                    <h1 style="text-align: center;" class="cursive-font">Info Kuota!</h1>
                                    <p style="text-align: center;">مَنْ سَمِعَ الْمُنَادِيَ فَلَمْ يَمْنَعْهُ مِنْ اتِّبَاعِهِ عُذْرٌ قَالُوا: وَمَا الْعُذْرُ؟ قَالَ: خَوْفٌ أَوْ مَرَضٌ</p>
                                    <p style="text-align: justify;">Maksudnya: “Sesiapa yang mendengar orang yang melaungkan azan maka tidaklah yang keuzuran menghalangnya dari mengikutinya (hadir solat berjamaah)”. Para sahabat bertanya : “Apa maksud uzur ?”. Jawab Rasulullah SAW: “Ketakutan atau sakit.”

                                        Riwayat Abu Daud (551) dan al-Daraqutni (1/420)</p>
                                </div>
                                <div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
                                    <div class="form-wrap">
                                        <div class="tab">

                                            <div class="tab-content">
                                                <div class="tab-content-inner active" data-content="signup">
                                                    <h3 style="text-align: center;" class="cursive-font">Perincian Kuota Masjid</h3>


                                                    <img width="200" height="120" style="margin-left: 12%;" src="/FridayPrayer/imgLoc/image.jsp?id='<%=ajkmasjid.getLokasiId()%>'">
                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label>Nama Masjid:</label>
                                                            <input type="text" name="kuotaDate" value="<%=ajkmasjid.getNamaMasjid()%>" class="form-control" readonly>
                                                        </div>
                                                    </div>

                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label>Kuota Disediakan:</label>
                                                            <input type="text" name="kuotaPrd" value="<%=ajkmasjid.getKuotaProv()%>" class="form-control" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label>Tarikh Tersedia:</label>
                                                            <input type="text" name="kuotaPrd" value="<%=ajkmasjid.getKuodate1()%>" class="form-control" readonly>
                                                        </div>
                                                    </div>

                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <a href=updateKuota.jsp?id="<%=ajkmasjid.getAjkid()%>"><input type="button" class="btn btn-primary btn-block" value="Kemaskini Kuota"></a>
                                                        </div>
                                                    </div>
                                                    </form>




                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </header>
            <%}%>

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

