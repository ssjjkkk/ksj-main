<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_head.jsp"%>
<style>
.type-list {
    margin: 0;
    padding: 0;
    list-style: none;
    border-top: 1px solid #eaecef;
}
.type-list li {
    position: relative;
    height: 61px;
    padding: 12px 0 8px;
    border-bottom: 1px solid #f4f4f4;
    box-sizing: border-box;
}
.type-list a {
    color: #333;
    text-decoration: none;
}
.type-list h3 {
    overflow: hidden;
    position: relative;
    max-width: 750px;
    padding-left: 8px;
    margin-bottom: 5px;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.3em;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
    box-sizing: border-box;
}
.type-list .article-info {
    padding-left: 8px;
    font-size: 12px;
    color: #999;
}
.type-list .article-info dd.writer {
    display: inline;
    margin-right: 30px;
}
.type-list .article-info dd {
    display: inline-block;
    line-height: 16px;
}
.type-list .article-info dd > span {
    position: relative;
    padding-left: 24px;
    margin-right: 10px;
}
.type-list .article-info dd > span::before {
    position: absolute;
    left: 0;
    top: 20%;
    width: 20px;
    height: 14px;
    background-image: url(https://dszw1qtcnsa5e.cloudfront.net/bin/live/console-community-view/assets/web/pc/icon-list.png);
    content: "";
}
.type-list .article-info dd span.date::before {
    background-image: none;
}
.type-list .article-info dd span.count-likes::before {
    background-position-x: -100%;
}
.type-list .article-info dd span.count-comment {
    position: absolute;
    right: 0;
    top: 12px;
    width: 70px;
    padding: 0;
    margin: 0;
    text-align: center;
}
.type-list .article-info dd span.count-comment::before {
    display: block;
    position: static;
    width: 30px;
    height: 24px;
    margin: 0 auto;
    background-image: url(https://dszw1qtcnsa5e.cloudfront.net/bin/live/console-community-view/assets/web/pc/icon-list-comment.png);
    background-position-x: -200%;
    content: "";
}
</style>
<ul class="type-list">
<%
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	for(LoungeVO lounge : loungeList) {
%>
    <li>
        <a href="<%= request.getContextPath()%>/lounge/boardView.do?bd_no=<%= lounge.getBd_no()%>&g_no=<%= gameVo.getG_no()%>"><h3><span><%= lounge.getBd_title() %></span></h3></a>
        <dl class="article-info">
            <dd class="writer"><%= lounge.getNick()%></dd>
            <dd><span class="date"><%= formatter.format(lounge.getBd_wdt())%></span><span class="count-read"><%= lounge.getBd_hit() %></span><span class="count-likes"><%= lounge.getBd_like() %></span><span class="count-comment"><%= lounge.getReply_cnt() %></span></dd>
        </dl>
    </li>
<%
	}
%>
</ul>
<!--                 </div> -->
<!--             </div> -->
<%@ include file="_tail.jsp"%>