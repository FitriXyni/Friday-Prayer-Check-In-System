<%@page import="project.infoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.info, project.DBConnection"%>
<jsp:useBean id="infoDao" class="project.infoDAO" scope="request"/>
<!DOCTYPE HTML>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

<%
    Date dNow = new Date();
    Calendar c = Calendar.getInstance();
    c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
    SimpleDateFormat ft1
            = new SimpleDateFormat("dd-MM-yyyy");
    

%>

<html>
    <head>
        <link rel="icon" href="/FridayPrayer/images/fpci.jpg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Info Solat Jumaat</title>
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
        String lokasiId = request.getParameter("id");
        DBConnection database = new DBConnection();
        infoDAO iDao = new infoDAO();
        info info = iDao.retrieveInfo3(lokasiId);
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
                            <div id="gtco-logo"><a href=infoDetails.jsp?id="<%=info.getLokasiId()%>"><i style="font-size: 40px;" class="fas fa-arrow-circle-left"></i></a></div>
                        </div>
                        <div class="col-xs-8 text-right menu-1">
                            <ul>

                                <li class="btn-cta"><a href="logout.jsp"><span>Log Keluar</span></a></li>
                            </ul>	
                        </div>
                    </div>

                </div>
            </nav>

            <header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/p1.jpg); height: 100%">
                <div class="overlay"></div>
                <div class="gtco-container">
                    <div class="row1">
                        <div class="col-md-12 col-md-offset-0 text-left">


                            <div class="row row-mt-15em1">
                                <div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">

                                    <h1 style="text-align: center;" class="cursive-font">Kemaskini Info Solat Jumaat!</h1>	
                                    <p style="text-align: center;">?????????????? ?????????????? ?????????????????????? ????????????????????</p>
                                    <p style="text-align: center;">???????????? ?????????????????????? ?????????????? ???????????????? ???????????? ???????????????? ?????????????????? ?????????????? ???????? ?????????????? ??????????????</p>
                                    <p style="text-align: justify;">Maksudnya: ???Tidaklah dikira orang yang banyak berdusta, siapa yang mahu mendamaikan antara dua orang yang berselisih, lalu diterbitkan daripadanya segala yang baik-baik atau dia berkata apa yang baik.???

                                        Riwayat al-Bukhari (2692) dan Muslim (4724)</p>
                                </div>
                                <div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
                                    <div class="form-wrap">
                                        <div class="tab">

                                            <div class="tab-content">
                                                <div class="tab-content-inner active" data-content="signup">
                                                    <h3 class="cursive-font" style="text-align: center;"><%=info.getNamaMasjid()%></h3>
                                                    <form action="updateInfo" method="post" enctype="multipart/form-data">
                                                        <div class="row form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Tarikh Kemaskini:</label>
                                                                    <input type="text" name="dateInfo" value="<%=ft1.format(c.getTime())%>" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Tajuk Khutbah:</label>
                                                                    <input type="text" name="tajKhut" value="<%=info.getTajKhut()%>" class="form-control">
                                                                </div>
                                                            </div>

                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Nama Imam:</label>
                                                                    <input type="text" name="imamName" value="<%=info.getImamName()%>" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>No Telefon Imam:</label>
                                                                    <input type="text" name="NTelImam" value="<%=info.getImamNTel()%>" class="form-control">
                                                                </div>
                                                            </div>

                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Nama Bilal:</label>
                                                                    <input type="text" name="bilalName" value="<%=info.getBilalName()%>" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>No Telefon Bilal:</label>
                                                                    <input type="text" name="NTelBilal" value="<%=info.getBilalNTel()%>" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <input type="hidden" value="<%=info.getAjkid()%>" name="ajkId">
                                                                <input type="hidden" value="<%=info.getInfoId()%>" name="infoId">
                                                                <input type="hidden" value="<%=info.getLokasiId()%>" name="lokasiId">

                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Gambar Imam:</label>
                                                                    <input type="file" name="gamImam" onchange="readURL(this)" required>
                                                                    <img style="width: 40%; height: 45%; margin-left: 4em;" id="blah" src="/FridayPrayer/images/10.JPG" alt="your image" /><br>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Gambar Bilal:</label>
                                                                    <input type="file" name="gamBilal" onchange="readURL1(this)" required>
                                                                    <img style="width: 40%; height: 45%; margin-left: 4em;" id="blah1" src="/FridayPrayer/images/10.JPG" alt="your image" /><br>
                                                                </div>
                                                            </div>


                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <input type="submit" class="btn btn-primary btn-block" value="Kemaskini Sekarang">
                                                                </div>
                                                            </div>
                                                    </form>	
                                                </div>

                                                <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
                                                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
                                                <script>
                                                                        function readURL(input) {
                                                                            if (input.files && input.files[0]) {
                                                                                var reader = new FileReader();

                                                                                reader.onload = function (e) {
                                                                                    $('#blah')
                                                                                            .attr('src', e.target.result);
                                                                                };

                                                                                reader.readAsDataURL(input.files[0]);
                                                                            }
                                                                        }

                                                                        function readURL1(input) {
                                                                            if (input.files && input.files[0]) {
                                                                                var reader = new FileReader();

                                                                                reader.onload = function (e) {
                                                                                    $('#blah1')
                                                                                            .attr('src', e.target.result);
                                                                                };

                                                                                reader.readAsDataURL(input.files[0]);
                                                                            }
                                                                        }
                                                </script>            

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </header>
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

