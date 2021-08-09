<%-- 
    Document   : processRS
    Created on : Apr 24, 2020, 8:59:39 PM
    Author     : FitriZaini
--%>
<%@page import="project.jemaah"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.tempahanDAO"%>
<jsp:useBean id="tempahan" class="project.tempahan" scope="request"/>
<jsp:setProperty name="tempahan" property="lokasiId" value='<%=Integer.parseInt(request.getParameter("lokasiId"))%>'/>
<jsp:setProperty name="tempahan" property="jemId" value='<%=Integer.parseInt(request.getParameter("jemId"))%>'/>
<jsp:setProperty name="tempahan" property="jemname" value='<%=request.getParameter("jemname")%>'/>
<jsp:setProperty name="tempahan" property="tempDate" value='<%=request.getParameter("Rdate")%>'/>
<!DOCTYPE html>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

<%

    
    jemaah jemaah = (jemaah) request.getSession().getAttribute("jemaah");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Slot</title>
    </head>
    <body>
        <%
            session.removeAttribute("deniedReserve");
            
            String teDate = request.getParameter("Rdate");
            int jemID = Integer.parseInt(request.getParameter("jemId"));
            
            Connection connection = DBConnection.getConnection();
            Statement st = connection.createStatement();
            if (request.getMethod().equalsIgnoreCase("POST")) {
                try {
                    String strQuery = "SELECT COUNT(*) FROM tempahan where tempdate='" + teDate + "' AND jemId="+jemID;
                    ResultSet rs = st.executeQuery(strQuery);
                    rs.next();
                    String Countrow = rs.getString(1);

                    if (Countrow.equals("0")) {
                        DBConnection database = new DBConnection();
                        tempahanDAO tedao = new tempahanDAO();
                        int result = tedao.addTempahan(tempahan);
                        out.println("<p>" + result + "</p>");

                        if (result > 0) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert(\"Tempahan Slot Berjaya!!\")");
                            out.println("</script >");
                            String path = "/reservationList.jsp?id='" + tempahan.getJemId() + "'";
                            RequestDispatcher rd = request.getRequestDispatcher(path);
                            rd.include(request, response);
                            
                        }

                        database.closeConnection();
                    } else {
                        session.setAttribute("deniedReserve", "Tempahan anda ditolak, anda telah membuat tempahan slot di masjid lain");
                        String path = "/menuMasjid.jsp?jemPos=" + jemaah.getJemPoscode() + "&search2=" + teDate + "";

                        // forwards to the message page
                        getServletContext().getRequestDispatcher(path).forward(request, response);

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>

    </body>
</html>

