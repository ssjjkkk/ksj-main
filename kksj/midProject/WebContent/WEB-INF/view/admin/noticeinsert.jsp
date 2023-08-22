<%@page import="kr.or.dw.customer.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<%
	NoticeVO noticeVo = null;
	if( request.getAttribute("noticeVo") != null){
		noticeVo = (NoticeVO) request.getAttribute("noticeVo");
	}
%>
                <div class="table">
                    <style>
                        .table {padding: 15px;}
                        .btn-write {padding: 10px 15px!important;border: 1px solid #333!important;}
                        .ck-editor__editable { height: 400px; }
                    </style>
                    <form name="fwrite" id="fwrite" action="<%=request.getContextPath()%>/admin/contentInsert.do" method="post">
	                    <% if(noticeVo != null){ %>
	                    <input type="hidden" name="n_no" value="<%= noticeVo.getN_no() %>">
	                    <%} %>
	                    <div class="mb-3">
	                        <label for="subject" class="form-label">제목</label>
	                        <input type="text" name="n_title" class="form-control" id="subject" value="<%= noticeVo != null ? noticeVo.getN_title() : "" %>" required>
	                    </div>
	                    <div class="mb-3">
	                        <textarea name="n_content" id="content" rows="30"><%= noticeVo != null ? noticeVo.getN_content() : "" %></textarea>
	                    </div>
	                    <div class="text-end write-btn">
	                        <button type="submit" class="btn btn-write"><%= noticeVo != null ? "수정하기" : "글쓰기" %></button>
	                    </div>
                    </form>
                    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
                    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
                    <script>
                    ClassicEditor.create( document.querySelector( '#content' ), {
                        language: "ko"
                    });
                    </script>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>