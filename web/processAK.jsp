<%-- 
    Document   : processUAjk
    Created on : Jan 18, 2021, 1:24:15 AM
    Author     : Admin
--%>
<%@page import="project.ajkmasjid"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.lokasiDAO"%>
<jsp:useBean id="lokasi" class="project.lokasi" scope="request"/>
<jsp:setProperty name="lokasi" property="kuotaProv" value='<%=Integer.parseInt(request.getParameter("kuotaPrd"))%>'/>
<jsp:setProperty name="lokasi" property="kuodate" value='<%=request.getParameter("kuotadate")%>'/>
<jsp:setProperty name="lokasi" property="lokasiId" value='<%=Integer.parseInt(request.getParameter("lokasiId"))%>'/>

<!DOCTYPE html>
<%

    ajkmasjid ajkmasjid = (ajkmasjid) request.getSession().getAttribute("ajkmasjid");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kemaskini Kuota Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            DBConnection database = new DBConnection();
            lokasiDAO aDao = new lokasiDAO();
            int result = aDao.updateKuotasLokasi(lokasi);
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Kemaskini Kuota Berjaya\")");
                out.println("</script >");
                String path = "/kuotaInfo.jsp?id='"+ajkmasjid.getAjkid()+"'";
                RequestDispatcher rd = request.getRequestDispatcher(path);
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>
