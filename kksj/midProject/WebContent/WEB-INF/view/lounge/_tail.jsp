<%@page import="kr.or.dw.lounge.vo.LoungeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                </div>
            </div>
            <div class="col-lg-3">
                <!-- 사이드 메뉴 부분 -->
                <div class="side-menu">
                	<%if (session.getAttribute("user_no") != null) { %>
                    <a class="btn btn-write" href="<%= request.getContextPath()%>/lounge/write.do?g_no=<%= gameVo.getG_no()%>">글쓰기</a>
                    <%} %>
                    <div class="game-search">
                        <div class="SearchForm" data-style-type="LIGHT">
                            <form class="Form" action="<%= request.getContextPath()%>/lounge/search.do">
                            <input class="searchInput" type="text" placeholder="커뮤니티 게시물 검색" name="searchL">
                            <input type="hidden" name="g_no" value="<%= gameVo.getG_no()%>">
                            <button type="submit" class="btnSearch">검색하기</button>
                            </form>
                        </div>
                      	<div class="sidebar">
                            <small class="text-muted pl-3"><a href="#">전체 게시글</a></small>
                            <ul class="my-3">
                            	<%
                            		for (LoungeVO lounge : allLoungeList) {
                            	%>
                            	<ui>
                            		<a href="<%= request.getContextPath()%>/lounge/boardView.do?bd_no=<%= lounge.getBd_no()%>&g_no=<%= lounge.getG_no()%>"><%= lounge.getBd_title() %></a>
                            	</ui><br>
                            	<%
                            		}
                            	%>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 하단 풋터 부분 -->
                <div class="footer">
                    <cite>RedApp Korea ⓒ 2023</cite>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>