<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://moku.store/css/fonts.css">
<link rel="stylesheet" href="style.css?<?php echo time() ?>">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
<script>
// 자바스크립트 & 제이쿼리에서 사용하는 데이터 정보 함수
var is_member = '<?php echo isset($is_member)?$is_member:''; ?>';
var is_admin  = '<?php echo isset($is_admin)?$is_admin:''; ?>';
</script>
</head>
<body>
<header class="navbar navbar-expand-lg header">
    <div class="container">
        <div class="logo">
            <a href="index.jsp">
                <h2>RedApp</h2>
                <p>앱게임 커뮤니티</p>
            </a>
        </div>
        <div class="m-gnb">
            <?php
                if ($is_member) {
            ?>
            <a href="mypage.jsp">마이페이지</a>
            <?php
                    if ($is_admin) {
            ?>
            <a href="./admin/" class="admin"><i class="bi bi-gear-fill"></i></a>
            <?php } ?>
            <a href="logout.jsp">로그아웃</a>
            <?php } else { ?>
            <a href="<%= request.getContextPath() %>/user/loginForm.do">로그인</a>
            <a href="<%= request.getContextPath() %>/user/joinForm.do">회원가입</a>
            <?php } ?>
        </div>
        <a href="javascript:void(0);" class="menu-toggle d-lg-none">
            <ul>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </a>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll">
                <li class="nav-item">
                    <a href="/redapp/" class="nav-link">Home</a>
                </li>
                <li class="nav-item">
                    <a href="game.jsp" class="nav-link">커뮤니티</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">종합랭킹 <!-- 사용안함 div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div--></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="ranking/">인기 랭킹</a></li>
                        <li><a class="dropdown-item" href="ranking/">가입 랭킹</a></li>
                        <li><a class="dropdown-item" href="ranking/user.jsp">회원 랭킹</a></li>
                    </ul>
                <li>
                <li class="nav-item">
                    <a href="" class="nav-link">e스포츠</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">고객센터 <!-- 사용안함 div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div--></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="">사이트소개</a></li>
                        <li><a class="dropdown-item" href="notice.jsp">공지사항</a></li>
                        <li><a class="dropdown-item" href="">자주묻는질문</a></li>
                    </ul>
                <li>
            </ul>
            <div class="col-md-3 text-end member-info">
                <?php
                    if ($is_member) {
                ?>
                <a href="mypage.jsp">마이페이지</a>
                <?php
                        if ($is_admin) {
                ?>
                <a href="./admin/" class="admin"><i class="bi bi-gear-fill"></i></a>
                <?php } ?>
                <a href="logout.jsp">로그아웃</a>
                <?php } else { ?>
                <a href="<%= request.getContextPath() %>/user/loginForm.do">로그인</a>
                <a href="<%= request.getContextPath() %>/user/joinForm.do">회원가입</a>
                <?php } ?>
            </div>
        </div>
            <div class="gnb-m">
                <div class="nav accordion" id="accordionSidenav">
                    <a class="nav-link" href="">
                        Home
                    </a>
                    <a class="nav-link" href="game.jsp">
                        커뮤니티
                    </a>
                    <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                        <div class="nav-link-icon"><i data-feather="activity"></i></div>
                        종합랭킹
                        <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapse1" data-bs-parent="#accordionSidenav">
                        <nav class="sidenav-menu-nested nav accordion">
                            <a class="nav-link" href="">인기 랭킹</a>
                            <a class="nav-link" href="">인기 랭킹</a>
                            <a class="nav-link" href="">유저 랭킹</a>
                        </nav>
                    </div>
                    <a class="nav-link" href="">
                        e스포츠
                    </a>
                    <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                        <div class="nav-link-icon"><i data-feather="activity"></i></div>
                        고객센터
                        <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapse2" data-bs-parent="#accordionSidenav">
                        <nav class="sidenav-menu-nested nav accordion">
                            <a class="nav-link" href="">사이트소개</a>
                            <a class="nav-link" href="notice.jsp">공지사항</a>
                            <a class="nav-link" href="">자주묻는질문</a>
                        </nav>
                    </div>
                </div>
            </div>
    </div>
</header>
<script>
$(function() {
    $(document).on('click', '.menu-toggle', function () {
        if($(this).hasClass('active')){
            $('header.navbar').removeClass('active');
            $(this).removeClass('active');
            $('.logo').removeClass('off');
            $('.m-gnb').removeClass('active');
            $('.gnb-m').removeClass('active');
        } else {
            $('header.navbar').addClass('active');
            $(this).addClass('active');
            $('.logo').addClass('off');
            $('.m-gnb').addClass('active');
            $('.gnb-m').addClass('active');
        }
    });
});
</script>
<div class="intro-banner">
<div id="introBanner" class="carousel slide" data-bs-ride="false">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#introBanner" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#introBanner" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#introBanner" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
      <div class="carousel-item active">
          <div class="carousel-caption d-none d-md-block">
              <h5>게임 관련 홍보 배너 1</h5>
              <p>홍보 설명 입니다.</p>
          </div>
      </div>
      <div class="carousel-item">
          <div class="carousel-caption d-none d-md-block">
              <h5>게임 관련 홍보 배너 2</h5>
              <p>홍보 설명 입니다.</p>
          </div>
      </div>
      <div class="carousel-item">
          <div class="carousel-caption d-none d-md-block">
              <h5>게임 관련 홍보 배너 3</h5>
              <p>홍보 설명 입니다.</p>
          </div>
      </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#introBanner" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#introBanner" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
    <script>const carousel = new bootstrap.Carousel('#introBanner')</script>
</div>
<div class="content">
    <div class="bg-left"></div>
    <div class="container position-relative">
        <div class="row">
            <!-- 컨텐츠 화면 -->
            <div class="col-lg-9">
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
<?php
include('simple_html_dom.php');

// 파싱할 웹 사이트의 URL
$url = 'https://news.kmib.co.kr/article/list.asp?sid1=spo&sid2=0012';
$html = file_get_html($url);
$html = $html->find('div[class="nws_list"]', 0);
$html = preg_replace('/<a href="(.*?)"/', '<a href="https://news.kmib.co.kr/article/$1"', $html);
echo $html;
?>
                    </div>
                </div>
            </div>
            <!-- 사이드 화면 -->
            <side class="col-lg-3">
                <div class="position-sticky" style="top: 85px;">
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