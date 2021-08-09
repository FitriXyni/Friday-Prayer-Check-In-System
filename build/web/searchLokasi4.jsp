<%@page import="project.wargasing"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.lokasi, project.tempahan, project.DBConnection"%>
<jsp:useBean id="lokDao" class="project.lokasiDAO" scope="request"/>
<jsp:useBean id="tempDao" class="project.tempahanDAO" scope="request"/>
<!DOCTYPE HTML>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

<%
    Date dNow = new Date();
   
    Calendar c = Calendar.getInstance();
    c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
    
    SimpleDateFormat ft1
            = new SimpleDateFormat("dd-MM-yyyy");
    wargasing wargasing = (wargasing) request.getSession().getAttribute("wargasing");
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Reservation Slot</title>
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            form.example input[type=text] {
                padding: 10px;
                font-size: 17px;
                border: 1px solid grey;
                float: left;
                width: 80%;
                background: #f1f1f1;
            }

            form.example button {
                float: left;
                width: 20%;
                padding: 10px;
                background: #af0069;
                color: white;
                font-size: 17px;
                border: 1px solid grey;
                border-left: none;
                cursor: pointer;
            }

            form.example button:hover {
                background: #d6b0b1;
            }

            form.example::after {
                content: "";
                clear: both;
                display: table;
            }
        </style>
    </head>
    <%

        String poskod = request.getParameter("search2");
        String kuodate = request.getParameter("date");
        List<lokasi> locAll = lokDao.retrieveLokasiJemaah(poskod, kuodate);
        DBConnection database = new DBConnection();
        
    %>
    <body>

        <div class="gtco-loader"></div>

        <div id="page">


            <!-- <div class="page-inner"> -->
            <nav class="gtco-nav" role="navigation">
                <div class="gtco-container">

                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <div id="gtco-logo"><a href="./menuMasjid3.jsp?jemPos=<%=wargasing.getwPoscode()%>&search2=<%=ft1.format(c.getTime())%>">Back <em>.</em></a></div>
                        </div>
                        <div class="col-xs-8 text-right menu-1">
                            <ul>

                                <li class="btn-cta"><a href="logout.jsp"><span>Log Out</span></a></li>
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
                                    <h1 class="cursive-font">Reservation Slot!</h1>	
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </header>




            <div class="gtco-section">
                <form class="example" action="searchLokasi3.jsp" style="margin:auto;max-width:300px">
                    <input type="text" placeholder="Your Poscode" name="search2">
                    <input type="hidden" value="<%=kuodate%>" name="date">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
                <br>
                <div class="gtco-container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
                            <h2 class="cursive-font primary-color">Mosque List</h2>
                            <p>Please follow the SOP that given from Majlis Keselamatan Negara (MKN) which wear the face mask, bring the own sajadah, and one meter distancing</p>
                        </div>

                    </div>
                    <% if (locAll.size() <= 0) {
                    %>

                    <h3 style="margin-left: 40%;">Mosque not found</h3>
                    <%} else {
                    %>
                    <div class="row">
                        <% for (int i = 0; i < locAll.size(); i++) {

                                int lokasiId = locAll.get(i).getLokasiId();
                                String kuodate1 = ft1.format(c.getTime());

                                List<tempahan> reserveSlot = tempDao.totalTempahan1(kuodate1, lokasiId);

                                for (int a = 0; a < reserveSlot.size(); a++) {

                        %>

                        
                            <% if (reserveSlot.get(a).getTotalTem() >= locAll.get(i).getKuotaProv()) {
                            %>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                            <a href="#" onclick="alert('Sorry Quota is already full');" class="fh5co-card-item">

                                <figure>

                                    <img width="350" height="250" src="/FridayPrayer/imgLoc/image.jsp?id='<%=locAll.get(i).getLokasiId()%>'" class="img-responsive">
                                </figure>
                                <div class="fh5co-text">
                                    <h2><%=locAll.get(i).getNamaMasjid()%></h2>
                                    <p>Poskod: <%= locAll.get(i).getPoskod()%></p>
                                    <p><span class="price cursive-font">Quota Full</span></p>

                                </div>
                            </a>
                            </div>
                                    
                                    

                            <%} else {
                            %>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <a href=reserveSlotWargasing.jsp?id="<%=locAll.get(i).getLokasiId()%>" class="fh5co-card-item">

                                <figure>
                                    <div class="overlay"><i class="ti-plus"></i></div>
                                    <img width="350" height="250" src="/FridayPrayer/imgLoc/image.jsp?id='<%=locAll.get(i).getLokasiId()%>'" class="img-responsive">
                                </figure>
                                <div class="fh5co-text">
                                    <h2><%=locAll.get(i).getNamaMasjid()%></h2>
                                    <p>Poskod: <%= locAll.get(i).getPoskod()%></p>
                                    <p><span class="price cursive-font"><%= reserveSlot.get(a).getTotalTem()%>/ <%= locAll.get(i).getKuotaProv()%> </span></p>
                                    
                                </div>
                            </a> 
                            </div>
                            <%}%>
                            <%}%>





                            <%}%>

                            <%}%>
                        

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