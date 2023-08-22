<%@page import="kr.or.dw.customer.vo.FaqVO"%>
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
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/faq.css">
<script src="<%= request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath()%>/js/all.min.js"></script>

</head>
<body>
<%@ include file="../gnb.jsp"%>
<%
	List<FaqVO> faqList = (List<FaqVO>)request.getAttribute("faqList");
	List<FaqVO> faqSearchList = (List<FaqVO>)request.getAttribute("faqSearchList");
	String faqSearch = "" + request.getAttribute("faqSearch");
	if (faqSearchList == null) {
		faqSearch = "질문";
	};
	if (!faqSearch.equals("질문")) {
%>
<script>
$(function () {
	$('#skBtn').click();
})
</script>
<%}%>
<div class="customer">
    <div class="container">
        <div class="row">
            <ul class="tablist">
                <li><a href="<%= request.getContextPath()%>/customer/company.do">사이트소개</a></li>
                <li><a href="<%= request.getContextPath()%>/customer/notice.do">공지사항</a></li>
                <li class="active"><a href="<%= request.getContextPath()%>/customer/faq.do">자주묻는질문</a></li>
                <li><a href="<%= request.getContextPath()%>/customer/sitemap.do">전체서비스</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="wrapper bg-white rounded shadow">
    <div class="h2 text-center fw-bold">자주묻는질문</div>
    <div class="h3 text-primary text-center">어떻게 도와 드릴까요?</div>
    <div class="d-flex justify-content-center">
        <div class="search w-75 d-flex align-items-center">
            <span class="fas fa-search text-dark"></span>
            <form action="<%= request.getContextPath()%>/customer/faqSearch.do">
            	<input type="text" class="form-control" placeholder="질문을 검색해보세요." name="faqSearch">
            	<button type="submit" hidden></button>
            </form>
        </div>
    </div>
    <div class="accordion accordion-flush border-top border-start border-end" id="myAccordion">
        <div class="accordion-item">
            <%if (faqSearchList != null){
            	for (FaqVO faq : faqSearchList) {
            %>
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed border-0" id="skBtn" type="button" data-bs-toggle="collapse" data-bs-target="#flush-<%= faq.getF_no() %>" aria-expanded="false" aria-controls="flush-<%= faq.getF_no() %>">
					<%= faq.getF_title()%>
				</button>
			</h2>
			<div id="flush-<%= faq.getF_no() %>" class="accordion-collapse collapse border-0" aria-labelledby="flush-headingOne" data-bs-parent="#myAccordion">
				<div class="accordion-body p-0">
					<ul class="list-unstyled m-0">
						<li><%= faq.getF_content() %></li>
					</ul>
				</div>
			</div>
			<%
            	}
            } else {
            	for (FaqVO faq : faqList) {
			%>
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed border-0" id="skBtn" type="button" data-bs-toggle="collapse" data-bs-target="#flush-<%= faq.getF_no()%>" aria-expanded="false" aria-controls="flush-<%= faq.getF_no() %>">
					<%= faq.getF_title()%>
				</button>
			</h2>
			<div id="flush-<%= faq.getF_no()%>" class="accordion-collapse collapse border-0" aria-labelledby="flush-headingOne" data-bs-parent="#myAccordion">
				<div class="accordion-body p-0">
					<ul class="list-unstyled m-0">
						<li><%= faq.getF_content() %></li>
					</ul>
				</div>
			</div>
			<%
            	}
            }
			%>
		</div>
    </div>
</div>
</body>
</html>