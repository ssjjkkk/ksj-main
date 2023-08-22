<%@page import="kr.or.dw.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_head.jsp"%>
<%
	MemberVO memberVo = (MemberVO)request.getAttribute("memberVo");
	LoungeVO loungeVo = null;
	if( request.getAttribute("loungeVo") != null){
		loungeVo = (LoungeVO) request.getAttribute("loungeVo");
	}
%>
<div class="table">
    <style>
        .table {padding: 15px;}
        .btn-write {padding: 10px 15px!important;border: 1px solid #333!important;}
        .ck-editor__editable { height: 400px; }
    </style>
    <form name="fwrite" id="fwrite" action="<%=request.getContextPath()%>/lounge/contentInsert.do" onsubmit="return fwrite_submit(this);" method="post">
     
    <input type="hidden" name="w" value="<%= memberVo.getUser_no()%>">
    <input type="hidden" name="wr_id" value="<%= gameVo.getG_no()%>">
    <input type="hidden" name="app_id" value="<%= memberVo.getNick()%>">
    <%if (loungeVo != null) { %>
    <input type="hidden" name="board_id" value="<%= loungeVo.getBd_no()%>">
    <%} %>
    <div class="mb-3">
        <label for="subject" class="form-label">제목</label>
        <input type="text" name="subject" class="form-control" id="subject" value="<%=loungeVo != null ? loungeVo.getBd_title() : ""%>" required>
    </div>
    <div class="mb-3">
        <textarea name="content" id="content" rows="30"><%=loungeVo != null ? loungeVo.getBd_content() : ""%></textarea>
    </div>
    <div class="text-end write-btn">
        <button type="submit" class="btn btn-write">글쓰기</button>
    </div>
    </form>
    <script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
    <script>
    ClassicEditor.create( document.querySelector( '#content' ), {
        ckfinder: {
            uploadUrl: '../lounge/image_upload.php'
        }
    })
    .catch(error => {
        console.error(error);
    });
    </script>
</div>
<%@ include file="_tail.jsp"%>