<%-- 
    Document   : processRS
    Created on : Apr 24, 2020, 8:59:39 PM
    Author     : FitriZaini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.tempahanDAO"%>
<jsp:useBean id="tempahan1" class="project.tempahan" scope="request"/>
<jsp:setProperty name="tempahan1" property="lokasiId" value='<%=Integer.parseInt(request.getParameter("lokasiId"))%>'/>
<jsp:setProperty name="tempahan1" property="jemId" value='<%=Integer.parseInt(request.getParameter("jemId"))%>'/>
<jsp:setProperty name="tempahan1" property="jemname" value='<%=request.getParameter("jemname")%>'/>
<jsp:setProperty name="tempahan1" property="tempDate" value='<%=request.getParameter("Rdate")%>'/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Slot</title>
    </head>
    <body>
         <%
            DBConnection database = new DBConnection();
            tempahanDAO tedao1 = new tempahanDAO();
            int result = tedao1.addTempahan(tempahan1);
            out.println("<p>"+result+"</p>");
            
             if (result > 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Reserving Slot\")");
                out.println("</script >");
                RequestDispatcher rd = request.getRequestDispatcher("messageReservation.jsp");
                rd.include(request,response);
            }
            
            database.closeConnection();
         %>
         
    </body>
</html>

