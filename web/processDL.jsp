<%-- 
    Document   : processDL
    Created on : May 5, 2020, 4:18:30 AM
    Author     : Admin
--%>

<%@page import="project.pja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.lokasiDAO"%>
<%@page import="project.lokasi"%>


<!DOCTYPE html>
<%

    pja pja = (pja) request.getSession().getAttribute("pja");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete AJK Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            String lokasiId = request.getParameter("lokasiId");
            DBConnection database = new DBConnection();
            lokasiDAO locDao = new lokasiDAO();
            int result = locDao.deleteLoc(lokasiId);
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Padam Lokasi Masjid Berjaya\")");
                out.println("</script >");
                String path = "/masList1.jsp?daerah="+pja.getPjaDaerah()+"&mukim="+pja.getPjaMukim();
                RequestDispatcher rd = request.getRequestDispatcher(path);
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>

