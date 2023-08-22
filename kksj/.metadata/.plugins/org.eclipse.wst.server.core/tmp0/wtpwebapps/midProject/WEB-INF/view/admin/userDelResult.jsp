<%@page import="kr.or.dw.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
    <%
    	int result = (int)request.getAttribute("result");
    	if(result == 1){
    	
    %>
    		alert("회원이 삭제 되었습니다.");
    		location.href="<%= request.getContextPath()%>/admin/admin.do";
    <%}else {%>
    		alert("회원을 삭제할 수 없습니다.");
			history.go(-1);
    <%}%>
    </script>
