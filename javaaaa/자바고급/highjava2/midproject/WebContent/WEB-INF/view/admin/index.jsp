<?php
include_once('../config.php');

if ($is_admin != '1')
    alert('관리자만 접근가능 합니다.');
?>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://moku.store/css/fonts.css">
<link rel="stylesheet" href="style.css?<?php echo time() ?>">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
</head>
<body>
<nav class="sidebar">
    <div class="logo d-flex justify-content-between text-center">
        <a href="index.html">Dashboard</a>
        <div class="sidebar_close_icon d-lg-none">
            <i class="ti-close"></i>
        </div>
    </div>
    <ul id="sidebar_menu" class="metismenu">
        <li class="home"><a href="#" class="nav-link active">Home</a></li>
        <span class="title">회원 관리</span>
        <li><a href="#" class="nav-link">회원 정보</a></li>
        <li><a href="#" class="nav-link">팔로우</a></li>
        <span class="title">게시판 관리</span>
        <li><a href="#" class="nav-link">공지사항</a></li>
        <li><a href="#" class="nav-link">자주묻는질문</a></li>
        <span class="title">기타 관리</span>
    </ul>
</nav>
<section class="main_content">
    <nav class="navbar navbar-expand-lg gnb">
        <div class="container-fluid">
            <div class="gnb-search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="회원정보 검색">
                    <button class="btn btn-search" type="button"><i class="bi bi-search"></i></button>
                </div>
            </div>
            <div class="gnb-notice">
                <a href="#">
                    <i class="bi bi-bell"></i>
                    <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
                        <span class="visually-hidden">New alerts</span>
                    </span>
                </a>
                <a href="#">
                    <i class="bi bi-chat"></i>
                    <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
                        <span class="visually-hidden">New alerts</span>
                    </span>
                </a>
            </div>
            <div class="dropdown text-end">
                <a href="#" class="d-block link-dark text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="mdo" width="70" height="70" class="rounded-circle">
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><strong><?php echo $member['username'] ?></strong>님</a></li>
                    <li><a class="dropdown-item" href="#">마이페이지</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 카운터 관련 테이블 -->
    <div class="count">
        <div class="row">
            <div class="col-12">
                <div class="quick_activity_wrap">
                    <!-- 통합 회원 수 -->
                    <div class="single_quick_activity d-flex">
                        <div class="icon">
                            <i class="bi bi-people"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter">0</span> </h3>
                            <p>회원</p>
                        </div>
                    </div>
                    <!-- 관리자 회원 수 -->
                    <div class="single_quick_activity d-flex">
                        <div class="icon">
                            <i class="bi bi-gear"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter">0</span> </h3>
                            <p>관리자</p>
                        </div>
                    </div>
                    <!-- 통합 방문자 수 -->
                    <div class="single_quick_activity d-flex">
                        <div class="icon">
                            <i class="bi bi-view-list"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter">0</span> </h3>
                            <p>방문자</p>
                        </div>
                    </div>
                    <!-- 통합 게시물 수 -->
                    <div class="single_quick_activity d-flex">
                        <div class="icon">
                            <i class="bi bi-card-text"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter">0</span> </h3>
                            <p>게시물</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <!-- 회원 정보 관련 테이블 -->
            <div class="col-6">
                <div class="user-list">
                    <div class="main-title mb-sm-15">
                        <h3 class="m-0 nowrap">회원 정보</h3>
                    </div>
                    <table class="user-table">
                    <thead>
                        <tr role="row">
                            <th scope="col" class="sorting_asc" style="width: 20%;">아이디</th>
                            <th scope="col" class="sorting">닉네임</th>
                            <th scope="col" class="sorting" style="width: 10%;">권한</th>
                            <th scope="col" class="sorting" style="width: 10%;">밴 여부</th>
                            <th scope="col" class="sorting" style="width: 20%;">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 회원 목록 리스트 -->
                        <tr>
                          <td>test</td>
                          <td>테스트</td>
                          <td><i class="bi bi-x"></i></td>
                          <td><i class="bi bi-x"></i></td>
                          <td><a class="btn btn-admin" href="#"><i class="bi bi-gear"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-slash-circle"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-trash"></i></a></td>
                        </tr>
                        <!-- 회원 목록 리스트 -->
                        <tr>
                          <td>test</td>
                          <td>테스트</td>
                          <td><i class="bi bi-x"></i></td>
                          <td><i class="bi bi-x"></i></td>
                          <td><a class="btn btn-admin" href="#"><i class="bi bi-gear"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-slash-circle"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-trash"></i></a></td>
                        </tr>
                        <!-- 회원 목록 리스트 -->
                        <tr>
                          <td>test</td>
                          <td>테스트</td>
                          <td><i class="bi bi-x"></i></td>
                          <td><i class="bi bi-x"></i></td>
                          <td><a class="btn btn-admin" href="#"><i class="bi bi-gear"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-slash-circle"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-trash"></i></a></td>
                        </tr>
                        <!-- 회원 목록 리스트 -->
                        <tr>
                          <td>test</td>
                          <td>테스트</td>
                          <td><i class="bi bi-x"></i></td>
                          <td><i class="bi bi-x"></i></td>
                          <td><a class="btn btn-admin" href="#"><i class="bi bi-gear"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-slash-circle"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-trash"></i></a></td>
                        </tr>
                        <!-- 회원 목록 리스트 -->
                        <tr>
                          <td>test</td>
                          <td>테스트</td>
                          <td><i class="bi bi-x"></i></td>
                          <td><i class="bi bi-x"></i></td>
                          <td><a class="btn btn-admin" href="#"><i class="bi bi-gear"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-slash-circle"></i></a><a class="btn btn-admin" href="#"><i class="bi bi-trash"></i></a></td>
                        </tr>
                    </tbody>
                    </table>
                </div>
            </div>
            <!-- 자주묻는질문 관련 테이블 -->
            <div class="col-6">
                <div class="qna-list">
                    <div class="main-title mb-sm-15">
                        <h3 class="m-0 nowrap">자주묻는질문</h3>
                    </div>
                    <div class="Activity_timeline">
                        <ul>
                            <!-- 자주묻는질문 리스트 -->
                            <li>
                                <div class="activity_bell"></div>
                                <div class="activity_wrap">
                                <h6>질문</h6>
                                <p>답변</p>
                                </div>
                            </li>
                            <!-- 자주묻는질문 리스트 -->
                            <li>
                                <div class="activity_bell"></div>
                                <div class="activity_wrap">
                                <h6>질문</h6>
                                <p>답변</p>
                                </div>
                            </li>
                            <!-- 자주묻는질문 리스트 -->
                            <li>
                                <div class="activity_bell"></div>
                                <div class="activity_wrap">
                                <h6>질문</h6>
                                <p>답변</p>
                                </div>
                            </li>
                            <!-- 자주묻는질문 리스트 -->
                            <li>
                                <div class="activity_bell"></div>
                                <div class="activity_wrap">
                                <h6>질문</h6>
                                <p>답변</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>