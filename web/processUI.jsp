<%-- 
    Document   : processUK
    Created on : Jan 18, 2021, 1:24:15 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.infoDAO"%>
<jsp:useBean id="info" class="project.info" scope="request"/>
<jsp:setProperty name="info" property="tajKhut" value='<%=request.getParameter("tajKhut")%>'/>
<jsp:setProperty name="info" property="imamName" value='<%=request.getParameter("imamName")%>'/>
<jsp:setProperty name="info" property="imamNTel" value='<%=request.getParameter("NTelImam")%>'/>
<jsp:setProperty name="info" property="bilalName" value='<%=request.getParameter("bilalName")%>'/>
<jsp:setProperty name="info" property="bilalNTel" value='<%=request.getParameter("NTelBilal")%>'/>
<jsp:setProperty name="info" property="infoId" value='<%=Integer.parseInt(request.getParameter("infoId"))%>'/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Quota Masjid</title>
    </head>
    <body style="font-family: century gothic">
        <%
            DBConnection database = new DBConnection();
            infoDAO iDao = new infoDAO();
            int result = iDao.updateInfo(info);
            if (result > 0){
                
                RequestDispatcher rd = request.getRequestDispatcher("messageIU.jsp");
                rd.include(request,response);
                
            }
            database.closeConnection();
        %>
        
    </body>
</html>
