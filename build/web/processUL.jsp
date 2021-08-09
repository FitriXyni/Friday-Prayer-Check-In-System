<%-- 
    Document   : processUAjk
    Created on : Jan 18, 2021, 1:24:15 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.lokasiDAO"%>
<jsp:useBean id="lokasi" class="project.lokasi" scope="request"/>
<jsp:setProperty name="lokasi" property="namaMasjid" value='<%=request.getParameter("MasName")%>'/>
<jsp:setProperty name="lokasi" property="latitude" value='<%=request.getParameter("latitude")%>'/>
<jsp:setProperty name="lokasi" property="longitude" value='<%=request.getParameter("longitude")%>'/>
<jsp:setProperty name="lokasi" property="poskod" value='<%=request.getParameter("poscode")%>'/>
<jsp:setProperty name="lokasi" property="daerah" value='<%=request.getParameter("daerah")%>'/>
<jsp:setProperty name="lokasi" property="mukim" value='<%=request.getParameter("mukim")%>'/>
<jsp:setProperty name="lokasi" property="lokasiId" value='<%=Integer.parseInt(request.getParameter("locId"))%>'/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update AJK Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            DBConnection database = new DBConnection();
            lokasiDAO aDao = new lokasiDAO();
            int result = aDao.updateLokasi(lokasi);
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Kemaskini Perincian Lokasi Masjid Berjaya\")");
                out.println("</script >");
                String path = "/locList.jsp?id='"+lokasi.getLokasiId()+"'";
                RequestDispatcher rd = request.getRequestDispatcher(path);
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>
