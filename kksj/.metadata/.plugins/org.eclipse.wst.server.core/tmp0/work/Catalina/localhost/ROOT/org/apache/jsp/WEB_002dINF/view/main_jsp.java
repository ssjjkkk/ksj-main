/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.88
 * Generated at: 2023-06-08 07:47:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.member.vo.MemberVO;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import kr.or.dw.customer.vo.NoticeVO;
import java.util.List;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("kr.or.dw.lounge.vo.LoungeVO");
    _jspx_imports_classes.add("org.w3c.dom.Element");
    _jspx_imports_classes.add("org.w3c.dom.NodeList");
    _jspx_imports_classes.add("kr.or.dw.member.vo.MemberVO");
    _jspx_imports_classes.add("org.w3c.dom.Document");
    _jspx_imports_classes.add("kr.or.dw.ranking.vo.GameVO");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("javax.xml.parsers.DocumentBuilderFactory");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
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
      out.print(request.getContextPath());
      out.write("/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/fonts.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/swiper.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/style.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/alert.min.css\">\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery-3.6.4.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/swiper.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/alert.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("// 자바스크립트 & 제이쿼리에서 사용하는 데이터 정보 함수\r\n");
      out.write("// var is_member = '<?php echo isset($is_member)?$is_member:''; ?>';\r\n");
      out.write("// var is_admin  = '<?php echo isset($is_admin)?$is_admin:''; ?>';\r\n");
      out.write("$(function () {\r\n");
      out.write("   $()\r\n");
      out.write("})\r\n");
      out.write("</script>\r\n");

   List<NoticeVO> noticeList = (List<NoticeVO>)request.getAttribute("noticeList");
   
   List<MemberVO> adminList = (List<MemberVO>)request.getAttribute("adminList");
   
   List<GameVO> gameList = (List<GameVO>)request.getAttribute("gameList");
   List<GameVO> gameHList = (List<GameVO>)request.getAttribute("gameHList");
   List<GameVO> gameJList = (List<GameVO>)request.getAttribute("gameJList");
   List<LoungeVO> allLoungeList = (List<LoungeVO>)request.getAttribute("allLoungeList");

      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"w-100 d-none d-lg-block position-relative top-0 end-0\">\r\n");
      out.write("    <div class=\"main w-100\">\r\n");
      out.write("        <div class=\"main-text\">\r\n");
      out.write("            <h2 class=\"special-heading display-1 text-center typing\">\r\n");
      out.write("                <img src=\"./img/redapp_logo_v2.png?v1\">\r\n");
      out.write("            </h2>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"swiper-inner\">\r\n");
      out.write("            <div class=\"swiper-container\" style=\"height: 100%;\">\r\n");
      out.write("                <div class=\"swiper-wrapper\">\r\n");
      out.write("                    <div class=\"swiper-slide\">\r\n");
      out.write("                        <img src=\"./img/background/LoL_WR_KV_Banner_1920x1080.jpg\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"swiper-slide\">\r\n");
      out.write("                        <img src=\"./img/background/pubg_mobile_15_4k_hd_games-1920x1080.jpg\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"swiper-slide\">\r\n");
      out.write("                        <img src=\"./img/background/pubg-mobile-x-kartrider-rush-4k-ft-1920x1080.jpg\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"swiper-pagination\"></div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("var swiper = new Swiper('.swiper-container', {\r\n");
      out.write("    spaceBetween: 30,\r\n");
      out.write("    centeredSlides: true,\r\n");
      out.write("    autoplay: {\r\n");
      out.write("        delay: 5000,\r\n");
      out.write("        disableOnInteraction: false,\r\n");
      out.write("    },\r\n");
      out.write("    pagination: {\r\n");
      out.write("        el: '.swiper-pagination',\r\n");
      out.write("        clickable: true,\r\n");
      out.write("    },\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"hc\">\r\n");
      out.write("<header class=\"navbar navbar-expand-lg header\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <button type=\"button\" class=\"navbar-toggler collapsed\" data-bs-toggle=\"collapse\" data-bs-target=\"#main-nav\">\r\n");
      out.write("            <span class=\"menu-icon-bar\"></span>\r\n");
      out.write("            <span class=\"menu-icon-bar\"></span>\r\n");
      out.write("            <span class=\"menu-icon-bar\"></span>\r\n");
      out.write("        </button>\r\n");
      out.write("        <div id=\"main-nav\" class=\"collapse navbar-collapse\">\r\n");
      out.write("            <ul class=\"navbar-nav me-auto col-12 col-lg-9\">\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a href=\"");
      out.print(request.getContextPath());
      out.write("/main.do\" class=\"nav-link\">Home</a>\r\n");
      out.write("                </li>\r\n");
      out.write("<!--                 <li class=\"nav-item\"> -->\r\n");
      out.write("\r\n");
      out.write("<!--                 </li> -->\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do?g=3\">게임 라운지</a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("                    <li><a class=\"dropdown-item\" href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do?g=1\">다운랭킹</a></li>\r\n");
      out.write("                    <li><a class=\"dropdown-item\" href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do?g=2\">구독랭킹</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                <li>\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a href=\"https://www.donga.com/news/List/0525\" class=\"nav-link\">e스포츠</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"");
      out.print(request.getContextPath());
      out.write("/customer/notice.do\">고객센터</a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"javascript:alert('개발 준비중 입니다.','self_close');\">사이트소개</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"");
      out.print(request.getContextPath());
      out.write("/customer/notice.do\">공지사항</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"");
      out.print(request.getContextPath());
      out.write("/customer/faq.do\">자주묻는질문</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            <ul class=\"col-lg-3 text-end member-info\">\r\n");
      out.write("                ");

                   Object user_no = session.getAttribute("user_no");
                   Object auth_cd = session.getAttribute("auth_cd");
                   if(user_no != null){
                      if(auth_cd != null) {
                
      out.write("\r\n");
      out.write("                      <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/admin/admin.do\" class=\"admin\">관리자</a></li>\r\n");
      out.write("                      ");
}
      out.write("\r\n");
      out.write("                   <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/member/myinfo.do\">내정보</a></li>\r\n");
      out.write("                   <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/member/logout.do\">로그아웃</a></li>\r\n");
      out.write("                   \r\n");
      out.write("                ");

                   } else {
                
      out.write("\r\n");
      out.write("                   <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/member/loginForm.do\">로그인</a></li>\r\n");
      out.write("                   <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/member/register.do\">회원가입</a></li>\r\n");
      out.write("                ");

                   }
                
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</header>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("// 스크롤 메뉴 고정 소스\r\n");
      out.write("$(window).scroll(function(){ \r\n");
      out.write("    var auto_height = $(\".main-text\").innerHeight();\r\n");
      out.write("    var height = $(document).scrollTop(); //실시간으로 스크롤의 높이를 측정\r\n");
      out.write("    if(height >= auto_height){ \r\n");
      out.write("        $('.header').addClass('fixed'); \r\n");
      out.write("    }else if(height < auto_height){ \r\n");
      out.write("        $('.header').removeClass('fixed'); \r\n");
      out.write("    } \r\n");
      out.write("});\r\n");
      out.write("jQuery(function($) {\r\n");
      out.write("   function adjustNav() {\r\n");
      out.write("      var winWidth = $(window).width(),\r\n");
      out.write("         dropdown = $('.dropdown'),\r\n");
      out.write("         dropdownMenu = $('.dropdown-menu');\r\n");
      out.write("      \r\n");
      out.write("      if (winWidth >= 992) {\r\n");
      out.write("         dropdown.on('mouseenter', function() {\r\n");
      out.write("            $(this).addClass('show')\r\n");
      out.write("               .children(dropdownMenu).addClass('show');\r\n");
      out.write("         });\r\n");
      out.write("         \r\n");
      out.write("         dropdown.on('mouseleave', function() {\r\n");
      out.write("            $(this).removeClass('show')\r\n");
      out.write("               .children(dropdownMenu).removeClass('show');\r\n");
      out.write("         });\r\n");
      out.write("      $('.hc').removeClass('fixed'); \r\n");
      out.write("      } else {\r\n");
      out.write("         dropdown.on('mouseenter mouseleave');\r\n");
      out.write("      $('.hc').addClass('fixed'); \r\n");
      out.write("      }\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   $(window).on('resize', adjustNav);\r\n");
      out.write("   \r\n");
      out.write("   adjustNav();\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"content\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <!-- 컨텐츠 화면 -->\r\n");
      out.write("            <div class=\"col-lg-9\">\r\n");
      out.write("                <div class=\"cont\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <!-- 공지사항 게시물 리스트 목록 -->\r\n");
      out.write("                    <div class=\"col-xl-6\">\r\n");
      out.write("                        <div class=\"app-notice\">\r\n");
      out.write("                            <h3>공지사항</h3>\r\n");
      out.write("                            <a href=\"");
      out.print(request.getContextPath());
      out.write("/customer/notice.do\" class=\"more\">더보기</a>\r\n");
      out.write("                            <div class=\"board-list\">\r\n");
      out.write("                                <table>\r\n");
      out.write("                                    <colgroup>\r\n");
      out.write("                                        <col class=\"subject\">\r\n");
      out.write("                                        <col class=\"time\">\r\n");
      out.write("                                    </colgroup>\r\n");
      out.write("                                <tbody>\r\n");
      out.write("                                ");

                                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                int cnt = 0;
                                   for(NoticeVO notice : noticeList){
                                      cnt++;
                                
      out.write("\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td class=\"subject\">\r\n");
      out.write("                                        <a href=\"");
      out.print( request.getContextPath());
      out.write("/customer/noticeView.do?n_no=");
      out.print( notice.getN_no());
      out.write("\">\r\n");
      out.write("                                            <span class=\"subject\">\r\n");
      out.write("                                            <span class=\"text\">");
      out.print( notice.getN_title());
      out.write("</span>\r\n");
      out.write("                                            </span>\r\n");
      out.write("                                        </a>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                    <td class=\"time\">\r\n");
      out.write("                                        <time>");
      out.print( formatter.format(notice.getN_wdt()));
      out.write("</time>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                                ");

                                   if (cnt == 5){
                                      break;
                                   }
                                }
                                
      out.write("\r\n");
      out.write("                                </tbody>\r\n");
      out.write("                                </table>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- 게임 게시물 리스트 목록 -->\r\n");
      out.write("                    <div class=\"col-xl-6\">\r\n");
      out.write("                        <div class=\"app-board\">\r\n");
      out.write("                            <h3>게임 최근게시글</h3>\r\n");
      out.write("                            <a href=\"");
      out.print( request.getContextPath());
      out.write("/lounge/boardView.do   \" class=\"more\">더보기</a>\r\n");
      out.write("                            <div class=\"board-list\">\r\n");
      out.write("                                <table>\r\n");
      out.write("                                    <colgroup>\r\n");
      out.write("                                        <col class=\"subject\">\r\n");
      out.write("                                        <col class=\"time\">\r\n");
      out.write("                                    </colgroup>\r\n");
      out.write("                                <tbody>\r\n");
      out.write("                                ");

                                formatter = new SimpleDateFormat("yyyy-MM-dd");
                                cnt = 0;
                                   for(LoungeVO lounge : allLoungeList){
                                      cnt++;
                                
      out.write("\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td class=\"subject\">\r\n");
      out.write("                                        <a href=\"");
      out.print( request.getContextPath());
      out.write("/lounge/boardView.do?bd_no=");
      out.print( lounge.getBd_no());
      out.write("&g_no=");
      out.print( lounge.getG_no());
      out.write("\">\r\n");
      out.write("                                            <span class=\"subject\">\r\n");
      out.write("                                            <span class=\"text\">");
      out.print( lounge.getBd_title());
      out.write("</span>\r\n");
      out.write("                                            </span>\r\n");
      out.write("                                        </a>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                    <td class=\"time\">\r\n");
      out.write("                                        <time>");
      out.print( formatter.format(lounge.getBd_wdt()));
      out.write("</time>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                                ");

                                   if (cnt == 5){
                                      break;
                                   }
                                }
                                
      out.write("\r\n");
      out.write("                                </tbody>\r\n");
      out.write("                                </table>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- 레드앱 등록된 게임 리스트 목록 -->\r\n");
      out.write("                <div class=\"col-12\">\r\n");
      out.write("                    <div class=\"app-game-list\">\r\n");
      out.write("                        <h3>레드앱 등록된 게임 리스트</h3>\r\n");
      out.write("                        <a href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do\" class=\"more\">더보기</a>\r\n");
      out.write("                        <ul class=\"app-list\">\r\n");
      out.write("                         ");

                            formatter = new SimpleDateFormat("yyyy-MM-dd");
                            cnt = 0;
                            for(GameVO game : gameList){
                                 cnt++;
                         
      out.write("\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <div class=\"app-icon\" onclick=\"location.href='");
      out.print( request.getContextPath());
      out.write("/lounge/gameLounge.do?g_no=");
      out.print( game.getG_no());
      out.write("'\"><img src=\"/imgPath/");
      out.print( game.getG_no());
      out.write("-icon.png\"></div>\r\n");
      out.write("                                <div class=\"app-title\" onclick=\"location.href='");
      out.print( request.getContextPath());
      out.write("/lounge/gameLounge.do?g_no=");
      out.print( game.getG_no());
      out.write("'\"><span class=\"subject\">");
      out.print(game.getG_name() );
      out.write("</span><span class=\"dev\">");
      out.print(game.getG_com() );
      out.write("</span></div>\r\n");
      out.write("                            </li>\r\n");
      out.write("                         ");

                             if (cnt == 6){
                                  break;
                                }
                             }
                          
      out.write("\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-12\">\r\n");
      out.write("                    <div class=\"app-game-list\">\r\n");
      out.write("                        <h3>e스포츠 기사</h3>\r\n");
      out.write("                        <a href=\"https://www.donga.com/news/List/0525\" target=\"_blank\" class=\"more\">더보기</a>\r\n");
      out.write("\r\n");
      out.write("                <!-- 데일리 e스포츠 기사 목록 -->\r\n");
      out.write("                 <div class=\"row\">\r\n");
      out.write("                ");

                // RSS 피드 URL
                  String rssFeedUrl = "https://rss.donga.com/sportsdonga/sports_game.xml";
                  
                  try {
                    // XML 파서 생성
                    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                    Document doc = factory.newDocumentBuilder().parse(rssFeedUrl);
                  
                    // 뉴스 아이템 가져오기
                    NodeList items = doc.getElementsByTagName("item");
                  
                    // 각 뉴스 아이템 순회
                    for (int i = 0; i < 7; i++) {
                       Element item = (Element) items.item(i);
                  
                       // 뉴스 제목과 링크 가져오기
                       String title = item.getElementsByTagName("title").item(0).getTextContent();
                       String link = item.getElementsByTagName("link").item(0).getTextContent();
                       String pubDate = item.getElementsByTagName("pubDate").item(0).getTextContent();
                     
                        // 미디어 URL 가져오기
                        NodeList mediaList = item.getElementsByTagName("media:content");
                        if (mediaList.getLength() > 0) {
                          Element media = (Element) mediaList.item(0);
                          String mediaUrl = media.getAttribute("url");
                  
      out.write("\r\n");
      out.write("                                <div class=\"col-sm-4\">\r\n");
      out.write("                                      <div class=\"widget single-news\">\r\n");
      out.write("                                            <div class=\"image\">\r\n");
      out.write("                                                  <img src=\"");
      out.print(mediaUrl );
      out.write("\" class=\"img-responsive\">\r\n");
      out.write("                                                  <span class=\"gradient\"></span>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"details\">\r\n");
      out.write("                                                  <div class=\"category\"><a href=\"");
      out.print(link );
      out.write("\">게임뉴스</a></div>\r\n");
      out.write("                                                  <h3><a href=\"");
      out.print(link );
      out.write('"');
      out.write('>');
      out.print(title );
      out.write("</a></h3>\r\n");
      out.write("                                                  <time>");
      out.print( pubDate );
      out.write("</time>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                      </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("            ");

                  }
                }
              } catch (Exception e) {
                e.printStackTrace();
              }
            
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- 사이드 화면 -->\r\n");
      out.write("            <side class=\"col-lg-3\">\r\n");
      out.write("                <div class=\"sidecont\">\r\n");
      out.write("                    <!-- 게임앱 커뮤니티 인기랭킹 TOP 5 목록 -->\r\n");
      out.write("                    <div class=\"col-12\">\r\n");
      out.write("                        <div class=\"app-game-popular-rank\">\r\n");
      out.write("                            <h3>인기 랭킹 TOP 5</h3>\r\n");
      out.write("                            <a href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do\" class=\"more\">더보기</a>\r\n");
      out.write("                            <ul class=\"rank-list\">\r\n");
      out.write("                            ");

                                int rank = 1;
                                  for(GameVO hgame : gameHList){
                            
      out.write("\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <div class=\"number\">");
      out.print( rank );
      out.write("<span class=\"d-none\"></span></div>\r\n");
      out.write("                                      <div class=\"app-icon\" onclick=\"location.href='");
      out.print( request.getContextPath());
      out.write("/lounge/gameLounge.do?g_no=");
      out.print( hgame.getG_no());
      out.write("'\"><img src=\"/imgPath/");
      out.print( hgame.getG_no());
      out.write("-icon.png\"></div>\r\n");
      out.write("                                   <div class=\"app-title\" onclick=\"location.href='");
      out.print( request.getContextPath());
      out.write("/lounge/gameLounge.do?g_no=");
      out.print( hgame.getG_no());
      out.write("'\"><span class=\"subject\">");
      out.print( hgame.getG_name() );
      out.write("</span><span class=\"dev\">");
      out.print( hgame.getG_com() );
      out.write("</span></div>\r\n");
      out.write("                               </li>\r\n");
      out.write("                            ");

                             if (rank == 5){
                                  break;
                                }
                                 rank++;
                             }
                             
      out.write("\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- 게임앱 커뮤니티 가입랭킹 TOP 5 목록 -->\r\n");
      out.write("                    <div class=\"col-12\">\r\n");
      out.write("                        <div class=\"app-game-join-rank\">\r\n");
      out.write("                            <h3>가입 랭킹 TOP 5</h3>\r\n");
      out.write("                            <a href=\"#\" class=\"more\">더보기</a>\r\n");
      out.write("                            <ul class=\"rank-list\">\r\n");
      out.write("                                 ");

                                rank = 1;
                                  for(GameVO jgame : gameJList){
                               
      out.write("\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <div class=\"number\">");
      out.print( rank );
      out.write("<span class=\"d-none\"></span></div>\r\n");
      out.write("                                      <div class=\"app-icon\" onclick=\"location.href='");
      out.print( request.getContextPath());
      out.write("/lounge/gameLounge.do?g_no=");
      out.print( jgame.getG_no());
      out.write("'\"><img src=\"/imgPath/");
      out.print( jgame.getG_no());
      out.write("-icon.png\"></div>\r\n");
      out.write("                                   <div class=\"app-title\" onclick=\"location.href='");
      out.print( request.getContextPath());
      out.write("/lounge/gameLounge.do?g_no=");
      out.print( jgame.getG_no());
      out.write("'\"><span class=\"subject\">");
      out.print( jgame.getG_name() );
      out.write("</span><span class=\"dev\">");
      out.print( jgame.getG_com() );
      out.write("</span></div>\r\n");
      out.write("                               </li>\r\n");
      out.write("                               ");

                                if (rank == 5){
                                     break;
                                   }
                                    rank++;
                                }
                                
      out.write("\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- 관리자 유저 목록 -->\r\n");
      out.write("                    <div class=\"col-12\">\r\n");
      out.write("                        <div class=\"app-admin\">\r\n");
      out.write("                            <h3>관리자 목록</h3>\r\n");
      out.write("                            <a href=\"");
      out.print(request.getContextPath());
      out.write("/ranking/community.do\" class=\"more\">더보기</a>\r\n");
      out.write("                            ");

                               for (MemberVO admin : adminList){
                                  String picSrc = "/profilePath/default/defaultProfile.png";
                                  if(admin.getProfile() != null){
                                     picSrc = "/profilePath/" + admin.getProfile();
                                  }
                            
      out.write("\r\n");
      out.write("                            <div class=\"userprofile pf-admin\">\r\n");
      out.write("                                <img src=\"");
      out.print( picSrc);
      out.write("\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            ");

                               
                            }
                            
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!-- footer 하단 화면 -->\r\n");
      out.write("                    <footer class=\"footer col-12\">\r\n");
      out.write("                        <div class=\"section\">\r\n");
      out.write("                            <div class=\"footer-link\">\r\n");
      out.write("                                <a href=\"javascript:alert('개발 준비중 입니다.','self_close');\">사이트소개</a>\r\n");
      out.write("                                <br>\r\n");
      out.write("                                <a href=\"javascript:alert('개발 준비중 입니다.','self_close');\">서비스 약관</a>\r\n");
      out.write("                                <br>\r\n");
      out.write("                                <a href=\"javascript:alert('개발 준비중 입니다.','self_close');\">개인정보 처리방침</a>\r\n");
      out.write("                                <br>\r\n");
      out.write("                                <a href=\"");
      out.print(request.getContextPath());
      out.write("/customer/notice.do\">고객센터</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                                    <div class=\"footer-extra\">\r\n");
      out.write("                                <a href=\"https://www.facebook.com/\" target=\"_blank\"><i class=\"bi bi-facebook\"></i></a>\r\n");
      out.write("                                <a href=\"https://discord.gg/\" target=\"_blank\"><i class=\"bi bi-discord\"></i></a>\r\n");
      out.write("                                <a href=\"https://twitter.com/\" target=\"_blank\"><i class=\"bi bi-twitter\"></i></a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <cite>RedApp Korea ⓒ 2023</cite>\r\n");
      out.write("                    </footer>\r\n");
      out.write("                </div>\r\n");
      out.write("            </side>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
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
