<%-- 
    Document   : processUAjk
    Created on : Jan 18, 2021, 1:24:15 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.ajkDAO"%>
<jsp:useBean id="ajkmasjid" class="project.ajkmasjid" scope="request"/>
<jsp:setProperty name="ajkmasjid" property="ajkname" value='<%=request.getParameter("ajkname")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkpass" value='<%=request.getParameter("ajkpass")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkic" value='<%=request.getParameter("ajkic")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkage" value='<%=request.getParameter("ajkage")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkdob" value='<%=request.getParameter("ajkdob")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkalmt" value='<%=request.getParameter("ajkalmt")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkmukim" value='<%=request.getParameter("ajkmukim")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkdaerah" value='<%=request.getParameter("ajkdaerah")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkntel" value='<%=request.getParameter("ajkntel")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkid" value='<%=request.getParameter("ajkid")%>'/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update AJK Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            DBConnection database = new DBConnection();
            ajkDAO aDao = new ajkDAO();
            int result = aDao.updateAJKPassword(ajkmasjid);
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Kemaskini Profil berjaya\")");
                out.println("</script >");
                String path = "/AJKInformation.jsp?id='"+ajkmasjid.getAjkid()+"'";
                RequestDispatcher rd = request.getRequestDispatcher(path);
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>
