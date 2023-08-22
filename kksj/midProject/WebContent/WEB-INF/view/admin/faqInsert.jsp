<%@page import="kr.or.dw.customer.vo.FaqVO"%>
<%@page import="kr.or.dw.customer.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<%
	FaqVO faqVo = null;
	if( request.getAttribute("faqVo") != null){
		faqVo = (FaqVO) request.getAttribute("faqVo");
	}
%>
                <div class="table">
                    <style>
                        .table {padding: 15px;}
                        .btn-write {padding: 10px 15px!important;border: 1px solid #333!important;}
                        .ck-editor__editable { height: 400px; }
                    </style>
                    <form name="fwrite" id="fwrite" action="<%=request.getContextPath()%>/admin/fContentInsert.do" method="post">
	                    <% if(faqVo != null){ %>
	                    <input type="hidden" name="f_no" value="<%= faqVo.getF_no() %>">
	                    <%} %>
	                    <div class="mb-3">
	                        <label for="subject" class="form-label">제목</label>
	                        <input type="text" name="f_title" class="form-control" id="subject" value="<%= faqVo != null ? faqVo.getF_title() : "" %>" required>
	                    </div>
	                    <div class="mb-3">
	                        <textarea name="f_content" id="content" rows="30"><%= faqVo != null ? faqVo.getF_content() : "" %></textarea>
	                    </div>
	                    <div class="text-end write-btn">
	                        <button type="submit" class="btn btn-write"><%= faqVo != null ? "수정하기" : "글쓰기" %></button>
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