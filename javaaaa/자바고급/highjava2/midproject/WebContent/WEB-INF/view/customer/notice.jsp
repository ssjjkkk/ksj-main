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
<link rel="stylesheet" href="gnb.css?<?php echo time() ?>">
<link rel="stylesheet" href="notice.css?<?php echo time() ?>">
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
<!-- 글로벌 네비게이션 바 부분 -->
<header class="gnb">
    <div class="container">
        <div class="logo">
            <a href="index.jsp">RedApp</a>
            <div class="sidebar_close_icon d-lg-none">
                <i class="ti-close"></i>
            </div>
        </div>
        <div class="gnb-search">
            <div class="SearchForm" data-style-type="LIGHT">
                <form class="Form" action="" data-has-keyword="false">
                <input class="searchInput" type="text" placeholder="유저아이디 검색" value="">
                <button type="submit" class="btnSearch">검색하기</button>
                </form>
            </div>
        </div>
        <div class="member-info">
            <?php
                if ($is_member) {
            ?>
            <a class="btn btn-basic" href="logout.jsp">로그아웃</a>
            <?php } else { ?>
            <a class="btn btn-basic" href="login.jsp">로그인</a>
            <?php } ?>
        </div>
    </div>
</header>
<div class="notice-wrapper">
    <div class="container">
        <div class="table-list">
            <ul class="list clearfix">
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort">공지</span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="">공지사항 관련 게시글 입니다.</a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span>2023.05.24.</span>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            <div class="table-paging">
                <ul class="clearfix">
                    <li class="on"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                </ul>
                <a href="#" class="dir last"></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>