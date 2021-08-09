<%-- 
    Document   : processUK
    Created on : Jan 18, 2021, 1:24:15 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.kuotaDAO"%>
<jsp:useBean id="kuota" class="project.kuota" scope="request"/>
<jsp:setProperty name="kuota" property="kuotaPrd" value='<%=request.getParameter("kuotaPrd")%>'/>
<jsp:setProperty name="kuota" property="kuotaDate" value='<%=request.getParameter("dateKuota")%>'/>
<jsp:setProperty name="kuota" property="kuotaTime" value='<%=request.getParameter("timeKuota")%>'/>
<jsp:setProperty name="kuota" property="kuotaId" value='<%=Integer.parseInt(request.getParameter("kuotaId"))%>'/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Quota Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            DBConnection database = new DBConnection();
            kuotaDAO kDao = new kuotaDAO();
            int result = kDao.updateKuota(kuota);
            if (result > 0){
                
                RequestDispatcher rd = request.getRequestDispatcher("messageKU.jsp");
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>
