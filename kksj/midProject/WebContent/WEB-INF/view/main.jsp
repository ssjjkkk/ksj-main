<%@page import="kr.or.dw.lounge.vo.LoungeVO"%>
<%@page import="kr.or.dw.ranking.vo.GameVO"%>
<%@page import="kr.or.dw.member.vo.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.customer.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.NodeList" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fonts.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/swiper.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/alert.min.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
<script src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
<script src="<%=request.getContextPath()%>/js/alert.min.js"></script>
<script>
// 자바스크립트 & 제이쿼리에서 사용하는 데이터 정보 함수
// var is_member = '<?php echo isset($is_member)?$is_member:''; ?>';
// var is_admin  = '<?php echo isset($is_admin)?$is_admin:''; ?>';
$(function () {
   $()
})
</script>
<%
   List<NoticeVO> noticeList = (List<NoticeVO>)request.getAttribute("noticeList");
   
   List<MemberVO> adminList = (List<MemberVO>)request.getAttribute("adminList");
   
   List<GameVO> gameList = (List<GameVO>)request.getAttribute("gameList");
   List<GameVO> gameHList = (List<GameVO>)request.getAttribute("gameHList");
   List<GameVO> gameJList = (List<GameVO>)request.getAttribute("gameJList");
   List<LoungeVO> allLoungeList = (List<LoungeVO>)request.getAttribute("allLoungeList");
%>
</head>
<body>
<div class="w-100 d-none d-lg-block position-relative top-0 end-0">
    <div class="main w-100">
        <div class="main-text">
            <h2 class="special-heading display-1 text-center typing">
                <img src="./img/redapp_logo_v2.png?v1">
            </h2>
        </div>
        <div class="swiper-inner">
            <div class="swiper-container" style="height: 100%;">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="./img/background/LoL_WR_KV_Banner_1920x1080.jpg">
                    </div>
                    <div class="swiper-slide">
                        <img src="./img/background/pubg_mobile_15_4k_hd_games-1920x1080.jpg">
                    </div>
                    <div class="swiper-slide">
                        <img src="./img/background/pubg-mobile-x-kartrider-rush-4k-ft-1920x1080.jpg">
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
</div>
<script>
var swiper = new Swiper('.swiper-container', {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
        delay: 5000,
        disableOnInteraction: false,
    },
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
});
</script>
<div class="hc">
<header class="navbar navbar-expand-lg header">
    <div class="container">
        <button type="button" class="navbar-toggler collapsed" data-bs-toggle="collapse" data-bs-target="#main-nav">
            <span class="menu-icon-bar"></span>
            <span class="menu-icon-bar"></span>
            <span class="menu-icon-bar"></span>
        </button>
        <div id="main-nav" class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto col-12 col-lg-9">
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/main.do" class="nav-link">Home</a>
                </li>
<!--                 <li class="nav-item"> -->
<%--                     <a href="<%=request.getContextPath()%>/lounge/loungeMain.do" class="nav-link">게임 라운지</a> --%>
<!--                 </li> -->
                <li class="nav-item dropdown">
                    <a class="nav-link" href="<%=request.getContextPath()%>/ranking/community.do?g=3">게임 라운지</a>
                    <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ranking/community.do?g=1">다운랭킹</a></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ranking/community.do?g=2">구독랭킹</a></li>
                    </ul>
                <li>
                <li class="nav-item">
                    <a href="https://www.donga.com/news/List/0525" class="nav-link">e스포츠</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="<%=request.getContextPath()%>/customer/notice.do">고객센터</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="javascript:alert('개발 준비중 입니다.','self_close');">사이트소개</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/customer/notice.do">공지사항</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/customer/faq.do">자주묻는질문</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="col-lg-3 text-end member-info">
                <%
                   Object user_no = session.getAttribute("user_no");
                   Object auth_cd = session.getAttribute("auth_cd");
                   if(user_no != null){
                      if(auth_cd != null) {
                %>
                      <li><a href="<%=request.getContextPath()%>/admin/admin.do" class="admin">관리자</a></li>
                      <%}%>
                   <li><a href="<%=request.getContextPath()%>/member/myinfo.do">내정보</a></li>
                   <li><a href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a></li>
                   
                <%
                   } else {
                %>
                   <li><a href="<%=request.getContextPath()%>/member/loginForm.do">로그인</a></li>
                   <li><a href="<%=request.getContextPath()%>/member/register.do">회원가입</a></li>
                <%
                   }
                %>
            </ul>
        </div>
    </div>
</header>
</div>
<script>
// 스크롤 메뉴 고정 소스
$(window).scroll(function(){ 
    var auto_height = $(".main-text").innerHeight();
    var height = $(document).scrollTop(); //실시간으로 스크롤의 높이를 측정
    if(height >= auto_height){ 
        $('.header').addClass('fixed'); 
    }else if(height < auto_height){ 
        $('.header').removeClass('fixed'); 
    } 
});
jQuery(function($) {
   function adjustNav() {
      var winWidth = $(window).width(),
         dropdown = $('.dropdown'),
         dropdownMenu = $('.dropdown-menu');
      
      if (winWidth >= 992) {
         dropdown.on('mouseenter', function() {
            $(this).addClass('show')
               .children(dropdownMenu).addClass('show');
         });
         
         dropdown.on('mouseleave', function() {
            $(this).removeClass('show')
               .children(dropdownMenu).removeClass('show');
         });
      $('.hc').removeClass('fixed'); 
      } else {
         dropdown.on('mouseenter mouseleave');
      $('.hc').addClass('fixed'); 
      }
   }
   
   $(window).on('resize', adjustNav);
   
   adjustNav();
});
</script>
<div class="content">
    <div class="container">
        <div class="row">
            <!-- 컨텐츠 화면 -->
            <div class="col-lg-9">
                <div class="cont">
                <div class="row">
                    <!-- 공지사항 게시물 리스트 목록 -->
                    <div class="col-xl-6">
                        <div class="app-notice">
                            <h3>공지사항</h3>
                            <a href="<%=request.getContextPath()%>/customer/notice.do" class="more">더보기</a>
                            <div class="board-list">
                                <table>
                                    <colgroup>
                                        <col class="subject">
                                        <col class="time">
                                    </colgroup>
                                <tbody>
                                <%
                                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                int cnt = 0;
                                   for(NoticeVO notice : noticeList){
                                      cnt++;
                                %>
                                <tr>
                                    <td class="subject">
                                        <a href="<%= request.getContextPath()%>/customer/noticeView.do?n_no=<%= notice.getN_no()%>">
                                            <span class="subject">
                                            <span class="text"><%= notice.getN_title()%></span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time><%= formatter.format(notice.getN_wdt())%></time>
                                    </td>
                                </tr>
                                <%
                                   if (cnt == 5){
                                      break;
                                   }
                                }
                                %>
                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 게임 게시물 리스트 목록 -->
                    <div class="col-xl-6">
                        <div class="app-board">
                            <h3>게임 최근게시글</h3>
                            <a href="<%= request.getContextPath()%>/lounge/boardView.do   " class="more">더보기</a>
                            <div class="board-list">
                                <table>
                                    <colgroup>
                                        <col class="subject">
                                        <col class="time">
                                    </colgroup>
                                <tbody>
                                <%
                                formatter = new SimpleDateFormat("yyyy-MM-dd");
                                cnt = 0;
                                   for(LoungeVO lounge : allLoungeList){
                                      cnt++;
                                %>
                                <tr>
                                    <td class="subject">
                                        <a href="<%= request.getContextPath()%>/lounge/boardView.do?bd_no=<%= lounge.getBd_no()%>&g_no=<%= lounge.getG_no()%>">
                                            <span class="subject">
                                            <span class="text"><%= lounge.getBd_title()%></span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time><%= formatter.format(lounge.getBd_wdt())%></time>
                                    </td>
                                </tr>
                                <%
                                   if (cnt == 5){
                                      break;
                                   }
                                }
                                %>
                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 레드앱 등록된 게임 리스트 목록 -->
                <div class="col-12">
                    <div class="app-game-list">
                        <h3>레드앱 등록된 게임 리스트</h3>
                        <a href="<%=request.getContextPath()%>/ranking/community.do" class="more">더보기</a>
                        <ul class="app-list">
                         <%
                            formatter = new SimpleDateFormat("yyyy-MM-dd");
                            cnt = 0;
                            for(GameVO game : gameList){
                                 cnt++;
                         %>
                            <li>
                                <div class="app-icon" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= game.getG_no()%>'"><img src="/imgPath/<%= game.getG_no()%>-icon.png"></div>
                                <div class="app-title" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= game.getG_no()%>'"><span class="subject"><%=game.getG_name() %></span><span class="dev"><%=game.getG_com() %></span></div>
                            </li>
                         <%
                             if (cnt == 6){
                                  break;
                                }
                             }
                          %>
                        </ul>
                    </div>
                </div>
                <div class="col-12">
                    <div class="app-game-list">
                        <h3>e스포츠 기사</h3>
                        <a href="https://www.donga.com/news/List/0525" target="_blank" class="more">더보기</a>

                <!-- 데일리 e스포츠 기사 목록 -->
                 <div class="row">
                <%
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
                  %>
                                <div class="col-sm-4">
                                      <div class="widget single-news">
                                            <div class="image">
                                                  <img src="<%=mediaUrl %>" class="img-responsive">
                                                  <span class="gradient"></span>
                                            </div>
                                            <div class="details">
                                                  <div class="category"><a href="<%=link %>">게임뉴스</a></div>
                                                  <h3><a href="<%=link %>"><%=title %></a></h3>
                                                  <time><%= pubDate %></time>
                                            </div>
                                      </div>
                                </div>
            <%
                  }
                }
              } catch (Exception e) {
                e.printStackTrace();
              }
            %>
                            </div>
                    </div>
                </div>
                </div>
            </div>
            <!-- 사이드 화면 -->
            <side class="col-lg-3">
                <div class="sidecont">
                    <!-- 게임앱 커뮤니티 인기랭킹 TOP 5 목록 -->
                    <div class="col-12">
                        <div class="app-game-popular-rank">
                            <h3>인기 랭킹 TOP 5</h3>
                            <a href="<%=request.getContextPath()%>/ranking/community.do" class="more">더보기</a>
                            <ul class="rank-list">
                            <%
                                int rank = 1;
                                  for(GameVO hgame : gameHList){
                            %>
                                <li>
                                    <div class="number"><%= rank %><span class="d-none"></span></div>
                                      <div class="app-icon" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= hgame.getG_no()%>'"><img src="/imgPath/<%= hgame.getG_no()%>-icon.png"></div>
                                   <div class="app-title" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= hgame.getG_no()%>'"><span class="subject"><%= hgame.getG_name() %></span><span class="dev"><%= hgame.getG_com() %></span></div>
                               </li>
                            <%
                             if (rank == 5){
                                  break;
                                }
                                 rank++;
                             }
                             %>
                            </ul>
                        </div>
                    </div>
                    <!-- 게임앱 커뮤니티 가입랭킹 TOP 5 목록 -->
                    <div class="col-12">
                        <div class="app-game-join-rank">
                            <h3>가입 랭킹 TOP 5</h3>
                            <a href="#" class="more">더보기</a>
                            <ul class="rank-list">
                                 <%
                                rank = 1;
                                  for(GameVO jgame : gameJList){
                               %>
                                <li>
                                    <div class="number"><%= rank %><span class="d-none"></span></div>
                                      <div class="app-icon" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= jgame.getG_no()%>'"><img src="/imgPath/<%= jgame.getG_no()%>-icon.png"></div>
                                   <div class="app-title" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= jgame.getG_no()%>'"><span class="subject"><%= jgame.getG_name() %></span><span class="dev"><%= jgame.getG_com() %></span></div>
                               </li>
                               <%
                                if (rank == 5){
                                     break;
                                   }
                                    rank++;
                                }
                                %>
                            </ul>
                        </div>
                    </div>
                    <!-- 관리자 유저 목록 -->
                    <div class="col-12">
                        <div class="app-admin">
                            <h3>관리자 목록</h3>
                            <a href="<%=request.getContextPath()%>/ranking/community.do" class="more">더보기</a>
                            <%
                               for (MemberVO admin : adminList){
                                  String picSrc = "/profilePath/default/defaultProfile.png";
                                  if(admin.getProfile() != null){
                                     picSrc = "/profilePath/" + admin.getProfile();
                                  }
                            %>
                            <div class="userprofile pf-admin">
                                <img src="<%= picSrc%>">
                            </div>
                            <%
                               
                            }
                            %>

                        </div>
                    </div>
                    <!-- footer 하단 화면 -->
                    <footer class="footer col-12">
                        <div class="section">
                            <div class="footer-link">
                                <a href="javascript:alert('개발 준비중 입니다.','self_close');">사이트소개</a>
                                <br>
                                <a href="javascript:alert('개발 준비중 입니다.','self_close');">서비스 약관</a>
                                <br>
                                <a href="javascript:alert('개발 준비중 입니다.','self_close');">개인정보 처리방침</a>
                                <br>
                                <a href="<%=request.getContextPath()%>/customer/notice.do">고객센터</a>
                            </div>
                                    <div class="footer-extra">
                                <a href="https://www.facebook.com/" target="_blank"><i class="bi bi-facebook"></i></a>
                                <a href="https://discord.gg/" target="_blank"><i class="bi bi-discord"></i></a>
                                <a href="https://twitter.com/" target="_blank"><i class="bi bi-twitter"></i></a>
                            </div>
                        </div>
                        <cite>RedApp Korea ⓒ 2023</cite>
                    </footer>
                </div>
            </side>
        </div>
    </div>
</div>
</body>
</html>