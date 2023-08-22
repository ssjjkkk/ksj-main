<?php
include_once('./config.php');
?>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://moku.store/css/fonts.css">
<link rel="stylesheet" href="game.css?<?php echo time() ?>">
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
<?php
include_once('./gnb.php');
?>
<!-- 게임 커뮤니티 헤더 부분-->
<div class="game-intro" style="background-image: url('./img/game-controller-background.jpg'); background-position-y: 55%;">
    <div class="container">
        <div class="header-container">
            <div class="header-icon">
                <img src="./img/game-controller-icon.png" class="app-icon">
            </div>
            <div class="header-data">
                <h2 class="header-title"><a href="">게임 커뮤니티 이름</a></h2>
            </div>
            <div class="header-button">
                <a class="btn btn-download" href="#">다운로드</a>
                <a class="btn btn-join" href="#">가입하기</a>
            </div>
        </div>
    </div>
    <div class="header-footer">
    </div>
</div>
<!-- 게임 커뮤니티 컨텐츠 내용 부분 -->
<div class="game-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <!-- 사이드 메뉴 부분 -->
                <div class="side-menu">
                    <a class="btn btn-write" href="#">글쓰기</a>
                    <div class="game-search">
                        <div class="SearchForm" data-style-type="LIGHT">
                            <form class="Form" action="" data-has-keyword="false">
                            <input class="searchInput" type="text" placeholder="커뮤니티 게시물 검색" value="">
                            <button type="submit" class="btnSearch">검색하기</button>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 하단 풋터 부분 -->
                <div class="footer">
                    <cite>RedApp Korea ⓒ 2023</cite>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="content">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>