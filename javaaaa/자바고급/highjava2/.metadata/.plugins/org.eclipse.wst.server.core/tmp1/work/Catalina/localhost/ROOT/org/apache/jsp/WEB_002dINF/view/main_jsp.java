/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.59
 * Generated at: 2023-05-19 08:50:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<title>참고용</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://moku.store/css/fonts.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"test.css?1684485497\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.4.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<header class=\"header\">\r\n");
      out.write("    <div class=\"container position-relative\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <header class=\"d-flex flex-wrap align-items-center justify-content-center justify-content-md-between\">\r\n");
      out.write("              <a href=\"/\" class=\"redapp-logo d-flex align-items-center col-md-3 mb-2 mb-md-0 text-decoration-none\">\r\n");
      out.write("                RedApp\r\n");
      out.write("              </a>\r\n");
      out.write("              <ul class=\"nav col-12 col-md-auto mb-2 justify-content-center mb-md-0\">\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a href=\"#\" class=\"nav-link\">Home</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    <a href=\"#\" class=\"nav-link\">커뮤니티 <div class=\"sidenav-collapse-arrow\"><i class=\"fas fa-angle-down\"></i></div></a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                        <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Something else here</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    <a href=\"#\" class=\"nav-link\">게임스토어 <div class=\"sidenav-collapse-arrow\"><i class=\"fas fa-angle-down\"></i></div></a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                        <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Something else here</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("              </ul>\r\n");
      out.write("              <div class=\"col-md-3 text-end member-info\">\r\n");
      out.write("                <a href=\"#\">로그인</a>\r\n");
      out.write("                <a href=\"#\">회원가입</a>\r\n");
      out.write("              </div>\r\n");
      out.write("            </header>\r\n");
      out.write("      </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</header>\r\n");
      out.write("<div class=\"content\">\r\n");
      out.write("    <div class=\"container position-relative\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("<div class=\"col-lg-12\">\r\n");
      out.write("    <div class=\"app-board\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-lg-4\">\r\n");
      out.write("                <div class=\"bbs-latest\">\r\n");
      out.write("                    <h2 class=\"bbs-title\"><a href=\"#\">게시판</a></h2>\r\n");
      out.write("                    <div class=\"box\">\r\n");
      out.write("                        <ul class=\"type-list\">\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"IC_URL/Notice/List#view=\"><h3><span>게시판 리스트</span></h3></a>\r\n");
      out.write("                                <dl class=\"article-info\"><dd><span class=\"date\">2023-01-01</span></dd></dl>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-lg-4\">\r\n");
      out.write("                <div class=\"bbs-latest\">\r\n");
      out.write("                    <h2 class=\"bbs-title\"><a href=\"#\">게시판</a></h2>\r\n");
      out.write("                    <div class=\"box\">\r\n");
      out.write("                        <ul class=\"type-list\">\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"IC_URL/Notice/List#view=\"><h3><span>게시판 리스트</span></h3></a>\r\n");
      out.write("                                <dl class=\"article-info\"><dd><span class=\"date\">2023-01-01</span></dd></dl>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-lg-4\">\r\n");
      out.write("                <div class=\"bbs-latest\">\r\n");
      out.write("                    <h2 class=\"bbs-title\"><a href=\"#\">게시판</a></h2>\r\n");
      out.write("                    <div class=\"box\">\r\n");
      out.write("                        <ul class=\"type-list\">\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"IC_URL/Notice/List#view=\"><h3><span>게시판 리스트</span></h3></a>\r\n");
      out.write("                                <dl class=\"article-info\"><dd><span class=\"date\">2023-01-01</span></dd></dl>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"col-lg-6\">\r\n");
      out.write("    <div class=\"app-list\">\r\n");
      out.write("        <div class=\"app_icon\"><img class=\"icon picLoad lazyload\" width=\"96\" height=\"96\" data-src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\" src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\"></div>\r\n");
      out.write("        <div class=\"app_icon\"><img class=\"icon picLoad lazyload\" width=\"96\" height=\"96\" data-src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\" src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\"></div>\r\n");
      out.write("        <div class=\"app_icon\"><img class=\"icon picLoad lazyload\" width=\"96\" height=\"96\" data-src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\" src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\"></div>\r\n");
      out.write("        <div class=\"app_icon\"><img class=\"icon picLoad lazyload\" width=\"96\" height=\"96\" data-src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\" src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\"></div>\r\n");
      out.write("        <div class=\"app_icon\"><img class=\"icon picLoad lazyload\" width=\"96\" height=\"96\" data-src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\" src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\"></div>\r\n");
      out.write("        <div class=\"app_icon\"><img class=\"icon picLoad lazyload\" width=\"96\" height=\"96\" data-src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\" src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\"></div>\r\n");
      out.write("        <div class=\"app_icon\"><img class=\"icon picLoad lazyload\" width=\"96\" height=\"96\" data-src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\" src=\"https://im5.pandahelp.vip/adverting/202112/1ca4fe94-a.jpg\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"col-lg-6\">\r\n");
      out.write("    <div class=\"app-review\">\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"col-lg-9\">\r\n");
      out.write("    <div class=\"app-ranking\">\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"col-lg-3\">\r\n");
      out.write("    <div class=\"app-users\">\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<footer class=\"footer\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <nav class=\"col-md-6\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"#\">사이트소개</a></li>\r\n");
      out.write("                    <li><a href=\"#\">서비스 약관</a></li>\r\n");
      out.write("                    <li><a href=\"#\">개인정보 처리방침</a></li>\r\n");
      out.write("                    <li><a href=\"#\">고객센터</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </nav>\r\n");
      out.write("            <div class=\"copyright col-md-6\">\r\n");
      out.write("                <p>Copyright ⓒ 2023 RedApp. All rights reserved.</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</footer>\r\n");
      out.write("<script>(function(){var js = \"window['__CF$cv$params']={r:'7c9b05d3ec58af24',m:'RZ2D8c3DTEI0qyvp83DxY9SrMZUALAL4.2bLxdAhKcY-1684485497-0-AeIjwhHNY04vsIEd+nqUNMwmlJYMXwKNHLBoTrRDKelq',u:'/cdn-cgi/challenge-platform/h/g'};_cpo=document.createElement('script');_cpo.nonce='',_cpo.src='/cdn-cgi/challenge-platform/scripts/invisible.js',document.getElementsByTagName('head')[0].appendChild(_cpo);\";var _0xh = document.createElement('iframe');_0xh.height = 1;_0xh.width = 1;_0xh.style.position = 'absolute';_0xh.style.top = 0;_0xh.style.left = 0;_0xh.style.border = 'none';_0xh.style.visibility = 'hidden';document.body.appendChild(_0xh);function handler() {var _0xi = _0xh.contentDocument || _0xh.contentWindow.document;if (_0xi) {var _0xj = _0xi.createElement('script');_0xj.nonce = '';_0xj.innerHTML = js;_0xi.getElementsByTagName('head')[0].appendChild(_0xj);}}if (document.readyState !== 'loading') {handler();} else if (window.addEventListener) {document.addEventListener('DOMContentLoaded', handler);} else {var prev = document.onreadystatechange || function () {};document.onreadystatechange = function (e) {prev(e);if (document.readyState !== 'loading') {document.onreadystatechange = prev;handler();}};}})();</script></body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
