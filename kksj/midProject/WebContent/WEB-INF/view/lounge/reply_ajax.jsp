<%@page import="kr.or.dw.lounge.vo.ReplyVO"%>
<%@page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getAttribute("replyVo") != null){
		ReplyVO replyVo = (ReplyVO)request.getAttribute("replyVo");
		Gson gson = new Gson();
		String reply = gson.toJson(replyVo);
%>
{
	"reply" : <%=reply %>
}
<% } %>