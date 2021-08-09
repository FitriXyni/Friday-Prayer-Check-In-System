<%-- 
    Document   : processRA
    Created on : Apr 24, 2020, 8:59:39 PM
    Author     : FitriZaini
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, project.DBConnection, project.ajkDAO"%>
<jsp:useBean id="ajkmasjid" class="project.ajkmasjid" scope="request"/>
<jsp:setProperty name="ajkmasjid" property="ajkid" value='<%=request.getParameter("ajkid")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkname" value='<%=request.getParameter("ajkname")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkpass" value='<%=request.getParameter("ajkpass")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkic" value='<%=request.getParameter("ajkic")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkage" value='<%=request.getParameter("ajkage")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkdob" value='<%=request.getParameter("ajkdob")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkalmt" value='<%=request.getParameter("ajkalmt")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkmukim" value='<%=request.getParameter("ajkmukim")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkdaerah" value='<%=request.getParameter("ajkdaerah")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkntel" value='<%=request.getParameter("ajkntel")%>'/>
<jsp:setProperty name="ajkmasjid" property="ajkcat" value='<%=request.getParameter("ajkcat")%>'/>
<jsp:setProperty name="ajkmasjid" property="lokasiId" value='<%=Integer.parseInt(request.getParameter("lokasiId"))%>'/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register AJK Masjid</title>
    </head>
    <body>
        <%
            String ajkntel = request.getParameter("ajkntel");
            if (ajkntel != null) {

                Pattern pattern = Pattern.compile("^\\d{11}$");
                Matcher matcher = pattern.matcher(ajkntel);
                Pattern pattern1 = Pattern.compile("^\\d{10}$");
                Matcher matcher1 = pattern.matcher(ajkntel);

                if (matcher1.matches()) {

                    Connection connection = DBConnection.getConnection();
                    Statement st = connection.createStatement();
                    if (request.getMethod().equalsIgnoreCase("POST")) {
                        try {
                            String strQuery = "SELECT COUNT(*) FROM ajkmasjid where ajkntel='" + ajkntel + "'";
                            ResultSet rs = st.executeQuery(strQuery);
                            rs.next();
                            String Countrow = rs.getString(1);

                            if (Countrow.equals("0")) {

                                DBConnection database = new DBConnection();
                                ajkDAO ajkdao = new ajkDAO();
                                int result = ajkdao.addAJKMasjid(ajkmasjid);
                                out.println("<p>" + result + "</p>");

                                if (result > 0) {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert(\"Pendaftaran Berjaya\")");
                                    out.println("</script >");
                                    RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
                                    rd.include(request, response);
                                }

                                database.closeConnection();
                            } else {
                                session.setAttribute("ajkphonenumber", "Nombor yang dimasukkan tidak sah");
                                String path = "/registerAJKMasjid.jsp?id="+ajkmasjid.getLokasiId();

                                // forwards to the message page
                                getServletContext().getRequestDispatcher(path).forward(request, response);

                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(\"Number Telefon Anda Tidak Mengikut Spesifikasi!!\")");
                    out.println("</script >");
                    session.setAttribute("ajkphonenumber1", "Nombor tidak mengikut Spesifikasi");
                    String path = "/registerAJKMasjid.jsp?id="+ajkmasjid.getLokasiId();

                    // forwards to the message page
                    getServletContext().getRequestDispatcher(path).forward(request, response);

                }
            }

        %>

    </body>
</html>

