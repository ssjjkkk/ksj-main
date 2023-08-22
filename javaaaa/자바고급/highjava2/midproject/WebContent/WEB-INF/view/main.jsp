<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
<script src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
<script>
// 자바스크립트 & 제이쿼리에서 사용하는 데이터 정보 함수
// var is_member = '<?php echo isset($is_member)?$is_member:''; ?>';
// var is_admin  = '<?php echo isset($is_admin)?$is_admin:''; ?>';
</script>
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
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/lounge/index.do" class="nav-link">게임 라운지</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">종합랭킹</a>
                    <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ranking/community.do">게임랭킹</a></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ranking/subscribe.do">구독랭킹</a></li>
                    </ul>
                <li>
                <li class="nav-item">
                    <a href="https://news.kmib.co.kr/article/list.asp?sid1=spo&sid2=0012" class="nav-link">e스포츠</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="<%=request.getContextPath()%>/customer/notice.do">고객센터</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/customer/company.do">사이트소개</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/customer/notice.do">공지사항</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/customer/faq.do">자주묻는질문</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="col-lg-3 text-end member-info">
                
                <li><a href="<%=request.getContextPath()%>/admin/" class="admin">관리자</a></li>
                
                <li><a href="<%=request.getContextPath()%>/member/myinfo.do">내정보</a></li>
                <li><a href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a></li>
                
                <li><a href="<%=request.getContextPath()%>/member/loginForm.do">로그인</a></li>
                <li><a href="<%=request.getContextPath()%>/member/register.do">회원가입</a></li>
                
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
                            <a href="#" class="more">더보기</a>
                            <div class="board-list">
                                <table>
                                    <colgroup>
                                        <col class="subject">
                                        <col class="time">
                                    </colgroup>
                                <tbody>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">공지사항 관련 게시글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">공지사항 관련 게시글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">공지사항 관련 게시글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">공지사항 관련 게시글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">공지사항 관련 게시글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 게임 게시물 리스트 목록 -->
                    <div class="col-xl-6">
                        <div class="app-board">
                            <h3>게임 최근게시글</h3>
                            <a href="#" class="more">더보기</a>
                            <div class="board-list">
                                <table>
                                    <colgroup>
                                        <col class="subject">
                                        <col class="time">
                                    </colgroup>
                                <tbody>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">게임 최근글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">게임 최근글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">게임 최근글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">게임 최근글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subject">
                                        <a href="">
                                            <span class="subject">
                                            <span class="text">게임 최근글 입니다.</span>
                                            </span>
                                        </a>
                                    </td>
                                    <td class="time">
                                        <time>2023.05.22</time>
                                    </td>
                                </tr>
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
                        <a href="#" class="more">더보기</a>
                        <ul class="app-list">
                            <li>
                                <div class="app-icon"><img src="https://is2-ssl.mzstatic.com/image/thumb/Purple116/v4/51/4c/5f/514c5fd0-0b8e-c049-3ba9-9c991fcd26b0/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp"></div>
                                <div class="app-title"><span class="subject">카트라이더 러쉬플러스</span><span class="dev">NEXON Company</span></div>
                            </li>
                            <li>
                                <div class="app-icon"><img src="https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/8a/d0/27/8ad027ee-b093-e152-292c-0e4e766430b1/AppIcon-1x_U007emarketing-0-7-0-85-220.png/217x0w.webp"></div>
                                <div class="app-title"><span class="subject">배틀그라운드</span><span class="dev">KRAFTON Inc</span></div>
                            </li>
                            <li>
                                <div class="app-icon"><img src="https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/d6/4f/04/d64f04be-3293-2488-163f-2d2561e0bb54/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp"></div>
                                <div class="app-title"><span class="subject">리그 오브 레전드: 와일드 리프트</span><span class="dev">Riot Games</span></div>
                            </li>
                            <li>
                                <div class="app-icon"><img src="https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/6b/a2/dd/6ba2dd4e-64c5-331c-a245-59ed25a11a7d/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/157x0w.webp"></div>
                                <div class="app-title"><span class="subject">Roblox</span><span class="dev">Roblox Corporation</span></div>
                            </li>
                            <li>
                                <div class="app-icon"><img src="https://is4-ssl.mzstatic.com/image/thumb/Purple116/v4/e6/b0/3b/e6b03b44-31d3-a25c-4d37-819229958064/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/157x0w.webp"></div>
                                <div class="app-title"><span class="subject">클래시 로얄</span><span class="dev">Supercell</span></div>
                            </li>
                            <li>
                                <div class="app-icon"><img src="https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/f0/b4/16/f0b416b1-3ad0-d034-318b-029a401df49b/AppIcon-1x_U007emarketing-0-7-0-85-220.png/146x0w.webp"></div>
                                <div class="app-title"><span class="subject">쿠키런: 킹덤</span><span class="dev">Devsisters</span></div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 데일리 e스포츠 기사 목록 -->
                <div class="col-12">
                    <div class="app-game-list">
                        <h3>국민일보 e스포츠 기사</h3>
                        <a href="https://news.kmib.co.kr/article/list.asp?sid1=spo&sid2=0012" target="_blank" class="more">더보기</a>
<style>
.nws_list {width:100%;padding-bottom:5px;border-bottom:1px solid #c9c9c9;overflow:hidden;}
.nws_list div.nws {width:100%;margin-bottom:24px;display: table;}
.nws_list  p.pic {text-align:left;display: table-cell;padding-right:20px;}
.nws_list  p.pic img {display: block;width:100%;border:1px solid #dadada;}
.nws_list dl{display: table-cell;vertical-align:top;width: 700px;}
.nws_list dl dt {text-overflow:ellipsis;white-space:nowrap;overflow:hidden;padding:4px 0 7px 0;}
.nws_list dl dt a {font-size:17px;font-weight:bold;height:20px;line-height:20px;letter-spacing:-0.07em;}
.nws_list dl dd.tx {overflow:hidden;font-size: 14px;line-height: 20px;letter-spacing: -0.054em;}
.nws_list dl dd.tx a {color:#575757;}
.nws_list dl dd.date {height:18px;padding-top:5px;font-size:12px;color:#acacac}
</style>
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
                            <a href="#" class="more">더보기</a>
                            <ul class="rank-list">
                                <li>
                                    <div class="number">1<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is2-ssl.mzstatic.com/image/thumb/Purple116/v4/51/4c/5f/514c5fd0-0b8e-c049-3ba9-9c991fcd26b0/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp"></div>
                                    <div class="app-title"><span class="subject">카트라이더 러쉬플러스</span><span class="dev">NEXON Company</span></div>
                                </li>
                                <li>
                                    <div class="number">2<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/8a/d0/27/8ad027ee-b093-e152-292c-0e4e766430b1/AppIcon-1x_U007emarketing-0-7-0-85-220.png/217x0w.webp"></div>
                                    <div class="app-title"><span class="subject">배틀그라운드</span><span class="dev">KRAFTON Inc</span></div>
                                </li>
                                <li>
                                    <div class="number">3<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/d6/4f/04/d64f04be-3293-2488-163f-2d2561e0bb54/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp"></div>
                                    <div class="app-title"><span class="subject">리그 오브 레전드: 와일드 리프트</span><span class="dev">Riot Games</span></div>
                                </li>
                                <li>
                                    <div class="number">4<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is4-ssl.mzstatic.com/image/thumb/Purple116/v4/e6/b0/3b/e6b03b44-31d3-a25c-4d37-819229958064/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/157x0w.webp"></div>
                                    <div class="app-title"><span class="subject">클래시 로얄</span><span class="dev">Supercell</span></div>
                                </li>
                                <li>
                                    <div class="number">5<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/f0/b4/16/f0b416b1-3ad0-d034-318b-029a401df49b/AppIcon-1x_U007emarketing-0-7-0-85-220.png/146x0w.webp"></div>
                                    <div class="app-title"><span class="subject">쿠키런: 킹덤</span><span class="dev">Devsisters</span></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 게임앱 커뮤니티 가입랭킹 TOP 5 목록 -->
                    <div class="col-12">
                        <div class="app-game-join-rank">
                            <h3>가입 랭킹 TOP 5</h3>
                            <a href="#" class="more">더보기</a>
                            <ul class="rank-list">
                                <li>
                                    <div class="number">1<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/8a/d0/27/8ad027ee-b093-e152-292c-0e4e766430b1/AppIcon-1x_U007emarketing-0-7-0-85-220.png/217x0w.webp"></div>
                                    <div class="app-title"><span class="subject">배틀그라운드</span><span class="dev">KRAFTON Inc</span></div>
                                </li>
                                <li>
                                    <div class="number">2<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is2-ssl.mzstatic.com/image/thumb/Purple116/v4/51/4c/5f/514c5fd0-0b8e-c049-3ba9-9c991fcd26b0/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp"></div>
                                    <div class="app-title"><span class="subject">카트라이더 러쉬플러스</span><span class="dev">NEXON Company</span></div>
                                </li>
                                <li>
                                    <div class="number">3<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/d6/4f/04/d64f04be-3293-2488-163f-2d2561e0bb54/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp"></div>
                                    <div class="app-title"><span class="subject">리그 오브 레전드: 와일드 리프트</span><span class="dev">Riot Games</span></div>
                                </li>
                                <li>
                                    <div class="number">4<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/6b/a2/dd/6ba2dd4e-64c5-331c-a245-59ed25a11a7d/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/157x0w.webp"></div>
                                    <div class="app-title"><span class="subject">Roblxox</span><span class="dev">Roblox Corporation</span></div>
                                </li>
                                <li>
                                    <div class="number">5<span class="d-none">순위</span></div>
                                    <div class="app-icon"><img src="https://is4-ssl.mzstatic.com/image/thumb/Purple116/v4/e6/b0/3b/e6b03b44-31d3-a25c-4d37-819229958064/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/157x0w.webp"></div>
                                    <div class="app-title"><span class="subject">클래시 로얄</span><span class="dev">Supercell</span></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 관리자 유저 목록 -->
                    <div class="col-12">
                        <div class="app-admin">
                            <h3>관리자 목록</h3>
                            <a href="#" class="more">더보기</a>
                            <div class="userprofile pf-admin">
                                <img src="profile.jpg">
                            </div>
                            <div class="userprofile pf-admin">
                                <img src="profile.jpg">
                            </div>
                            <div class="userprofile pf-admin">
                                <img src="profile.jpg">
                            </div>
                            <div class="userprofile pf-admin">
                                <img src="profile.jpg">
                            </div>
                        </div>
                    </div>
                    <!-- footer 하단 화면 -->
                    <footer class="footer col-12">
                        <div class="section">
                            <div class="footer-link">
                                <a href="#">사이트소개</a>
                                <br>
                                <a href="#">서비스 약관</a>
                                <br>
                                <a href="#">개인정보 처리방침</a>
                                <br>
                                <a href="#">고객센터</a>
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