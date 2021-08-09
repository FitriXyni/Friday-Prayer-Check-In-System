<%-- 
    Document   : processDL
    Created on : May 5, 2020, 4:18:30 AM
    Author     : Admin
--%>

<%@page import="project.jemaah"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.tempahanDAO"%>
<%@page import="project.tempahan"%>
<%

    jemaah jemaah = (jemaah) request.getSession().getAttribute("jemaah");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Reservation</title>
    </head>
    <body style="font-family: century gothic">
        <%
            String tempId = request.getParameter("id");
            DBConnection database = new DBConnection();
            tempahanDAO tDao = new tempahanDAO();
            int result = tDao.deleteJemReservation(tempId);
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Padam Tempahan Slot telah Berjaya\")");
                out.println("</script >");
                String path = "/reservationList1.jsp?id="+jemaah.getJemId();
                RequestDispatcher rd = request.getRequestDispatcher(path);
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>

