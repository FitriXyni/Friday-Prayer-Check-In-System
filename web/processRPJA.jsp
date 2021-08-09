<%-- 
    Document   : processRA
    Created on : Apr 24, 2020, 8:59:39 PM
    Author     : FitriZaini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.pjaDAO"%>
<jsp:useBean id="pja" class="project.pja" scope="request"/>
<jsp:setProperty name="pja" property="pjaId" value='<%=request.getParameter("pjaid")%>'/>
<jsp:setProperty name="pja" property="pjaName" value='<%=request.getParameter("pjaname")%>'/>
<jsp:setProperty name="pja" property="pjaPass" value='<%=request.getParameter("pjapass")%>'/>
<jsp:setProperty name="pja" property="pjantEL" value='<%=request.getParameter("pjantel")%>'/>
<jsp:setProperty name="pja" property="pjaIC" value='<%=request.getParameter("pjaic")%>'/>
<jsp:setProperty name="pja" property="pjaDaerah" value='<%=request.getParameter("pjadaerah")%>'/>
<jsp:setProperty name="pja" property="pjaMukim" value='<%=request.getParameter("pjamukim")%>'/>
<jsp:setProperty name="pja" property="pjaCat" value='<%=request.getParameter("pjacat")%>'/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register AJK Masjid</title>
    </head>
    <body>
         <%
            DBConnection database = new DBConnection();
            pjaDAO pjadao = new pjaDAO();
            int result = pjadao.addPJA(pja);
            out.println("<p>"+result+"</p>");
            
             if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Pendaftaran Berjaya\")");
                out.println("</script >");
                RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
                rd.include(request,response);
            }
            
            database.closeConnection();
         %>
         
    </body>
</html>

