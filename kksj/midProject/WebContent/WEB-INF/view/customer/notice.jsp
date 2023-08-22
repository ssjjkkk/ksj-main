<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.util.PaginationUtil"%>
<%@page import="kr.or.dw.customer.vo.NoticeVO"%>
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
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/notice.css">
<script src="<%= request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath()%>/js/all.min.js"></script>
<script src="<%= request.getContextPath()%>/js/clipboard.min.js"></script>
<script src="<%=request.getContextPath()%>/js/alert.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/alert.min.css">
<%
	NoticeVO noticeVo = (NoticeVO)request.getAttribute("noticeVo");
	List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");
%>

<script>
// 자바스크립트 & 제이쿼리에서 사용하는 데이터 정보 함수
// var is_member = '<?php echo isset($is_member)?$is_member:''; ?>';
// var is_admin  = '<?php echo isset($is_admin)?$is_admin:''; ?>';
</script>
</head>
<body>
<%@ include file="../gnb.jsp"%>
<div class="customer">
    <div class="container">
        <div class="row">
            <ul class="tablist">
                <li><a href="javascript:alert('개발 준비중 입니다.','self_close');">사이트소개</a></li>
                <li class="active"><a href="<%request.getContextPath(); %>/customer/notice.do">공지사항</a></li>
                <li><a href="<%request.getContextPath(); %>/customer/faq.do">자주묻는질문</a></li>
                <li><a href="<%request.getContextPath(); %>/customer/sitemap.do">전체서비스</a></li>
            </ul>
        </div>
    </div>
</div>
<%
if (noticeVo == null) {
%>
<div class="notice-wrapper">
    <div class="container">
        <div class="table-list">
            <ul class="list clearfix">
            <%
            	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            	for(NoticeVO notice : noticeList) { 
            %>
                <li class="dep1">
                    <div class="fL leftInfo d-none d-md-block"><span class="sort"><%= notice.getN_no() %></span></div>
                    <div class="fL titInfo">
                        <p class="tit"><a href="<%= request.getContextPath()%>/customer/noticeView.do?n_no=<%= notice.getN_no()%>"><%= notice.getN_title() %></a></p>
                    </div>
                    <div class="etc d-none d-md-block">
                        <ul class="clearfix">
                            <li class="date">
                                <span class="ico"><img src="https://moku.store/img/common/ico_time.png" alt="time"></span>
                                <span><%=formatter.format(notice.getN_wdt()) %></span>
                            </li>
                        </ul>
                    </div>
                </li>
            <%} %>
            </ul>
            <div class="table-paging">
				<%
                   PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");
                %>
                <%= pagination.getPaginationHtml(request, new String[] {"search"}) %>
            </div>
        </div>
    </div>
</div>

<%
}else{
%>
<div class="notice-wrapper">
    <div class="container">
        <div class="board-view">
            <div class="phead">
                <div class="title">
                    <%= noticeVo.getN_title()%>
                </div>
                <div class="right">
                    <div class="category">
                        공지
                    </div>
                    <span class="date"><%= noticeVo.getN_wdt()%></span>
                </div>
            </div>
            <div class="pbody">
                <div class="ck-content">
                    <p><%= noticeVo.getN_content()%></p>
                </div>
            </div>
            <div class="btnArea">
                <div class="sns">
                    <ul class="clearfix">
                        <li class="link"><a href="#" onclick="return false;" data-clipboard-text="localhost/customer/noticeView.do?n_no=<%= noticeVo.getN_no()%>" class="btnUrlCopyToClipboard">주소복사</a></li>
                    </ul>
                </div>
            </div>
            <div class="btmBtns">
                <ul class="clearfix">
                    <li class="list"><a href="<%request.getContextPath(); %>/customer/notice.do">목록</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%} %>
<script>
$(document).ready(function () {
  new ClipboardJS('.btnUrlCopyToClipboard');
  $('.btnUrlCopyToClipboard').on("click", function () {
    alert("복사되었습니다."); 
  });
});
</script>
</body>
</html>