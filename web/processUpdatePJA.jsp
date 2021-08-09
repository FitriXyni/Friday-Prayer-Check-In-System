<%-- 
    Document   : processUAjk
    Created on : Jan 18, 2021, 1:24:15 AM
    Author     : Admin
--%>

<%@page import="project.pja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.pjaDAO"%>
<jsp:useBean id="pja" class="project.pja" scope="request"/>
<jsp:setProperty name="pja" property="pjaName" value='<%=request.getParameter("pjaname")%>'/>
<jsp:setProperty name="pja" property="pjaPass" value='<%=request.getParameter("pjapass")%>'/>
<jsp:setProperty name="pja" property="pjantEL" value='<%=request.getParameter("pjantel")%>'/>
<jsp:setProperty name="pja" property="pjaIC" value='<%=request.getParameter("pjaic")%>'/>
<jsp:setProperty name="pja" property="pjaDaerah" value='<%=request.getParameter("pjadaerah")%>'/>
<jsp:setProperty name="pja" property="pjaMukim" value='<%=request.getParameter("pjamukim")%>'/>
<jsp:setProperty name="pja" property="pjaId" value='<%=request.getParameter("pjaId")%>'/>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update PJA </title>
    </head>
    <body style="font-family: century gothic">
        <%
            DBConnection database = new DBConnection();
            pjaDAO pDao = new pjaDAO();
            int result = pDao.updatePJA(pja);
            
            if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Kemaskini data Pegawai Jabatan Agama Berjaya\")");
                out.println("</script >");
                String path = "/pjaInformation.jsp?id='"+pja.getPjaId()+"'";
                RequestDispatcher rd = request.getRequestDispatcher(path);
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>
