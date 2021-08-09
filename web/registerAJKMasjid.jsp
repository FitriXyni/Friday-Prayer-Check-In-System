
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="project.DBConnection"%>
<%@page import="project.lokasiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="project.lokasi, project.DBConnection"%>
<%@page import="project.ajkmasjid, project.ajkDAO, java.sql.*"%>
<jsp:useBean id="locDao" class="project.lokasiDAO" scope="request"/>


<!DOCTYPE HTML>


<html>
    <head>
        <link rel="icon" href="/FridayPrayer/images/fpci.jpg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Pendaftaran AJK Masjid</title>
        <script>
            function validatePassword(password) {

                // Do not show anything when the length of password is zero.
                if (password.length === 0) {
                    document.getElementById("msg").innerHTML = "";
                    return;
                }
                // Create an array and push all possible values that you want in password
                var matchedCase = new Array();
                matchedCase.push("[$@$!%*#?&]"); // Special Charector
                matchedCase.push("[A-Z]"); // Uppercase Alpabates
                matchedCase.push("[0-9]"); // Numbers
                matchedCase.push("[a-z]"); // Lowercase Alphabates

                // Check the conditions
                var ctr = 0;
                for (var i = 0; i < matchedCase.length; i++) {
                    if (new RegExp(matchedCase[i]).test(password)) {
                        ctr++;
                    }
                }
                // Display it
                var color = "";
                var strength = "";
                switch (ctr) {
                    case 0:
                    case 1:
                    case 2:
                        strength = "Sangat Lemah";
                        color = "red";
                        break;
                    case 3:
                        strength = "Sederhana";
                        color = "orange";
                        break;
                    case 4:
                        strength = "Sangat Kuat";
                        color = "green";
                        break;
                }
                document.getElementById("msg").innerHTML = strength;
                document.getElementById("msg").style.color = color;
            }

        </script>
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
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->
        <script src="https://kit.fontawesome.com/889366029b.js" crossorigin="anonymous"></script>

    </head>
    <%
        session.removeAttribute("ajkerror1");
        session.removeAttribute("ajkerror");
        session.removeAttribute("passErrorMessage9");
        session.removeAttribute("IdAjkErrorMessage");

        session.removeAttribute("ajkid");
        session.removeAttribute("ajkname");
        session.removeAttribute("ajkic");
        session.removeAttribute("ajkage");
        session.removeAttribute("ajkdob");
        session.removeAttribute("ajkalamat");
        session.removeAttribute("ajkmukim");
        session.removeAttribute("ajkdaerah");
        session.removeAttribute("ajkntel");

        lokasi lokasi = new lokasi();
        if (request.getParameter("lokid") != null) {
            int lokasiId = Integer.parseInt(request.getParameter("lokid"));
            DBConnection database = new DBConnection();
            lokasiDAO loDao = new lokasiDAO();
            lokasi = loDao.retrieveOneLokasi(lokasiId);
            database.closeConnection();

        }
    %>
    <%
        int status = 0;
        String ajkId = request.getParameter("ajkid");
        String ajkname = request.getParameter("ajkname");
        String ajkpass = request.getParameter("ajkpass");
        String ajkpass1 = request.getParameter("ajkpass1");
        String ajkic = request.getParameter("ajkic");
        String ajkage = request.getParameter("ajkage");
        String ajkdob = request.getParameter("ajkdob");
        String ajkalamat = request.getParameter("ajkalmt");
        String ajkmukim = request.getParameter("ajkmukim");
        String ajkdaerah = request.getParameter("ajkdaerah");
        String ajktel = request.getParameter("ajkntel");
        int lokasiId1 = 0;
        if (request.getParameter("lokid") != null) {
            lokasiId1 = Integer.parseInt(request.getParameter("lokid"));
        }

        if (ajktel != null) {

            Pattern pattern = Pattern.compile("^\\d{10}$");
            Matcher matcher = pattern.matcher(ajktel);
            Pattern pattern1 = Pattern.compile("^\\d{11}$");
            Matcher matcher1 = pattern1.matcher(ajktel);

            if ((matcher.matches() || matcher1.matches()) && (ajkpass.equals(ajkpass1))) {

                Connection connection = DBConnection.getConnection();
                Statement st = connection.createStatement();
                String Countrow = "";
                int numOfRecord = 0;
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    try {

                        String strQuery1 = "SELECT COUNT(1) FROM ajkmasjid WHERE ajkid ='" + ajkId + "'";
                        ResultSet rs1 = st.executeQuery(strQuery1);
                        rs1.next();
                        numOfRecord = rs1.getInt(1);

                        String strQuery = "SELECT COUNT(*) FROM ajkmasjid where ajkntel='" + ajktel + "'";
                        ResultSet rs = st.executeQuery(strQuery);
                        rs.next();
                        Countrow = rs.getString(1);

                        if (Countrow.equals("0")) {
                            ajkmasjid ajkmasjid = new ajkmasjid();

                            ajkmasjid.setAjkid(ajkId);
                            ajkmasjid.setAjkname(ajkname);
                            ajkmasjid.setAjkpass(ajkpass);
                            ajkmasjid.setAjkic(ajkic);
                            ajkmasjid.setAjkage(ajkage);
                            ajkmasjid.setAjkdob(ajkdob);
                            ajkmasjid.setAjkalmt(ajkalamat);
                            ajkmasjid.setAjkmukim(ajkmukim);
                            ajkmasjid.setAjkdaerah(ajkdaerah);
                            ajkmasjid.setAjkntel(ajktel);

                            if (lokasiId1 != 0) {
                                ajkmasjid.setLokasiId(lokasiId1);
                            }
                            status = ajkDAO.registerAJKMasjid(ajkmasjid);
                            if (status > 0) {

                                response.sendRedirect("mainpage1.jsp");
                            }
                        }
                        session.removeAttribute("ajkerror1");
                        if (!Countrow.equals("0")) {
                            session.setAttribute("ajkerror1", "Nombor anda telah digunakan");

                            session.setAttribute("ajkid", ajkId);
                            session.setAttribute("ajkname", ajkname);
                            session.setAttribute("ajkic", ajkic);
                            session.setAttribute("ajkage", ajkage);
                            session.setAttribute("ajkdob", ajkdob);
                            session.setAttribute("ajkalamat", ajkalamat);
                            session.setAttribute("ajkmukim", ajkmukim);
                            session.setAttribute("ajkdaerah", ajkdaerah);
                            session.setAttribute("ajkntel", ajktel);
                        }
                        session.removeAttribute("IdAjkErrorMessage");
                        if (numOfRecord != 0) {
                            session.setAttribute("IdAjkErrorMessage", "Id yang dimasukkan telah digunakan");

                            session.setAttribute("ajkid", ajkId);
                            session.setAttribute("ajkname", ajkname);
                            session.setAttribute("ajkic", ajkic);
                            session.setAttribute("ajkage", ajkage);
                            session.setAttribute("ajkdob", ajkdob);
                            session.setAttribute("ajkalamat", ajkalamat);
                            session.setAttribute("ajkmukim", ajkmukim);
                            session.setAttribute("ajkdaerah", ajkdaerah);
                            session.setAttribute("ajkntel", ajktel);
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    connection.close();
                }
            } else {
                session.removeAttribute("ajkerror");
                if (!(matcher.matches() || matcher1.matches())) {

                    session.setAttribute("ajkerror", "Sila masukkan nombor sahaja");
                }
                session.removeAttribute("passErrorMessage9");
                if (!(ajkpass.equals(ajkpass1))) {
                    session.setAttribute("passErrorMessage9", "Kata Laluan anda tidak sama");
                }
                session.setAttribute("ajkid", ajkId);
                session.setAttribute("ajkname", ajkname);
                session.setAttribute("ajkic", ajkic);
                session.setAttribute("ajkage", ajkage);
                session.setAttribute("ajkdob", ajkdob);
                session.setAttribute("ajkalamat", ajkalamat);
                session.setAttribute("ajkmukim", ajkmukim);
                session.setAttribute("ajkdaerah", ajkdaerah);
                session.setAttribute("ajkntel", ajktel);

            }

        }
    %>

    <body>

        <div class="gtco-loader"></div>

        <div id="page">


            <!-- <div class="page-inner"> -->
            <nav class="gtco-nav" role="navigation">
                <div class="gtco-container">

                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <div id="gtco-logo"><a href="testMasList.jsp"><i style="font-size: 40px;" class="fas fa-arrow-circle-left"></i></a></div>
                        </div>
                        <div class="col-xs-8 text-right menu-1">
                            <ul>
                                <%
                                    if (lokasi != null) {
                                %>
                                <li class="btn-cta"><a href="https://www.google.com/maps/search/<%=lokasi.getLatitude()%>+<%=lokasi.getLongitude()%>"><span>Geolokasi  <i style="font-size: 20px;" class="fas fa-search-location"></i></span></a></li>
                                            <%}%>
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

                                    <h1 class="cursive-font">Daftar diri anda!</h1>
                                    <p style="text-align: center;">يَا أَيُّهَا الَّذِينَ آمَنُوا إِذَا نُودِيَ لِلصَّلَاةِ مِن يَوْمِ الْجُمُعَةِ فَاسْعَوْا إِلَىٰ ذِكْرِ اللَّـهِ وَذَرُوا الْبَيْعَ ۚ ذَٰلِكُمْ خَيْرٌ لَّكُمْ إِن كُنتُمْ تَعْلَمُونَ</p>
                                    <p style="text-align: justify;">Maksudnya : “Wahai orang-orang yang beriman! Apabila diserukan azan untuk mengerjakan sembahyang pada hari Jumaat, maka segeralah kamu pergi (ke masjid) untuk mengingati Allah (dengan mengerjakan sembahyang Jumaat) dan tinggalkanlah berjual-beli (pada saat itu), yang demikian adalah baik bagi kamu, jika kamu mengetahui (hakikat yang sebenarnya).”

                                        (Surah al-Jumu‘ah : 9)</p>	
                                </div>
                                <div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
                                    <div class="form-wrap">
                                        <div class="tab">

                                            <div class="tab-content">
                                                <div class="tab-content-inner active" data-content="signup">
                                                    <h3 style="text-align: center;" class="cursive-font">Borang Pendaftaran</h3>
                                                    <p style="text-align: center;">AJK Masjid</p>
                                                    <form action="registerAJKMasjid.jsp" method="post">
                                                        <div class="row form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>AJK ID:</label>
                                                                    <%                                                                        
                                                                        String ajkid = (String) request.getSession().getAttribute("ajkid");

                                                                        if (ajkid != null) {
                                                                    %>
                                                                    <input type="text" name="ajkid" value="<%=ajkid%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" name="ajkid" class="form-control" required>
                                                                    <%}%>
                                                                    <%
                                                                        String iderror = (String) request.getSession().getAttribute("IdAjkErrorMessage");

                                                                        if (iderror != null) {


                                                                    %> 
                                                                    <label style="color: red;"><%=iderror%></label>

                                                                    <% }

                                                                    %>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Nama AJK:</label>
                                                                    <%                                                                        
                                                                        String aname = (String) request.getSession().getAttribute("ajkname");
                                                                        if (aname != null) {
                                                                    %>
                                                                    <input type="text" name="ajkname" value="<%=aname%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" name="ajkname" class="form-control" required>
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Kata Laluan AJK <button onclick="document.getElementById('menu').style.display = 'block'" class="w3-button w3-black"><i style="color: white;" class="fas fa-info-circle"></i></button>:</label>
                                                                    <div id="menu" class="w3-modal">
                                                                        <div class="w3-modal-content w3-animate-zoom">
                                                                            <div class="w3-container w3-black w3-display-container">
                                                                                <span onclick="document.getElementById('menu').style.display = 'none'" class="w3-button w3-display-topright w3-large">x</span>
                                                                                <h4 style="color: white;">Ciri-ciri kata laluan "Sangat Kuat"</h4>
                                                                            </div>
                                                                            <div class="w3-container">
                                                                                <h5><b><i style="color: greenyellow;" class="fas fa-check-square"></i></b> Satu Huruf Kecil </h5>
                                                                                <h5><b><i style="color: greenyellow;" class="fas fa-check-square"></i></b> Satu Huruf Besar </h5>
                                                                                <h5><b><i style="color: greenyellow;" class="fas fa-check-square"></i></b> Satu Nombor </h5>
                                                                                <h5><b><i style="color: greenyellow;" class="fas fa-check-square"></i></b> Minimum 8 karakter </h5>
                                                                                <h5><b><i style="color: greenyellow;" class="fas fa-check-square"></i></b> Satu Simbol </h5>

                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <input type="password" name="ajkpass" class="form-control" id="pwd" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" onkeyup="validatePassword(this.value);" required/><span id="msg"></span>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Ulang kata laluan:</label>
                                                                    <input type="password" name="ajkpass1" class="form-control" required>
                                                                    <%                                                                        
                                                                        String message7 = (String) request.getSession().getAttribute("passErrorMessage9");

                                                                        if (message7 != null) {


                                                                    %> 
                                                                    <label style="color: red;"><%=message7%></label>

                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>No Kad Pengenalan:</label>
                                                                    <%                                                                        
                                                                        String aic = (String) request.getSession().getAttribute("ajkic");
                                                                        if (aic != null) {
                                                                    %>
                                                                    <input type="text" name="ajkic" value="<%=aic%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" id="ajkic" name="ajkic" onblur="getIc()" class="form-control" required>
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Umur:</label>
                                                                    <%                                                                        
                                                                        String aage = (String) request.getSession().getAttribute("ajkage");
                                                                        if (aage != null) {
                                                                    %>
                                                                    <input type="text" name="ajkage" value="<%=aage%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" name="ajkage" id="lblAge" class="form-control" required>
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Tarikh Lahir:</label>
                                                                    <%                                                                        
                                                                        String adob = (String) request.getSession().getAttribute("ajkdob");
                                                                        if (adob != null) {
                                                                    %>
                                                                    <input type="text" name="ajkdob" value="<%=adob%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" id="ajkdob" name="ajkdob" class="form-control" required>
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Alamat:</label>
                                                                    <%                                                                        
                                                                        String aalamat = (String) request.getSession().getAttribute("ajkalamat");
                                                                        if (aalamat != null) {
                                                                    %>
                                                                    <input type="text" name="ajkalmt" value="<%=aalamat%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" name="ajkalmt" class="form-control" required>
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Mukim:</label>
                                                                    <%                                                                        
                                                                        String amukim = (String) request.getSession().getAttribute("ajkmukim");
                                                                        if (amukim != null) {
                                                                    %>
                                                                    <input type="text" name="ajkmukim" value="<%=amukim%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" name="ajkmukim" class="form-control" required>
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <label>Daerah:</label>
                                                                    <%                                                                        
                                                                        String adaerah = (String) request.getSession().getAttribute("ajkdaerah");
                                                                        if (adaerah != null) {
                                                                    %>
                                                                    <input type="text" name="ajkdaerah" value="<%=adaerah%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" name="ajkdaerah" class="form-control" required>
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">

                                                                    <label>No Telefon:</label>
                                                                    <%                                                                        
                                                                        String atelefon = (String) request.getSession().getAttribute("ajkntel");
                                                                        if (atelefon != null) {
                                                                    %>
                                                                    <input type="text" name="ajkntel" value="<%=atelefon%>" class="form-control" required>
                                                                    <%} else {%>
                                                                    <input type="text" name="ajkntel" class="form-control" placeholder="E.g 0123456789" required>
                                                                    <%}%>
                                                                    <%
                                                                        String errorAJk = (String) request.getSession().getAttribute("ajkerror1");

                                                                        if (errorAJk != null) {


                                                                    %> 
                                                                    <label style="color: red;"><%=errorAJk%></label>

                                                                    <% }

                                                                    %>
                                                                    <%                                                                        String errorAJk1 = (String) request.getSession().getAttribute("ajkerror");

                                                                        if (errorAJk1 != null) {


                                                                    %> 
                                                                    <label style="color: red;"><%=errorAJk1%></label>

                                                                    <% }

                                                                    %>

                                                                </div>
                                                            </div>
                                                            <input type="hidden" align="center" name="ajkcat"/>

                                                            <%                                                                if (lokasi != null) {
                                                            %>
                                                            <input type="hidden" align="center" value="<%=lokasi.getLokasiId()%>" name="lokid"/>
                                                            <%}%>
                                                            <div class="row form-group">
                                                                <div class="col-md-12">
                                                                    <input type="submit" class="btn btn-primary btn-block" value="Daftar Sekarang">
                                                                </div>
                                                            </div>
                                                    </form>	
                                                </div>
                                                <script>
                                                    var icNumber = document.getElementById("ajkic");
                                                    var Age = document.getElementById("lblAge");
                                                    var Birthdate = document.getElementById("ajkdob");

                                                    function getIc() {
                                                        const current_year = 2021;

                                                        var day = icNumber.value.substring(4, 6);
                                                        var month = icNumber.value.substring(2, 4);

                                                        var year = "19" + icNumber.value.substring(0, 2);
                                                        var intyear = parseInt(year);

                                                        var age = current_year - intyear;

                                                        var birthdate = day + "/" + month + "/" + year;

                                                        Age.value = age;
                                                        Birthdate.value = birthdate;


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

