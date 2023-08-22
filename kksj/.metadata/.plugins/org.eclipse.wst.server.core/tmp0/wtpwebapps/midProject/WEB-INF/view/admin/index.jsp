<%@page import="kr.or.dw.customer.vo.FaqVO"%>
<%@page import="kr.or.dw.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
    <!-- 카운터 관련 테이블 -->
    <div class="count">
        <div class="row">
            <div class="col-12">
                <div class="quick_activity_wrap">
                    <!-- 통합 회원 수 -->
                    <div class="single_quick_activity d-flex">
                        <div class="icon">
                            <i class="bi bi-people"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter"><%= memCount %></span> </h3>
                            <p>회원</p>
                        </div>
                    </div>
                    <!-- 관리자 회원 수 -->
                    <div class="single_quick_activity d-flex">
                        <div class="icon">
                            <i class="bi bi-gear"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter"><%= adminCount %></span> </h3>
                            <p>관리자</p>
                        </div>
                    </div>
                    <!-- 통합 방문자 수 -->
<!--                     <div class="single_quick_activity d-flex"> -->
<!--                         <div class="icon"> -->
<!--                             <i class="bi bi-view-list"></i> -->
<!--                         </div> -->
<!--                         <div class="count_content"> -->
<!--                             <h3><span class="counter">0</span> </h3> -->
<!--                             <p>방문자</p> -->
<!--                         </div> -->
<!--                     </div> -->
                    <!-- 통합 게시물 수 -->
                    <div class="single_quick_activity d-flex">
                        <div class="icon">
                            <i class="bi bi-card-text"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter"><%= boardCount %></span> </h3>
                            <p>게시물</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <!-- 회원 정보 관련 테이블 -->
            <div class="col-6">
                <div class="user-list">
                    <div class="main-title mb-sm-15">
                        <h3 class="m-0 nowrap">회원 정보</h3>
                    </div>
                    <table class="user-table">
                    <thead>
                        <tr role="row">
                            <th scope="col" class="sorting_asc" style="width: 20%;">아이디</th>
                            <th scope="col" class="sorting">닉네임</th>
                            <th scope="col" class="sorting" style="width: 10%;">권한</th>
                            <th scope="col" class="sorting" style="width: 10%;">밴 여부</th>
                            <th scope="col" class="sorting" style="width: 20%;">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 회원 목록 리스트 -->
                        <%
                           for(MemberVO mem : memList) {
                        %>
                        <tr>
                          <td><%= mem.getId()%></td>
                          <td><%= mem.getNick()%></td>
                          <td>
                          <%if(mem.getAuth_cd() == null) {%>
                          <i class="bi bi-x"></i>
                          <%} else { %>
                          O
                          <%} %>
                          </td>
                          <td>
                          <%if(mem.getGb_ben().equals("N")) {%>
                          <i class="bi bi-x"></i>
                          <%} else { %>
                          O
                          <%} %>
                          </td>
                          <td>
                          <a class="btn btn-admin" href="<%= request.getContextPath()%>/admin/userInfo.do?user_no=<%= mem.getUser_no()%>"><i class="bi bi-gear"></i></a>
                          <a class="btn btn-admin" href="<%= request.getContextPath()%>/admin/userBen.do?user_no=<%= mem.getUser_no()%>&gb_ben=<%= mem.getGb_ben()%>"><i class="bi bi-slash-circle"></i></a>
                          <a class="btn btn-admin" href="<%= request.getContextPath()%>/admin/userDel.do?user_no=<%= mem.getUser_no()%>&gb_del=<%= mem.getGb_del()%>"><i class="bi bi-trash"></i></a>
                          </td>
                        </tr>
                        <%} %>
                    </tbody>
                    </table>
                </div>
            </div>
            <!-- 자주묻는질문 관련 테이블 -->
            <%
            	List<FaqVO> faqList = (List<FaqVO>)request.getAttribute("faqList");
            %>
            
            <div class="col-6">
                <div class="qna-list">
                    <div class="main-title mb-sm-15">
                        <h3 class="m-0 nowrap">자주묻는질문</h3>
                    </div>
                    <div class="Activity_timeline">
                        <ul>
                            <!-- 자주묻는질문 리스트 -->
                            <%
                            	for(FaqVO faq : faqList) {
                            %>
                            <li>
                                <div class="activity_bell"></div>
                                <div class="activity_wrap">
                                <h6><%= faq.getF_title()%></h6>
                                <p><%= faq.getF_content()%></p>
                                </div>
                            </li>
                            <%
                            	}
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>