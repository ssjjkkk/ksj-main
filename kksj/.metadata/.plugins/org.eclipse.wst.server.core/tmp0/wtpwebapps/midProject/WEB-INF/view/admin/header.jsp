<%@page import="kr.or.dw.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/fonts.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/adminstyle.css">
<script src="<%= request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath()%>/js/all.min.js"></script>
<%
	int boardCount = (int)request.getAttribute("boardCount");
	List<MemberVO> memList =(List<MemberVO>)request.getAttribute("memList");
	int memCount = (int)request.getAttribute("memCount");
	int adminCount = (int)request.getAttribute("adminCount");
	MemberVO memberVo = (MemberVO)request.getAttribute("memberVo");
	
	String picSrc = "/profilePath/default/defaultProfile.png";
	
	if(memberVo.getProfile() != null) {
		picSrc = "/profilePath/" + memberVo.getProfile();
	}
%>
<script>
$(function () {
	
	$('#sBtn').on('click', function () {
		searchUser = $('#searchUser').val();
		location.href = '<%= request.getContextPath()%>/admin/searchUser.do?searchUser=' + searchUser;
	
	})
})
</script>

</head>
<body>
<nav class="sidebar">
    <div class="logo d-flex justify-content-between text-center">
        <a href="<%=request.getContextPath()%>/admin/admin.do">Dashboard</a>
        <div class="sidebar_close_icon d-lg-none">
            <i class="ti-close"></i>
        </div>
    </div>
    <ul id="sidebar_menu" class="metismenu">
        <li class="home"><a href="<%=request.getContextPath()%>/main.do" class="nav-link active">Home</a></li>
<!--         <span class="title">회원 관리</span> -->
<!--         <li><a href="#" class="nav-link">회원 정보</a></li> -->
<!--         <li><a href="#" class="nav-link">팔로우</a></li> -->
        <span class="title">게시판 관리</span>
        <li><a href="<%= request.getContextPath()%>/admin/adminnotice.do" class="nav-link">공지사항</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/adminFaq.do" class="nav-link">자주묻는질문</a></li>
        <span class="title">기타 관리</span>
    </ul>
</nav>
<section class="main_content">
    <nav class="navbar navbar-expand-lg gnb">
        <div class="container-fluid">
            <div class="gnb-search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="회원정보 검색" name="searchUser" id="searchUser">
                    <button id="sBtn" class="btn btn-search" type="button"><i class="bi bi-search"></i></button>
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
                    <img src="<%= picSrc %>" alt="mdo" width="70" height="70" class="rounded-circle">
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><strong><%= memberVo.getNick() %></strong>님</a></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/member/myinfo.do">마이페이지</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </nav>