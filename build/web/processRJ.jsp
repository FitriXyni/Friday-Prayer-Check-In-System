<%-- 
    Document   : processRA
    Created on : Apr 24, 2020, 8:59:39 PM
    Author     : FitriZaini
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


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Jemaah Masjid</title>
    </head>
    <body>
         <%
            DBConnection database = new DBConnection();
            jemDAO jemdao = new jemDAO();
            int result = jemdao.addJemMasjid(jemaah);
            out.println("<p>"+result+"</p>");
            
             if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Pendaftaran Berjaya!!\")");
                out.println("</script >");
                RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
                rd.include(request,response);
            }
            
            database.closeConnection();
         %>
         
    </body>
</html>

