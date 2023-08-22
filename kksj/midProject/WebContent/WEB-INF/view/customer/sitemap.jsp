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
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/sitemap.css">
<script src="<%= request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath()%>/js/all.min.js"></script>
</head>
<body>
<%@ include file="../gnb.jsp"%>
<div class="customer">
    <div class="container">
        <div class="row">
            <ul class="tablist">
                <li><a href="javascript:alert('개발 준비중 입니다.','self_close');">사이트소개</a></li>
                <li><a href="<%= request.getContextPath()%>/customer/notice.do">공지사항</a></li>
                <li><a href="<%= request.getContextPath()%>/customer/faq.do">자주묻는질문</a></li>
                <li class="active"><a href="<%= request.getContextPath()%>/customer/sitemap.do">전체서비스</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="sitemap-wrapper">
    <div class="container">
        <div class="sitemap-content">
            <div class="sitemapList">
                <div class="gnbCell">
                    <h3><a href="<%= request.getContextPath()%>/main.do">HOME <i class="bi bi-link-45deg"></i></a></h3>
                </div>
                <div class="gnbCell">
                    <h3><a href="<%= request.getContextPath()%>/lounge/index.do">게임 라운지 <i class="bi bi-link-45deg"></i></a></h3>
                </div>
                <div class="gnbCell">
                    <h3>종합랭킹</h3>
                    <ul>
                        <li><a href="<%= request.getContextPath()%>/ranking/lounge.do">게임랭킹</a></li>
                        <li><a href="<%= request.getContextPath()%>/ranking/subscribe.do">구독랭킹</a></li>
                    </ul>
                </div>
                <div class="gnbCell">
                    <h3><a href="https://news.kmib.co.kr/article/list.asp?sid1=spo&sid2=0012">e스포츠 <i class="bi bi-link-45deg"></i></a></h3>
                </div>
                <div class="gnbCell">
                    <h3><a href="<%= request.getContextPath()%>/customer/index.do">고객센터 <i class="bi bi-link-45deg"></i></a></h3>
                    <ul>
                        <li><a href="javascript:alert('개발 준비중 입니다.','self_close');">사이트소개</a></li>
                        <li><a href="<%= request.getContextPath()%>/customer/notice.do">공지사항</a></li>
                        <li><a href="<%= request.getContextPath()%>/customer/faq.do">자주묻는질문</a></li>
                        <li><a href="<%= request.getContextPath()%>/customer/sitemap.do">전체서비스</a></li>
                    </ul>
                </div>
            </div>
<!--             <div class="loungeTitle"> -->
<!--                 <h3>모든 라운지 목록</h3> -->
<!--             </div> -->
<!--             <div class="loungeList"> -->
<!--                 <div class="gnbCell"> -->
<!--                     <h3>A-Z</h3> -->
<!--                 </div> -->
<!--                 <div class="gnbCell"> -->
<!--                     <h3>가-나</h3> -->
<!--                 </div> -->
<!--                 <div class="gnbCell"> -->
<!--                     <h3>다-라</h3> -->
<!--                 </div> -->
<!--                 <div class="gnbCell"> -->
<!--                     <h3>마-바</h3> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="loungeList"> -->
<!--                 <div class="gnbCell"> -->
<!--                     <h3>사-아</h3> -->
<!--                 </div> -->
<!--                 <div class="gnbCell"> -->
<!--                     <h3>자-차</h3> -->
<!--                 </div> -->
<!--                 <div class="gnbCell"> -->
<!--                     <h3>카-타</h3> -->
<!--                 </div> -->
<!--                 <div class="gnbCell"> -->
<!--                     <h3>파-하</h3> -->
<!--                 </div> -->
<!--             </div> -->
        </div>
    </div>
</div >
</body>
</html>