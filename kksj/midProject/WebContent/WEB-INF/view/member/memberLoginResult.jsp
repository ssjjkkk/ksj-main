<%@page import="kr.or.dw.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
    <%
    	int result = (int)request.getAttribute("result");
    	if(result == 1){
    	
    %>
    		alert(" 환영합니다.");
    		location.href="<%= request.getContextPath()%>/main.do";
    <%	}else if (result == 0){%>
    		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
    		history.go(-1);
    <%}else {%>
    		alert("관리자에 의해 차단된 회원 입니다. sjk1523648@gmail.com 으로 문의 바랍니다.");
			history.go(-1);
    <%}%>
    </script>
