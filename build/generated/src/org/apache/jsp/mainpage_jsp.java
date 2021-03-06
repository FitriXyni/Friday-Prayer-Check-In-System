package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class mainpage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<!--\n");
      out.write("        Aesthetic by gettemplates.co\n");
      out.write("        Twitter: http://twitter.com/gettemplateco\n");
      out.write("        URL: http://gettemplates.co\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"icon\" href=\"/FridayPrayer/images/fpci.jpg\" type=\"image/gif\" sizes=\"16x16\">\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <title>Friday Prayer Check In System</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta name=\"description\" content=\"Free HTML5 Website Template by GetTemplates.co\" />\n");
      out.write("        <meta name=\"keywords\" content=\"free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive\" />\n");
      out.write("        <meta name=\"author\" content=\"GetTemplates.co\" />\n");
      out.write("\n");
      out.write("        <!-- Facebook and Twitter integration -->\n");
      out.write("        <meta property=\"og:title\" content=\"\"/>\n");
      out.write("        <meta property=\"og:image\" content=\"\"/>\n");
      out.write("        <meta property=\"og:url\" content=\"\"/>\n");
      out.write("        <meta property=\"og:site_name\" content=\"\"/>\n");
      out.write("        <meta property=\"og:description\" content=\"\"/>\n");
      out.write("        <meta name=\"twitter:title\" content=\"\" />\n");
      out.write("        <meta name=\"twitter:image\" content=\"\" />\n");
      out.write("        <meta name=\"twitter:url\" content=\"\" />\n");
      out.write("        <meta name=\"twitter:card\" content=\"\" />\n");
      out.write("\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,700\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Kaushan+Script\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Animate.css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/animate.css\">\n");
      out.write("        <!-- Icomoon Icon Fonts-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/icomoon.css\">\n");
      out.write("        <!-- Themify Icons-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/themify-icons.css\">\n");
      out.write("        <!-- Bootstrap  -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("\n");
      out.write("        <!-- Magnific Popup -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/magnific-popup.css\">\n");
      out.write("\n");
      out.write("        <!-- Bootstrap DateTimePicker -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap-datetimepicker.min.css\">\n");
      out.write("\n");
      out.write("        <!-- Owl Carousel  -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.carousel.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.theme.default.min.css\">\n");
      out.write("\n");
      out.write("        <!-- Theme style  -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("\n");
      out.write("        <!-- Modernizr JS -->\n");
      out.write("        <script src=\"js/modernizr-2.6.2.min.js\"></script>\n");
      out.write("        <!-- FOR IE9 below -->\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("        <script src=\"js/respond.min.js\"></script>\n");
      out.write("        <![endif]-->\n");
      out.write("        <script src=\"https://kit.fontawesome.com/889366029b.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"gtco-loader\"></div>\n");
      out.write("\n");
      out.write("        <div id=\"page\">\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!-- <div class=\"page-inner\"> -->\n");
      out.write("            <nav class=\"gtco-nav\" role=\"navigation\">\n");
      out.write("                <div class=\"gtco-container\">\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-sm-4 col-xs-12\">\n");
      out.write("                            <div id=\"gtco-logo\"><a href=\"landingPage.jsp\">FPCI SYSTEM <em>.</em></a></div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-xs-8 text-right menu-1\">\n");
      out.write("                            <ul>\n");
      out.write("                                <li><a href=\"resume.jsp\">Pembangun Sistem</a></li>\n");
      out.write("                                \n");
      out.write("                                <li><a href=\"contact.jsp\">Hubungi Kami</a></li>\n");
      out.write("                                <li class=\"btn-cta\"><a href=\"userCat.jsp\"><span>Daftar Masuk</span></a></li>\n");
      out.write("\n");
      out.write("                            </ul>\t\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <header id=\"gtco-header\" class=\"gtco-cover gtco-cover-md\" role=\"banner\" style=\"background-image: url(images/p1.jpg)\" data-stellar-background-ratio=\"0.5\">\n");
      out.write("                <div class=\"overlay\"></div>\n");
      out.write("                <div class=\"gtco-container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-12 col-md-offset-0 text-left\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <div class=\"row row-mt-15em1\">\n");
      out.write("                                <div class=\"col-md-7 mt-text animate-box\" data-animate-effect=\"fadeInUp\">\n");
      out.write("\n");
      out.write("                                    <h1 style=\"text-align: center;\" class=\"cursive-font\">Niat kerana Allah!</h1><br>\n");
      out.write("                                    <p style=\"text-align: center;\">?????????????????????? ?????????? ?????????????? ?????????? ?????????? ???????????????? ?????? ?????????????????? ???????????? ???????????????????? ???????????? ?????????????????? ???????? ?????????????????? ???????? ?????????????? ???????? ??????????????<p>\n");
      out.write("                                    <p style=\"text-align: justify;\">Maksudnya : ???Solat Jumaat merupakan satu hak kewajipan ke atas setiap orang muslim untuk mendirikannya secara berjemaah, kecuali hamba yang dimiliki oleh tuannya, perempuan, kanak-kanak dan orang yang sakit.??? Riwayat Abu Daud (1067)</p>\n");
      out.write("                                    \n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-4 col-md-push-1 animate-box\" data-animate-effect=\"fadeInRight\">\n");
      out.write("                                    <div class=\"form-wrap\">\n");
      out.write("                                        <div class=\"tab\">\n");
      out.write("\n");
      out.write("                                            <div class=\"tab-content\">\n");
      out.write("                                                <div class=\"tab-content-inner active\" data-content=\"signup\">\n");
      out.write("                                                    <h3 style=\"text-align: center;\" class=\"cursive-font\">Borang Log Masuk</h3>\n");
      out.write("                                                    <form action=\"process-signin.jsp\" method=\"post\">\n");
      out.write("                                                        <div class=\"row form-group\">\n");
      out.write("                                                            <div class=\"col-md-12\">\n");
      out.write("                                                                <label>Kategori</label><br>\n");
      out.write("                                                                <input type=\"radio\" name=\"type\" value=\"jemaah\">\n");
      out.write("                                                                <label>Jemaah Masjid</label><br>\n");
      out.write("                                                                <input type=\"radio\" name=\"type\" value=\"jemaah2\">\n");
      out.write("                                                                <label>Warga Asing</label><br>\n");
      out.write("                                                                <input type=\"radio\" name=\"type\" value=\"ajk1\">\n");
      out.write("                                                                <label>AJK Masjid</label><br>\n");
      out.write("                                                                <input type=\"radio\" name=\"type\" value=\"pja\">\n");
      out.write("                                                                <label>Pegawai Jabatan Agama</label>\n");
      out.write("\n");
      out.write("                                                            </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                                        <div class=\"row form-group\">\n");
      out.write("                                                            <div class=\"col-md-12\">\n");
      out.write("                                                                <label>Nombor Telefon:</label>\n");
      out.write("                                                                <input type=\"text\" name=\"notel\" class=\"form-control\">\n");
      out.write("                                                            </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                                        <div class=\"row form-group\">\n");
      out.write("                                                            <div class=\"col-md-12\">\n");
      out.write("                                                                <label>Kata Laluan:</label>\n");
      out.write("                                                                <input type=\"password\" name=\"password\" class=\"form-control\">\n");
      out.write("                                                            </div>\n");
      out.write("                                                        </div>\n");
      out.write("\n");
      out.write("                                                        <div class=\"row form-group\">\n");
      out.write("                                                            <div class=\"col-md-12\">\n");
      out.write("                                                                <input type=\"submit\" class=\"btn btn-primary btn-block\" value=\"Log Masuk Sekarang\">\n");
      out.write("                                                            </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </form>\t\n");
      out.write("                                                </div>\n");
      out.write("                                                \n");
      out.write("\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </header>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <footer id=\"gtco-footer\" role=\"contentinfo\" style=\"background-image: url(images/img_bg_1.jpg)\" data-stellar-background-ratio=\"0.5\">\n");
      out.write("                <div class=\"overlay\"></div>\n");
      out.write("                <div class=\"gtco-container\">\n");
      out.write("                    <div class=\"row row-pb-md\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-12 text-center\">\n");
      out.write("                            <div class=\"gtco-widget\">\n");
      out.write("                                <h3>Segala Kesulitan, berhubung dengan maklumat dibawah:</h3>\n");
      out.write("                                <ul class=\"gtco-quick-contact\">\n");
      out.write("                                    <li><a href=\"#\"><i class=\"icon-phone\"></i> +06 019-7935208</a></li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"icon-mail2\"></i> nurfitrixyni@gmail.com</a></li>\n");
      out.write("                                    <li><a href=\"https://wa.me/60197935208\"><i class=\"icon-chat\"></i> Live Chat</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"gtco-widget\">\n");
      out.write("                                <h3>Media Sosial</h3>\n");
      out.write("                                <ul class=\"gtco-social-icons\">\n");
      out.write("                                    <li><a href=\"#\"><i class=\"icon-twitter\"></i></a></li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"icon-facebook\"></i></a></li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"icon-linkedin\"></i></a></li>\n");
      out.write("                                    <li><a href=\"#\"><i class=\"icon-dribbble\"></i></a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-12 text-center copyright\">\n");
      out.write("                            <p><small class=\"block\">&copy; 2021 Project Tahun Akhir S52188</small> \n");
      out.write("                                <small class=\"block\">Dibangunkan oleh Muhamad Nurfitri Bin Zaini </small></p>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </footer>\n");
      out.write("            <!-- </div> -->\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"gototop js-top\">\n");
      out.write("            <a href=\"#\" class=\"js-gotop\"><i class=\"icon-arrow-up\"></i></a>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- jQuery -->\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\n");
      out.write("        <!-- jQuery Easing -->\n");
      out.write("        <script src=\"js/jquery.easing.1.3.js\"></script>\n");
      out.write("        <!-- Bootstrap -->\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- Waypoints -->\n");
      out.write("        <script src=\"js/jquery.waypoints.min.js\"></script>\n");
      out.write("        <!-- Carousel -->\n");
      out.write("        <script src=\"js/owl.carousel.min.js\"></script>\n");
      out.write("        <!-- countTo -->\n");
      out.write("        <script src=\"js/jquery.countTo.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Stellar Parallax -->\n");
      out.write("        <script src=\"js/jquery.stellar.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Magnific Popup -->\n");
      out.write("        <script src=\"js/jquery.magnific-popup.min.js\"></script>\n");
      out.write("        <script src=\"js/magnific-popup-options.js\"></script>\n");
      out.write("\n");
      out.write("        <script src=\"js/moment.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap-datetimepicker.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Main -->\n");
      out.write("        <script src=\"js/main.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
