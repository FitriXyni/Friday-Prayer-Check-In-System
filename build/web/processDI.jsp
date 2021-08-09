<%-- 
    Document   : processDL
    Created on : May 5, 2020, 4:18:30 AM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.infoDAO"%>
<%@page import="project.info"%>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Info Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            String infoId = request.getParameter("infoId");
            DBConnection database = new DBConnection();
            infoDAO iDao = new infoDAO();
            int result = iDao.deleteInfo(infoId);
            if (result > 0){
              out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Info Solat Jumaat Berjaya Dipadam\")");
                out.println("</script >");
                RequestDispatcher rd = request.getRequestDispatcher("addFPI.jsp");
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>

