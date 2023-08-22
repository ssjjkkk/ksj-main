<%@page import="kr.or.dw.customer.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
	List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");

	NoticeVO noticeVo = null;
	if( request.getAttribute("noticeVo") != null){
	noticeVo = (NoticeVO) request.getAttribute("noticeVo");
}
%>
            <div class="col-12">
                <div class="table">
                    <div class="text-end write-btn">
                        <a href="<%=request.getContextPath() %>/admin/noticeinsert.do" class="btn btn-dark">공지 작성하기</a>
                    </div>
                    <div class="main-box no-header clearfix">
                        <div class="main-box-body clearfix">
                            <div class="table-responsive">
                                <table class="table user-list">
                                    <thead>
                                        <tr>
                                        <th width="70px"><span>번호</span></th>
                                        <th class="text-center"><span>제목</span></th>
                                        <th width="120px"><span>작성자</span></th>
                                        <th width="107px"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    	for(NoticeVO notice : noticeList){
                                    		int n_no = notice.getN_no();
                                    		String n_title = notice.getN_title();
                                    		String nick = notice.getNick();
                                    	
                                    %>
                                        <tr>
                                            <td><%= n_no %></td>
                                            <td><a href="<%= request.getContextPath()%>/customer/noticeView.do?n_no=<%= n_no %>" class="link"><%= n_title %></a></td>
                                            <td><%= nick %></td>
                                            <td>
                                                <a href="<%=request.getContextPath() %>/admin/noticeinsert.do?n_no=<%= n_no %>" class="btn btn-primary">
                                                    <i class="bi bi-pencil-square"></i>
                                                </a>
                                                <a href="<%=request.getContextPath() %>/admin/noticeDelete.do?n_no=<%= n_no %>" class="btn btn-danger">
                                                    <i class="bi bi-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                     <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="text-end write-btn">
                        <a href="<%=request.getContextPath() %>/admin/noticeinsert.do" class="btn btn-dark">공지 작성하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>