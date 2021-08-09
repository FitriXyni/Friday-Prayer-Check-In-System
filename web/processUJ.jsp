<%-- 
    Document   : processUAjk
    Created on : Jan 18, 2021, 1:24:15 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.jemDAO"%>
<jsp:useBean id="jemaah" class="project.jemaah" scope="request"/>
<jsp:setProperty name="jemaah" property="jemName" value='<%=request.getParameter("jemname")%>'/>
<jsp:setProperty name="jemaah" property="jemPass" value='<%=request.getParameter("jempass")%>'/>
<jsp:setProperty name="jemaah" property="jemIC" value='<%=request.getParameter("jemic")%>'/>
<jsp:setProperty name="jemaah" property="jemAge" value='<%=request.getParameter("jemage")%>'/>
<jsp:setProperty name="jemaah" property="jemDOB" value='<%=request.getParameter("jemdob")%>'/>
<jsp:setProperty name="jemaah" property="jemAlamat" value='<%=request.getParameter("jemalamat")%>'/>
<jsp:setProperty name="jemaah" property="jemDaerah" value='<%=request.getParameter("jemdaerah")%>'/>
<jsp:setProperty name="jemaah" property="jemMukim" value='<%=request.getParameter("jemmukim")%>'/>
<jsp:setProperty name="jemaah" property="jemPoscode" value='<%=request.getParameter("jemposcode")%>'/>
<jsp:setProperty name="jemaah" property="jemTel" value='<%=request.getParameter("jemtel")%>'/>
<jsp:setProperty name="jemaah" property="jemCat" value='<%=request.getParameter("jemCat")%>'/>
<jsp:setProperty name="jemaah" property="jemId" value='<%=Integer.parseInt(request.getParameter("jemId"))%>'/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update AJK Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            DBConnection database = new DBConnection();
            jemDAO jDao = new jemDAO();
            int result = jDao.updateJemProfile(jemaah);
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Kemaskini Profil Berjaya\")");
                out.println("</script >");
                String path = "/jemaahInformation.jsp?id='"+jemaah.getJemId()+"'";
                RequestDispatcher rd = request.getRequestDispatcher(path);
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>
