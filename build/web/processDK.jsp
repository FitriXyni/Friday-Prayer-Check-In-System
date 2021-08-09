<%-- 
    Document   : processDL
    Created on : May 5, 2020, 4:18:30 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.kuotaDAO"%>
<%@page import="project.kuota"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Kuota Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            String kuotaId = request.getParameter("kuotaId");
            DBConnection database = new DBConnection();
            kuotaDAO kDao = new kuotaDAO();
            int result = kDao.deleteKuota(kuotaId) ;
            if (result > 0){
              
                RequestDispatcher rd = request.getRequestDispatcher("messageDK.jsp");
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>

