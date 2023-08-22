<%@page import="kr.or.dw.customer.vo.FaqVO"%>
<%@page import="kr.or.dw.customer.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
	List<FaqVO> faqList = (List<FaqVO>) request.getAttribute("faqList");

	FaqVO faqVo = null;
	if( request.getAttribute("faqVo") != null){
	faqVo = (FaqVO) request.getAttribute("faqVo");
}
%>
            <div class="col-12">
                <div class="table">
                    <div class="text-end write-btn">
                        <a href="<%=request.getContextPath() %>/admin/faqInsert.do" class="btn btn-dark">FAQ 작성하기</a>
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
                                    	for(FaqVO faq : faqList){
                                    		int f_no = faq.getF_no();
                                    		String f_title = faq.getF_title();
                                    		String nick = faq.getNick();
                                    	
                                    %>
                                        <tr>
                                            <td><%= f_no %></td>
                                            <td><a href="<%= request.getContextPath()%>/customer/faqSearch.do?faqSearch=<%= f_title %>" class="link"><%= f_title %></a></td>
                                            <td><%= nick %></td>
                                            <td>
                                                <a href="<%=request.getContextPath() %>/admin/faqInsert.do?f_no=<%= f_no %>" class="btn btn-primary">
                                                    <i class="bi bi-pencil-square"></i>
                                                </a>
                                                <a href="<%=request.getContextPath() %>/admin/faqDelete.do?f_no=<%= f_no %>" class="btn btn-danger">
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
                        <a href="<%=request.getContextPath() %>/admin/faqInsert.do" class="btn btn-dark">FAQ 작성하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>