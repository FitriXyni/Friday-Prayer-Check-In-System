<%-- 
    Document   : processRA
    Created on : Apr 24, 2020, 8:59:39 PM
    Author     : FitriZaini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.wargasingDAO"%>
<jsp:useBean id="wargasing" class="project.wargasing" scope="request"/>
<jsp:setProperty name="wargasing" property="wName" value='<%=request.getParameter("wname")%>'/>
<jsp:setProperty name="wargasing" property="wPass" value='<%=request.getParameter("wpass")%>'/>
<jsp:setProperty name="wargasing" property="wPassport" value='<%=request.getParameter("wpassport")%>'/>
<jsp:setProperty name="wargasing" property="wAge" value='<%=request.getParameter("wage")%>'/>
<jsp:setProperty name="wargasing" property="wPoscode" value='<%=request.getParameter("wposcode")%>'/>
<jsp:setProperty name="wargasing" property="wTel" value='<%=request.getParameter("wtel")%>'/>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Jemaah Warga Asing</title>
    </head>
    <body>
         <%
            DBConnection database = new DBConnection();
            wargasingDAO wadao = new wargasingDAO();
            int result = wadao.addWargasing(wargasing);
            out.println("<p>"+result+"</p>");
            
             if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Add Record\")");
                out.println("</script >");
                RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
                rd.include(request,response);
            }
            
            database.closeConnection();
         %>
         
    </body>
</html>

