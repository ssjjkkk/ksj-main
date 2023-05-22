<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 테스트</title>
</head>
<body>
	<%
		// 이 영역은 Java 영역입니다.
		// JSP문서에서 request는 HttpServletRequest 객체의 참조값이 저장된 변수이다.
		// 			response는  HttpServletResponse 객체의 참조값이 저장된 변수이다.
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String userId = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	%>
	<div style="background-color:yellow">아이디 : <%= userId %></div>
	<div style="background-color:lime">비밀번호 : <%= pwd %></div>
</body>
</html>