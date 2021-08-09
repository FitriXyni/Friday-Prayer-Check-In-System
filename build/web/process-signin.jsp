<%-- 
    Document   : process-signin
    Created on : Jan 17, 2021, 5:38:07 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.loginAjk"%>
<%@page import="project.loginPJA"%>
<%@page import="project.loginJemaah"%>
<%@page import="project.loginWasing"%>
<%@page import="project.ajkmasjid"%>
<%@page import="project.ajkDAO"%>
<%@page import="project.pja"%>
<%@page import="project.pjaDAO"%>
<%@page import="project.jemaah"%>
<%@page import="project.jemDAO"%>
<%@page import="project.wargasing"%>
<%@page import="project.wargasingDAO"%>
<jsp:useBean id="obj" class="project.LoginBean"/>
<jsp:setProperty property="*" name="obj"/> 

<%
    String type = request.getParameter("type");

    //STUDENT SIGN IN
    if (type.equalsIgnoreCase("ajk1")) {
%>
<%
        boolean status = loginAjk.validate(obj);

        if (status) {

            String ajkntel = request.getParameter("notel");
            String ajkpass = request.getParameter("password");

            ajkmasjid ajkmasjid = ajkDAO.signinAJK(ajkntel, ajkpass);

            session.setAttribute("ajkmasjid", ajkmasjid);
            RequestDispatcher rd = request.getRequestDispatcher("serviceAJK.jsp");
            rd.include(request, response);

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Id atau Kata Laluan Salah!!!\")");
            out.println("</script >");
            RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
            rd.include(request, response);
        }
    } else if (type.equalsIgnoreCase("pja")) {

        boolean status = loginPJA.validate(obj);

        if (status) {

            String pjantEL = request.getParameter("notel");
            String pjaPass = request.getParameter("password");

            pja pja = pjaDAO.signinPJA(pjantEL, pjaPass);

            session.setAttribute("pja", pja);
            RequestDispatcher rd = request.getRequestDispatcher("servicePJA.jsp");
            rd.include(request, response);

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Id atau Kata Laluan Salah!!!\")");
            out.println("</script >");
            RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
            rd.include(request, response);
        }
    } else if (type.equalsIgnoreCase("jemaah")) {

        boolean status = loginJemaah.validate(obj);

        if (status) {

            String jemTel = request.getParameter("notel");
            String jemPass = request.getParameter("password");

            jemaah jemaah = jemDAO.signinJemaah(jemTel, jemPass);

            session.setAttribute("jemaah", jemaah);
            RequestDispatcher rd = request.getRequestDispatcher("serviceJemaah.jsp");
            rd.include(request, response);

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Id atau Kata Laluan Salah!!!\")");
            out.println("</script >");
            RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
            rd.include(request, response);
        }

    }else if (type.equalsIgnoreCase("jemaah2")) {

        boolean status = loginJemaah.validate(obj);

        if (status) {

            String wTel = request.getParameter("notel");
            String wPass = request.getParameter("password");

            jemaah jemaah = jemDAO.signinJemaah(wTel, wPass);

            session.setAttribute("jemaah", jemaah);
            RequestDispatcher rd = request.getRequestDispatcher("serviceJemaah.jsp");
            rd.include(request, response);

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Id atau Kata Laluan Salah!!!\")");
            out.println("</script >");
            RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
            rd.include(request, response);
        }
}
%>