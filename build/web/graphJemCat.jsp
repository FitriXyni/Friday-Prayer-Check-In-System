<%@page import="java.math.RoundingMode"%>
<%@page import="project.ajkmasjid"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.tempahanDAO"%>
<%@page import="project.lokasiDAO"%>
<%@page import="java.util.List"%>
<%@page import="project.tempahan, project.lokasi, project.DBConnection"%>
<jsp:useBean id="tempDao" class="project.tempahanDAO" scope="request"/>
<jsp:useBean id="locDao" class="project.lokasiDAO" scope="request"/>
<!DOCTYPE HTML>
<%

    ajkmasjid ajkmasjid = (ajkmasjid) request.getSession().getAttribute("ajkmasjid");
%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

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

%>
<html>
    <head>
        <link rel="icon" href="/FridayPrayer/images/fpci.jpg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Statistik Jemaah</title>
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
    <%        int lokasiId = ajkmasjid.getLokasiId();
        String tempdate = ft1.format(c.getTime());
        DBConnection database = new DBConnection();
        tempahanDAO tDao = new tempahanDAO();
        tempahan tempahan = tempDao.totalJemTempatan(tempdate, lokasiId);
        tempahan tempahan1 = tempDao.totalJemLuar(tempdate, lokasiId);
        tempahan tempahan2 = tempDao.totalJemWasing(tempdate, lokasiId);
        List<tempahan> tempAll = tempDao.ListJemTem(lokasiId, tempdate);
        lokasiDAO lDao = new lokasiDAO();
        lokasi lokasi = locDao.retrieveOneLokasi1(lokasiId);
        database.closeConnection();
    %>

    <body>
        <%
            double toJemTem = tempahan.getTotalJemTem();
            double toJemLu = tempahan1.getTotalJemLu();
            double toJemWa = tempahan2.getTotalJemWa();
            int kuotaProvided = lokasi.getKuotaProv();
            double percentJemTem = (toJemTem / kuotaProvided) * 100;
            double percentJemLu = (toJemLu / kuotaProvided) * 100;
            double percentJemWa = (toJemWa / kuotaProvided) * 100;

            DecimalFormat df = new DecimalFormat("#.##");
            df.setRoundingMode(RoundingMode.CEILING);
        %>

        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                    exportEnabled: true,
                    animationEnabled: true,
                    title: {
                        text: "Pecahan Jemaah Mengikut Kategori"
                    },

                    data: [{
                            type: "pie",
                            startAngle: 25,
                            toolTipContent: "<b>{label}</b>: {y}%",
                            showInLegend: "true",
                            legendText: "{label}",
                            indexLabelFontSize: 16,
                            indexLabel: "{label} - {y}%",
                            dataPoints: [
                                {y: <%=df.format(percentJemTem)%>, label: "Jemaah Tempatan (" +<%=toJemTem%> + " orang)"},
                                {y: <%=df.format(percentJemLu)%>, label: "Jemaah Luar (" +<%=toJemLu%> + " orang)"},
                                {y: <%=df.format(percentJemWa)%>, label: "Jemaah Warga Asing (" +<%=toJemWa%> + " orang)"},
                            ]
                        }]
                });
                chart.render();

            }
        </script>
        <div class="gtco-loader"></div>

        <div id="page">


            <!-- <div class="page-inner"> -->
            <nav class="gtco-nav" role="navigation">
                <div class="gtco-container">

                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <div id="gtco-logo"><a href="serviceAJK.jsp"><i style="font-size: 40px;" class="fas fa-arrow-circle-left"></i></a></div>
                        </div>

                    </div>

                </div>
            </nav>

            <header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/p1.jpg); height: 100%">
                <div class="overlay"></div>
                <div class="gtco-container">
                    <div class="row1">
                        <div class="col-md-12 col-md-offset-0 text-left">


                            <div class="row row-mt-15em2">
                                <h1 style="text-align: center; color: bisque;">Carta Pai</h1>
                                <h3 style="text-align: center; color: yellow;"><%=lokasi.getNamaMasjid()%></h3>
                                <h2 style="text-align: center; font-weight: 700;"><%=ft2.format(c.getTime())%></h2>

                                <div id="chartContainer" style="height: 620px; width: 100%;"></div>
                                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                            </div>
                            <div class="row row-mt-15em"></div>
                            <table id="myfrm" style="background-color: #faf3f3; margin-left: auto; margin-right: auto; width: 100%;" border='1'>
                                <h2 style="text-align: center; font-weight: 700;">Senarai Nama Jemaah membuat tempahan solat jumaat</h2>
                                <tr>
                                    <th style="text-align: center;">Bil.</th>
                                    <th style="text-align: center;">ID Tempahan</th>
                                    <th style="text-align: center;">Tarikh Tempahan</th>
                                    <th style="text-align: center;">Nama Jemaah</th>
                                    <th style="text-align: center;">Alamat Jemaah</th>
                                    <th style="text-align: center;">Nombor Telefon</th>
                                    <th style="text-align: center;">Nombor Kad Pengenalan</th>
                                    <th style="text-align: center;">Kategori Jemaah</th>
                                </tr>

                                <% for (int i = 0; i < tempAll.size(); i++) {%>
                                <tr>
                                    <td style="text-align: center;"><%=i + 1%></td>
                                    <td style="text-align: center;"><%=tempAll.get(i).getTempId()%></td>
                                    <td style="text-align: center;"><%=tempAll.get(i).getTempDate()%></td>
                                    <td style="text-align: center;"><%=tempAll.get(i).getJemname()%></td>
                                    <td style="text-align: center;"><%=tempAll.get(i).getJemAlamat()%></td>
                                    <td style="text-align: center;"><%=tempAll.get(i).getJemTel()%></td>
                                    <td style="text-align: center;"><%=tempAll.get(i).getJemIC()%></td>
                                    <td style="text-align: center;"><%=tempAll.get(i).getJemCat()%></td>



                                </tr>
                                <%}%>
                            </table>
                            <div class="row row-mt-15em"></div>
                            <p align="center"><input type="button" class="btn btn-primary btn-block" style="width: 20%" onclick="myPrint('myfrm')" value="Cetak"></p>
                            <script>
                                function myPrint(myfrm) {
                                    
                                    var printdata = document.getElementById(myfrm);
                                    newwin = window.open("");
                                    newwin.document.write(printdata.outerHTML);
                                    newwin.print();
                                    newwin.close();
                                }
                            </script>
                            <div class="row row-mt-15em"></div>
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

