<%@page import="kr.or.dw.board.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../user/header.jsp" %>

<%
	BoardVO boardVo = (BoardVO)request.getAttribute("boardVo");
	if(boardVo.getPic_path() != null){
		src = "/profilePath/" + boardVo.getPic_path();
	}
	
	List<ReplyVO> replyList = (List<ReplyVO>)request.getAttribute("replyList");
	
	int userLike = 0;
	if(request.getAttribute("userLike") != null){
		userLike = Integer.parseInt(request.getAttribute("userLike").toString());
	}
		
	
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
%>

<script>
	$(function(){
		
		function replyTemplate(reply){
			let hidden = 'hidden';
			<% if(vo != null) { %>
				if(reply.user_no == "<%=vo.getUser_no()%>"){
					hidden = '';
				}
			<% } %>	
			let replySrc = "/profilePath/default/defaultProfile.jpg";
			
			if(reply.pic_path != null || reply.pic_path != ""){
				replySrc = "/profilePath/" + reply.pic_path
			};
			
// 			let deleteBtn = '<i class="fas fa-times"></i>';
			
<%-- 			if("<%=vo.getNick()%>" != reply.nick){ --%>
// 				deleteBtn = '';
// 			};
			
			$('#re_container').prepend(
				'<div class="row">'
			   +'	<div class="col-md-4 d-flex">'
			   +'		<div class="user-block col-md-8">'
			   +'			<img class="img-circle img-bordered-sm" src="' + replySrc + '" alt="user image">'
			   +'				<span class="username">' 
			   +'				<a href="#">' + reply.nick + '</a>'
			   +'				</span>'
			   +'			<span class="description">' + reply.re_wdt + '</span>'
			   +'		</div>'
			   +' 		<div class="icon-block col-md-4 align-self-center">'
			   +'			<input type="hidden" value="' + reply.re_no + '">'
			   +'			<a href="#" class="float-right btn-tool reply-delete-btn">'
			   +'				<i class="fas fa-times" ' + hidden + '></i>'
			   +'			</a>'
			   +'			<a href="#" class="float-right btn-tool reply-update-btn">'
			   +'				<i class="fas fa-pen" ' + hidden + '></i>'
			   +'			</a>'
			   +'		</div>'
			   +'	</div>'
			   +'	<div class="col-md-8 align-self-center">'
			   +'		<div class="reply-update">' + reply.re_content + '</div>'
			   +'	</div>'
			   +'</div><hr style="margin: 0">'
			);
			
		};
		
		function replyUpdateTemplate(target, update_re_no, update_re_content){
			
			$(target).after(
				 '<form id="re_update_form">'
				+	'<div class="d-flex">'
				+		'<input type="hidden" name="update_re_no" value="' + update_re_no + '">'
				+		'<input style="width: 90%;" type="text" name="update_re_content" value="' + update_re_content + '">'
				+		'<a style="width: 10%;" class="btn btn-default btn-sm reply-cancel-btn" href="#">취소</a>'
				+		'<input type="submit" hidden>'
				+	'</div>'
				+'</form>'
			)
		}
		
		let taskIsDone = false;	// 댓글 수정을 할 때 추가적인 form 태그 생성을 막기 위한 변수 
		
		// 댓글 등록
		$('#re_form').on('submit', function(e){
			e.preventDefault();
			
			if(<%=vo == null%>){
				alert('로그인 후 댓글 등록 가능합니다.');
				return;
			};
			
			let re_content = $('#re_form').find('input').val();
			$('#re_form').find('input').val('');	// 댓글을 입력하고 난 뒤 input 박스에 남아있는 댓글 내용을 지운다.
			let bd_no = "<%=boardVo.getBd_no()%>";
			
			$.ajax({
				url : "<%=request.getContextPath()%>/board/reply.do",
				dataType : "json",
				method : "post",
				data : {
					cmd : "insert",
					bd_no : bd_no,
					re_content : re_content
				},
				success : function(res){
					replyTemplate(res.reply);
				},
				error : function(err){
					alert(err.status);
				}
			});
		});
		
		// 댓글 수정
		$(document).on('click', '.reply-update-btn', function(e){
			let target = $(this).closest('div .row').find('.reply-update');
			let updateReplyNo = $(this).parents('.icon-block').find('input[type=hidden]').val();
			let bd_no = "<%=boardVo.getBd_no()%>";
			let updateReplyContent = $(target).text();
			
			if(!taskIsDone){
				replyUpdateTemplate(target, updateReplyNo, updateReplyContent);
				$(target).hide();
				taskIsDone = true;
			};
			
			function transReplyUpdateForm(){
				$('#re_update_form').remove();
				$(target).show();
				taskIsDone = false;
			};
			
			// 수정버튼 눌렀다가 취소 할 때
			$(document).on('click', '.reply-cancel-btn', transReplyUpdateForm);
			
			$('#re_update_form').on('submit', function(e){
				e.preventDefault();
				let re_update_form = $(this);
				let update_content = re_update_form[0].update_re_content.value;
				
				$.ajax({
					url : "<%=request.getContextPath()%>/board/reply.do",
					type : "post",
					dataType : "json",
					data : {
						cmd : "update",
						re_no : updateReplyNo,
						re_content : update_content,
						bd_no : bd_no
					},
					success : function(res){
						if(res.result == 1){
							$(target).text(update_content);
							transReplyUpdateForm();
						}
					},
					error : function(err){
						alert(err.status);
					}
				});
			});
		});
		
		// 댓글 삭제
		$(document).on('click', '.reply-delete-btn', function(e){
			if(confirm("삭제하시겠습니까?")){
				let deleteReplyNo = $(this).parents('.icon-block').find('input[type=hidden]').val();
				let target = $(this).closest('div .row');
				$.ajax({
					url : "<%=request.getContextPath()%>/board/reply.do",
					type : "post",
					dataType : "json",
					data : {
						cmd : "delete",
						re_no : deleteReplyNo,
						bd_no : "<%=boardVo.getBd_no()%>"
					},
					success : function(res){
						if(res.result == 1){
							$(target).remove();
						}
					},
					error : function(err){
						alert(err.status);
					}
				});
			}
		});
		
		// 좋아요 손가락 색상 변경 함수
		function changeLikeColor(){
			let l = $('#likeBtn');	// 좋아요 'a' 태그 요소 가져오기
			let flag = l.data('like');	// 가져온 'a' 태그의 data-like 속성값 확인
			if(flag){	// data-like 값으로 분개
				// 좋아요 눌려있을 때
				l.data('like', false);
				l.css('color', '#007bff');
			}else{
				// 좋아요를 안눌려있을 때
				l.data('like', true);
				l.css('color', '#6c757d');
			};
			
			return flag;
		}
		
		changeLikeColor();	// 페이지 최초 로딩시 좋아요 색상 변경하기 위해 호출
		
		// 좋아요
		$('#likeBtn').on('click', function(){
			if(<%=vo == null%>)	return; // 로그인을 했을 때만 이벤트 로직 수행
			let flag = changeLikeColor();
			
			$.ajax({
				url : "<%=request.getContextPath()%>/board/like.do",
				dataType : "json",
				type : "post",
				data : {
					bd_no : "<%=boardVo.getBd_no()%>",
					likeFlag : flag
				},
				success : function(res){
					console.log(res);
					$('#likeCnt').text('(' + res.count + ')');
				},
				error : function(err){
					alert(err.status);
				}
			});
		});
	});
</script>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3><%= boardVo.getBd_title() %></h3>
					</div>

					<div class="card-body p-0">
						<div class="mailbox-read-info">
							<div class="image">
								<img style="width: 5%;" src="<%=src%>" class="img-circle elevation-2">
								<%= boardVo.getNick() %>
							</div>
							<h6>
								<span class="mailbox-read-time float-right"><%= boardVo.getBd_wdt() %></span>
							</h6>
						</div>

						<div class="mailbox-read-message">
							<p><%= boardVo.getBd_content() %></p>
						</div>

					</div>

					<div class="card-footer">
						<div class="float-right">
						<% if ( vo != null && boardVo.getUser_no() == vo.getUser_no() ) { %>
							<a type="button" class="btn btn-default btn-sm" href="<%= request.getContextPath()%>/board/deleteContent.do?bd_no=<%=boardVo.getBd_no()%>">
								<i class="far fa-trash-alt"></i> 삭제
							</a>
							<a type="button" class="btn btn-default btn-sm" href="<%= request.getContextPath()%>/board/boardInsert.do?bd_no=<%=boardVo.getBd_no()%>">
								<i class="fas fa-pen"></i> 수정
							</a>
						<% } %>
							<a type="button" class="btn btn-default btn-sm" href="<%= request.getContextPath()%>/board/boardMain.do">
								<i class="fas fa-reply"></i> 목록
							</a>
						</div>
						<hr>
						<p>
							<a href="#" class="link-black text-sm mr-2">
								<i class="fas fa-share mr-1"></i> Share
							</a>
							<%
// 								String likeFlag = board
							%>
							
							<a href="#" class="link-black text-sm" id="likeBtn" data-like=<%=userLike == 1 ? true : false %>>
								<i class="far fa-thumbs-up mr-1"></i> Like <span id="likeCnt">(<%=boardVo.getBd_like() %>)</span>
							</a> 
							<span class="float-right"> 
								<a href="#" class="link-black text-sm"> 
									<i class="far fa-comments mr-1"></i> Comments (<%=boardVo.getReply_cnt() %>)
								</a>
							</span>
						</p>
						<form id="re_form">
							<input class="form-control form-control-sm" type="text" placeholder="Type a comment">
							<button type="submit" hidden></button>
						</form>
					</div>
				</div>
				<div class="card" id="re_container">
				<% 	
					for(ReplyVO replyVo : replyList) {
					String hidden = "hidden";
						if(vo != null && vo.getNick().equals(replyVo.getNick())) {
							hidden = "";
						};
				%>
					<div class="row">
						<div class="col-md-4 d-flex">
							<div class="user-block col-md-8">
								<img class="img-circle img-bordered-sm" src="<%= replyVo.getPic_path() == null ? "/profilePath/default/defaultProfile.jpg" : "/profilePath/" + replyVo.getPic_path() %>" alt="user image"> 
								<span class="username">
									<a href="#"><%= replyVo.getNick() %></a>
								</span>
								<span class="description"><%= replyVo.getRe_wdt() %></span>
							</div>
							<div class="icon-block col-md-4 align-self-center">
								<input type="hidden" value="<%=replyVo.getRe_no()%>">
								<a href="#" onclick="return false" class="float-right btn-tool reply-delete-btn">
									<i class="fas fa-times" <%=hidden %>></i>
 								</a>
								<a href="#" onclick="return false" class="float-right btn-tool reply-update-btn">
									<i class="fas fa-pen" <%=hidden %>></i>
 								</a>
							</div>
						</div>
						<div class="col-md-8 align-self-center">
							<div class="reply-update"><%= replyVo.getRe_content() %></div>
						</div>
					</div><hr style="margin: 0">
				<% } %>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>

<%@ include file="../user/footer.jsp" %>