/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.88
 * Generated at: 2023-06-08 07:56:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import kr.or.dw.util.PaginationUtil;
import kr.or.dw.customer.vo.NoticeVO;
import java.util.List;

public final class notice_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/view/customer/../gnb.jsp", Long.valueOf(1686210880767L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("kr.or.dw.util.PaginationUtil");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("kr.or.dw.customer.vo.NoticeVO");
    _jspx_imports_classes.add("java.text.DateFormat");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<title>RedApp</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print( request.getContextPath());
      out.write("/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print( request.getContextPath());
      out.write("/css/font-awesome.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print( request.getContextPath());
      out.write("/css/fonts.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print( request.getContextPath());
      out.write("/css/notice.css\">\r\n");
      out.write("<script src=\"");
      out.print( request.getContextPath());
      out.write("/js/jquery-3.6.4.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print( request.getContextPath());
      out.write("/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print( request.getContextPath());
      out.write("/js/all.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print( request.getContextPath());
      out.write("/js/clipboard.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/alert.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/alert.min.css\">\r\n");

	NoticeVO noticeVo = (NoticeVO)request.getAttribute("noticeVo");
	List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("// 자바스크립트 & 제이쿼리에서 사용하는 데이터 정보 함수\r\n");
      out.write("// var is_member = '<?php echo isset($is_member)?$is_member:''; ?>';\r\n");
      out.write("// var is_admin  = '<?php echo isset($is_admin)?$is_admin:''; ?>';\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print( request.getContextPath());
      out.write("/css/gnb.css\">\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/alert.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/alert.min.css\">\r\n");
      out.write("<!-- 글로벌 네비게이션 바 부분 -->\r\n");
      out.write("<header class=\"gnb\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"logo\"><a href=\"");
      out.print( request.getContextPath());
      out.write("/main.do\"><img src=\"../img/gnb_redapp_logo_v2.png\"></a></div>\r\n");
      out.write("        <div class=\"gnbBarLeft\">\r\n");
      out.write("            <div class=\"gnbAllmenu\">\r\n");
      out.write("                 <a href=\"#gnbAllLayer\" data-bs-toggle=\"offcanvas\" data-bs-target=\"#gnbAllLayer\" aria-controls=\"gnbAllLayer\">\r\n");
      out.write("                    <span class=\"gnbIcon\"></span><span class=\"text\">메뉴</span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div> \r\n");
      out.write("        <div class=\"gnbBarRight\">\r\n");
      out.write("            <div class=\"member-info\">\r\n");
      out.write("                ");

                	Object user_no = session.getAttribute("user_no");
                	Object auth_cd = session.getAttribute("auth_cd");
                	if(user_no != null){
                
      out.write("\r\n");
      out.write("                <a class=\"btn btn-basic\" href=\"");
      out.print(request.getContextPath());
      out.write("/member/logout.do\">로그아웃</a>\r\n");
      out.write("                ");
} else {
      out.write("\r\n");
      out.write("                <a class=\"btn btn-basic\" href=\"");
      out.print(request.getContextPath());
      out.write("/member/loginForm.do\">로그인</a>\r\n");
      out.write("         		");
} 
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</header>\r\n");
      out.write("<div class=\"offcanvas offcanvas-start gnbAllLayer\" data-bs-scroll=\"true\" tabindex=\"-1\" id=\"gnbAllLayer\" aria-labelledby=\"gnbAllLayerLabel\">\r\n");
      out.write("    <div class=\"gnbTitle\">\r\n");
      out.write("        <h2>Global Navigation Bar</h2>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"gnbLayerBt\">\r\n");
      out.write("        <a href=\"#\" data-bs-dismiss=\"offcanvas\" aria-label=\"Close\">\r\n");
      out.write("            <span class=\"gnbIcon\"></span>\r\n");
      out.write("        </a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"gnbMyLayer\">\r\n");
      out.write("        <div class=\"gnbList\">\r\n");
      out.write("            <div class=\"gnbCell\">\r\n");
      out.write("                <h3><a href=\"");
      out.print( request.getContextPath());
      out.write("/main.do\">HOME <i class=\"bi bi-link-45deg\"></i></a></h3>\r\n");
      out.write("                <h3><a href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do?g=3\">게임 라운지 <i class=\"bi bi-link-45deg\"></i></a></h3>\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do?g=1\">다운랭킹</a></li>\r\n");
      out.write("                    <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do?g=2\">구독랭킹</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"gnbCell\">\r\n");
      out.write("                <h3><a href=\"https://news.kmib.co.kr/article/list.asp?sid1=spo&sid2=0012\">e스포츠 <i class=\"bi bi-link-45deg\"></i></a></h3>\r\n");
      out.write("                <h3><a href=\"");
      out.print( request.getContextPath());
      out.write("/customer/notice.do\">고객센터 <i class=\"bi bi-link-45deg\"></i></a></h3>\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"javascript:alert('개발 준비중 입니다.','self_close');\">사이트소개</a></li>\r\n");
      out.write("                    <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/customer/notice.do\">공지사항</a></li>\r\n");
      out.write("                    <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/customer/faq.do\">자주묻는질문</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"gnbListService\">\r\n");
      out.write("        <h2 class=\"d-none\">서비스</h2>\r\n");
      out.write("        <ul>\r\n");
      out.write("            <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/member/myinfo.do\"><span></span>내정보</a></li>\r\n");
      out.write("            <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/customer/notice.do\"><span></span>고객센터</a></li>\r\n");
      out.write("            <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/customer/notice.do\"><span></span>공지사항</a></li>\r\n");
      out.write("            <li><a href=\"");
      out.print( request.getContextPath());
      out.write("/customer/faq.do\"><span></span>자주묻는질문</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("        <a class=\"gnbBtAll\" href=\"");
      out.print( request.getContextPath());
      out.write("/customer/sitemap.do\">전체서비스</a>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("<div class=\"customer\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <ul class=\"tablist\">\r\n");
      out.write("                <li><a href=\"javascript:alert('개발 준비중 입니다.','self_close');\">사이트소개</a></li>\r\n");
      out.write("                <li class=\"active\"><a href=\"");
request.getContextPath(); 
      out.write("/customer/notice.do\">공지사항</a></li>\r\n");
      out.write("                <li><a href=\"");
request.getContextPath(); 
      out.write("/customer/faq.do\">자주묻는질문</a></li>\r\n");
      out.write("                <li><a href=\"");
request.getContextPath(); 
      out.write("/customer/sitemap.do\">전체서비스</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");

if (noticeVo == null) {

      out.write("\r\n");
      out.write("<div class=\"notice-wrapper\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"table-list\">\r\n");
      out.write("            <ul class=\"list clearfix\">\r\n");
      out.write("            ");

            	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            	for(NoticeVO notice : noticeList) { 
            
      out.write("\r\n");
      out.write("                <li class=\"dep1\">\r\n");
      out.write("                    <div class=\"fL leftInfo d-none d-md-block\"><span class=\"sort\">");
      out.print( notice.getN_no() );
      out.write("</span></div>\r\n");
      out.write("                    <div class=\"fL titInfo\">\r\n");
      out.write("                        <p class=\"tit\"><a href=\"");
      out.print( request.getContextPath());
      out.write("/customer/noticeView.do?n_no=");
      out.print( notice.getN_no());
      out.write('"');
      out.write('>');
      out.print( notice.getN_title() );
      out.write("</a></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"etc d-none d-md-block\">\r\n");
      out.write("                        <ul class=\"clearfix\">\r\n");
      out.write("                            <li class=\"date\">\r\n");
      out.write("                                <span class=\"ico\"><img src=\"https://moku.store/img/common/ico_time.png\" alt=\"time\"></span>\r\n");
      out.write("                                <span>");
      out.print(formatter.format(notice.getN_wdt()) );
      out.write("</span>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </li>\r\n");
      out.write("            ");
} 
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("            <div class=\"table-paging\">\r\n");
      out.write("				");

                   PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");
                
      out.write("\r\n");
      out.write("                ");
      out.print( pagination.getPaginationHtml(request, new String[] {"search"}) );
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");

}else{

      out.write("\r\n");
      out.write("<div class=\"notice-wrapper\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"board-view\">\r\n");
      out.write("            <div class=\"phead\">\r\n");
      out.write("                <div class=\"title\">\r\n");
      out.write("                    ");
      out.print( noticeVo.getN_title());
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"right\">\r\n");
      out.write("                    <div class=\"category\">\r\n");
      out.write("                        공지\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <span class=\"date\">");
      out.print( noticeVo.getN_wdt());
      out.write("</span>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"pbody\">\r\n");
      out.write("                <div class=\"ck-content\">\r\n");
      out.write("                    <p>");
      out.print( noticeVo.getN_content());
      out.write("</p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"btnArea\">\r\n");
      out.write("                <div class=\"sns\">\r\n");
      out.write("                    <ul class=\"clearfix\">\r\n");
      out.write("                        <li class=\"link\"><a href=\"#\" onclick=\"return false;\" data-clipboard-text=\"localhost/customer/noticeView.do?n_no=");
      out.print( noticeVo.getN_no());
      out.write("\" class=\"btnUrlCopyToClipboard\">주소복사</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"btmBtns\">\r\n");
      out.write("                <ul class=\"clearfix\">\r\n");
      out.write("                    <li class=\"list\"><a href=\"");
request.getContextPath(); 
      out.write("/customer/notice.do\">목록</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
} 
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("$(document).ready(function () {\r\n");
      out.write("  new ClipboardJS('.btnUrlCopyToClipboard');\r\n");
      out.write("  $('.btnUrlCopyToClipboard').on(\"click\", function () {\r\n");
      out.write("    alert(\"복사되었습니다.\"); \r\n");
      out.write("  });\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
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
