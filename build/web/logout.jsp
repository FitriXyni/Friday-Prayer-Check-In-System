<%-- 
    Document   : logout
    Created on : Jan 18, 2021, 12:13:58 AM
    Author     : Muhamad Nurfitri Bin Zaini
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("mainpage.jsp");
        %>
    </body>
</html>

