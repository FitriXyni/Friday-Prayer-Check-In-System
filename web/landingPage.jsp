<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.jemaah, project.ajkmasjid,project.lokasi,project.DBConnection"%>
<jsp:useBean id="jDao" class="project.jemDAO" scope="request"/>
<jsp:useBean id="aDao" class="project.ajkDAO" scope="request"/>
<jsp:useBean id="mDao" class="project.lokasiDAO" scope="request"/>
<!DOCTYPE HTML>

<html>
    <head>
        <link rel="icon" href="/FridayPrayer/images/fpci.jpg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Friday Prayer Check In System</title>
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

        List<jemaah> allJem = jDao.totalJemaah();
        List<ajkmasjid> allAjk = aDao.totalAJKM();
        List<lokasi> allMas = mDao.totalMasjid();
        DBConnection database = new DBConnection();
        database.closeConnection();
    %>
    <body>

        <div class="gtco-loader"></div>

        <div id="page">




            <header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/p1.jpg); height: 100%;">
                <div class="overlay"></div>
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-12 col-md-offset-0 text-center">


                            <div class="row row-mt-15em">
                                <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                                    <h1 class="cursive-font">السلام عليكم</h1>
                                    <p>بِسْــــــــــــــــــمِ اللهِ الرَّحْمَنِ الرَّحِيْمِ</p>
                                    <p>Selamat datang Tuan/Puan Ke "Sistem Friday Prayer Check-In" (FPCI)</p>
                                    <p style=" text-align: left;">Bahawa Nabi SAW bersabda:</p>
                                    <p>مَنِ اغْتَسَلَ يَوْمَ الجُمُعَةِ غُسْلَ الجَنَابَةِ ثُمَّ رَاحَ، فَكَأَنَّمَا قَرَّبَ بَدَنَةً، وَمَنْ رَاحَ فِي السَّاعَةِ الثَّانِيَةِ، فَكَأَنَّمَا قَرَّبَ بَقَرَةً، وَمَنْ رَاحَ فِي السَّاعَةِ الثَّالِثَةِ، فَكَأَنَّمَا قَرَّبَ كَبْشًا أَقْرَنَ، وَمَنْ رَاحَ فِي</p>
                                    <p>السَّاعَةِ الرَّابِعَةِ، فَكَأَنَّمَا قَرَّبَ دَجَاجَةً، وَمَنْ رَاحَ فِي السَّاعَةِ الخَامِسَةِ، فَكَأَنَّمَا قَرَّبَ بَيْضَةً، فَإِذَا خَرَجَ الإِمَامُ حَضَرَتِ المَلاَئِكَةُ يَسْتَمِعُونَ الذِّكْرَ</p>
                                    <p style="text-align: justify;">Maksudnya: “Sesiapa yang mandi pada hari Jumaat (seperti) mandi janabah lalu segera pergi ke masjid, maka seakan-akan berkorban dengan unta,
                                        sesiapa yang pergi pada masa yang kedua, maka seakan-akan dia berkorban dengan lembu, dan sesiapa pergi pada masa yang ketiga, maka seakan-akan dia 
                                        berkorban dengan biri-biri jantan yang bertanduk, dan sesiapa yang pergi pada masa yang keempat seakan-akan dia berkorban dengan seekor ayam, 
                                        dan sesiapa yang pergi pada masa kelima, maka seakan-akan dia berkorban dengan sebiji telur dan apabila imam telah keluar (untuk berkhutbah) maka 
                                        para malaikat turut hadir untuk mendengar peringatan (khutbah)”. [Riwayat al-Bukhari (881) dan Muslim (850)]</p>
                                    <a href="mainpage.jsp"><button class="btn btn-primary">Log Masuk</button></a>

                                </div>

                            </div>



                        </div>
                    </div>
                </div>
            </header>

            <div id="gtco-counter" class="gtco-section">
                <div class="gtco-container">

                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
                            <h2 class="cursive-font primary-color">Fakta-Fakta FPCI</h2>
                            <p>Berikut merupakan jumlah bagi Jemaah Masjid, Ahli Jawatan Kuasa Masjid, Masjid berdaftar</p>
                        </div>
                    </div>

                    <div class="row">
                        <% for (int i = 0; i < allJem.size(); i++) {%>
                        <div class="col-md-3 col-sm-6 animate-box" data-animate-effect="fadeInUp">
                            <div class="feature-center">
                                <span class="counter js-counter" data-from="0" data-to="<%=allJem.get(i).getTotalJemReport()%>" data-speed="5000" data-refresh-interval="50">1</span>
                                <span class="counter-label">Jemaah Masjid</span>

                            </div>
                        </div>
                        <%}%>
                        <% for (int i = 0; i < allAjk.size(); i++) {%>
                        <div class="col-md-3 col-sm-6 animate-box" data-animate-effect="fadeInUp">
                            <div class="feature-center">
                                <span class="counter js-counter" data-from="0" data-to="<%=allAjk.get(i).getTotalAJKMasjid()%>" data-speed="5000" data-refresh-interval="50">1</span>
                                <span class="counter-label">AJK Masjid</span>
                            </div>
                        </div>
                        <%}%>
                        <% for (int i = 0; i < allAjk.size(); i++) {%>
                        <div class="col-md-3 col-sm-6 animate-box" data-animate-effect="fadeInUp">
                            <div class="feature-center">
                                <span class="counter js-counter" data-from="0" data-to="<%=allMas.get(i).getTotalmasjid()%>" data-speed="5000" data-refresh-interval="50">1</span>
                                <span class="counter-label">Masjid Berdaftar</span>
                            </div>
                        </div>
                        <%}%>
                        <div class="col-md-3 col-sm-6 animate-box" data-animate-effect="fadeInUp">
                            <div class="feature-center">
                                <span class="counter js-counter" data-from="0" data-to="2021" data-speed="5000" data-refresh-interval="50">1</span>
                                <span class="counter-label">Tahun Bermula</span>

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

