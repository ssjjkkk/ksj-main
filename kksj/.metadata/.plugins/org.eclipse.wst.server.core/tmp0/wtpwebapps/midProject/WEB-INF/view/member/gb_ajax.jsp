<%@page import="kr.or.dw.member.vo.GBookVO"%>
<%@page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getAttribute("gBVo") != null){
		GBookVO gBVo = (GBookVO)request.getAttribute("gBVo");
		Gson gson = new Gson();
		String gB = gson.toJson(gBVo);
%>
{
	"gB" : <%= gB%>
}
<% } %>