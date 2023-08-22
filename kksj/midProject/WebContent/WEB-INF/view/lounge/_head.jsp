<%@page import="kr.or.dw.util.BuildSqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.dw.lounge.vo.LoungeVO"%>
<%@page import="kr.or.dw.ranking.vo.GameVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="<%= request.getContextPath()%>/img/redapp_ico16.png" type="image/x-icon" sizes="16x16">
<link rel="shortcut icon" href="<%= request.getContextPath()%>/img/redapp_ico32.png" type="image/x-icon" sizes="32x32">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/fonts.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/game.css">
<script src="<%= request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath()%>/js/all.min.js"></script>
<script>
$(function () {
	$('#join').on('click', function () {
		alert('가입 되었습니다.');
	})
	
	$('#unJoin').on('click', function () {
		alert('가입 해제 되었습니다.');
	})
	
	
})
</script>
</head>
<body>
<%@ include file="../gnb.jsp"%>
<%
	int g_user = 0;
	if(request.getAttribute("g_user") != null){
		g_user = (int)request.getAttribute("g_user");	
	}
	GameVO gameVo = (GameVO) request.getAttribute("gameVo");
	List<LoungeVO> loungeList = (List<LoungeVO>) request.getAttribute("loungeList");
	List<LoungeVO> allLoungeList = (List<LoungeVO>) request.getAttribute("allLoungeList");
%>
<script>
	$(function () {
		$('#downBtn').on('click', function () {
			<% 
				SqlMapClient client = BuildSqlMapClient.getSqlMapClient();
			    int N = gameVo.getG_no();
				client.update("lounge.increaseDown", N);
			%>
		})
	})
</script>
<!-- 게임 커뮤니티 헤더 부분-->
<div class="game-intro" style="background-image: url('/imgPath/<%= gameVo.getG_no()%>-background.jpg'); background-position-y: 30%;">
    <div class="container">
        <div class="header-container">
            <div class="header-icon">
                <img src="/imgPath/<%= gameVo.getG_no()%>-icon.png" class="app-icon">
            </div>
            <div class="header-data">
                <h2 class="header-title"><a href="<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= gameVo.getG_no()%>"><%= gameVo.getG_name()%></a></h2>
                <p class="header-sub"><%= gameVo.getG_com()%></p>
            </div>
            <div class="header-button">
                <a id="downBtn" class="btn btn-download" href="https://play.google.com/store/apps/details?id=<%=gameVo.getG_url()%>">다운로드</a>
                <%if (g_user != (int)session.getAttribute("user_no")) {%>
                <a class="btn btn-join" href="<%= request.getContextPath()%>/lounge/joinLounge.do?g_no=<%= gameVo.getG_no()%>" id="join">가입하기</a>
                <%} else {%>
                <a class="btn btn-join" href="<%= request.getContextPath()%>/lounge/unJoinLounge.do?g_no=<%= gameVo.getG_no()%>" id="unJoin">가입해제</a>
                <%} %>
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
            <div class="col-lg-9">
                <div class="content">