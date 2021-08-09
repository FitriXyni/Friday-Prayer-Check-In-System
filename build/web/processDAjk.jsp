<%-- 
    Document   : processDL
    Created on : May 5, 2020, 4:18:30 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.ajkDAO"%>
<%@page import="project.ajkmasjid"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete AJK Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            String ajkid = request.getParameter("ajkid");
            DBConnection database = new DBConnection();
            ajkDAO aDao = new ajkDAO();
            int result = aDao.deleteAJK(ajkid);
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Delete Lecturer\")");
                out.println("</script >");
                RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>

