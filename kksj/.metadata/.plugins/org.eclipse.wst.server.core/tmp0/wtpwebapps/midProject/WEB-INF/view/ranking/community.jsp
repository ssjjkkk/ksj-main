<%@page import="kr.or.dw.ranking.vo.GameVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/fonts.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/ranking.css">
<script src="<%= request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath()%>/js/all.min.js"></script>
</head>
<body>
<%@ include file="../gnb.jsp"%>
<%
   List<GameVO> gameList = (List<GameVO>)request.getAttribute("gameList"); 
   List<GameVO> gameHList = (List<GameVO>)request.getAttribute("gameHList");
   List<GameVO> gameJList = (List<GameVO>)request.getAttribute("gameJList");
   int g = (int) request.getAttribute("g");
   
%>
<script>
	$(function () {
		
		<%if(g == 3) {%>
			   	$('#all').click();
		<%} else if (g == 1) {%>
				$('#pop').click();
		<%} else {%>
				$('#join').click();
		<%}%>
		
		
		
		
	})	
</script>
<div class="ranking-wrapper">
    <div class="container">
        <div class="ranking-list">
            <div class="tab-wrap">
                <div class="tab-group">
                    <div class="tab-title-area">
                        <strong class="tab-title">게임 라운지 순위</strong>
                    </div>
                    <ul role="tablist" class="tab-tab-list">
                        <li class="tab-tab-item"><button id ="all" class="tab-tab active" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all" type="button" role="tab" aria-controls="pills-all" aria-selected="true"><span class="tab-tab-name">전체</span></button></li>
                        <li class="tab-tab-item"><button id ="pop" class="tab-tab" id="pills-hot-tab" data-bs-toggle="pill" data-bs-target="#pills-hot" type="button" role="tab" aria-controls="pills-hot" aria-selected="false"><span class="tab-tab-name">인기</span></button></li>
                        <li class="tab-tab-item"><button id ="join" class="tab-tab" id="pills-join-tab" data-bs-toggle="pill" data-bs-target="#pills-join" type="button" role="tab" aria-controls="pills-join" aria-selected="false"><span class="tab-tab-name">가입자</span></button></li>
                    </ul>
                </div>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab">
                  <ul class="ranking-list-list">
                  <%
                  int rank = 1;
                  for (GameVO game : gameList) {
                  %>
                      <li class="ranking-list-item">
                          <div class="lounge-item-wrap">
                              <button type="button" class="lounge-item-lounge">
                                  <span class="lounge-item-rank-area">
                                      <strong class="lounge-item-rank"><%= rank %></strong>
                                  </span>
                                  <span class="lounge-item-thumbnail-area" style="background-image: url(/imgPath/<%= game.getG_no()%>-icon.png);"></span>
                                  <span class="lounge-item-info">
                                      <span class="lounge-item-name-wrap">
                                          <strong class="lounge-item-name"><%= game.getG_name() %></strong>
                                      </span>
                                      <span class="lounge-item-sub"><%= game.getG_com() %></span>
                                  </span>
                              </button>
                              <div class="lounge-item-homepage-area">
                                  <button type="button" class="homepage-button" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= game.getG_no()%>'"><i class="bi bi-house"></i> 방문하기</button>
                              </div>   
                          </div>
                      </li>
                  <%rank++; } %>
                  </ul>
                </div>
                <div class="tab-pane fade" id="pills-hot" role="tabpanel" aria-labelledby="pills-hot-tab">
                      <ul class="ranking-list-list">
                        <%
                        int hrank = 1;
                        for (GameVO hgame : gameHList) {
                       %>
                      <li class="ranking-list-item">
                          <div class="lounge-item-wrap">
                              <button type="button" class="lounge-item-lounge">
                                  <span class="lounge-item-rank-area">
                                      <strong class="lounge-item-rank"><%= hrank %></strong>
                                  </span>
                                  <span class="lounge-item-thumbnail-area" style="background-image: url(/imgPath/<%= hgame.getG_no()%>-icon.png);"></span>
                                  <span class="lounge-item-info">
                                      <span class="lounge-item-name-wrap">
                                          <strong class="lounge-item-name"><%= hgame.getG_name() %></strong>
                                      </span>
                                      <span class="lounge-item-sub"><%= hgame.getG_com() %></span>
                                  </span>
                              </button>
                              <div class="lounge-item-homepage-area">
                                  <button type="button" class="homepage-button" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= hgame.getG_no()%>'"><i class="bi bi-house"></i> 방문하기</button>
                              </div>   
                          </div>
                      </li>
                  <% hrank++; } %>
                  </ul>
                </div>
                <div class="tab-pane fade" id="pills-join" role="tabpanel" aria-labelledby="pills-join-tab">
                        <ul class="ranking-list-list">
                        <%
                        int jrank = 1;
                        for (GameVO jgame : gameJList) {
                       %>
                      <li class="ranking-list-item">
                          <div class="lounge-item-wrap">
                              <button type="button" class="lounge-item-lounge">
                                  <span class="lounge-item-rank-area">
                                      <strong class="lounge-item-rank"><%= jrank %></strong>
                                  </span>
                                  <span class="lounge-item-thumbnail-area" style="background-image: url(/imgPath/<%= jgame.getG_no()%>-icon.png);"></span>
                                  <span class="lounge-item-info">
                                      <span class="lounge-item-name-wrap">
                                          <strong class="lounge-item-name"><%= jgame.getG_name() %></strong>
                                      </span>
                                      <span class="lounge-item-sub"><%= jgame.getG_com() %></span>
                                  </span>
                              </button>
                              <div class="lounge-item-homepage-area">
                                  <button type="button" class="homepage-button" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= jgame.getG_no()%>'"><i class="bi bi-house"></i> 방문하기</button>
                              </div>   
                          </div>
                      </li>
                  <% jrank++; } %>
                  </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>