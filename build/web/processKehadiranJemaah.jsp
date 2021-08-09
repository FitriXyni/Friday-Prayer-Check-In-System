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
        <title>Senarai Kehadiran Jemaah</title>
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
        int lokasiId = Integer.parseInt(request.getParameter("lokasiId"));
        
        String tempdate = ft1.format(c.getTime());
        DBConnection database = new DBConnection();
        List<tempahan> tempAll = tempDao.ListJemTem(lokasiId, tempdate);
        lokasiDAO lDao = new lokasiDAO();
        lokasi lokasi = locDao.retrieveOneLokasi1(lokasiId);
        database.closeConnection();
    %>
    <body>
        
        <% for (int i = 0; i < tempAll.size(); i++) {%>
        
        <%
        int tempId = Integer.parseInt(request.getParameter("tempId"+(i+1)));
        String Status = request.getParameter("status"+(i+1));
        tempahanDAO tDao = new tempahanDAO();
        tempahan tempahan = tempDao.reserveDetails3(tempId);
        tempahan.setStatusKehadiran(Status);
        int result = tempDao.updateJemaahStatus(tempahan);
        
        
        %>
        
        
        <%}%>
        <%
            out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Kehadiran Berjaya Disimpan\")");
                out.println("</script >");
                String path = "/senaraiJemaah1.jsp?id="+lokasi.getLokasiId();
                RequestDispatcher rd = request.getRequestDispatcher(path);
                rd.include(request,response);
        %>
    </body>
</html>
