<%@page import="kr.or.dw.member.vo.MemberVO"%>
<%@page import="kr.or.dw.lounge.vo.ReplyVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="_head.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/notice.css">
<style>
.latest-all .latest-all-title {
   border-bottom: 2px solid #a7a7a7;
}

.latest-all .latest-all-title .title-main {
   display: inline-block;
   width: auto;
   font-size: 1.35rem;
   font-weight: 700;
   border-bottom: 2px solid #333;
   padding: 10px;
   margin: 0;
}

.latest-all .latest-all-title .title-more {
   margin-top: 10px;
   margin-right: 10px;
   padding: 0;
   color: #333;
   text-decoration: none;
}
</style>
<%
   LoungeVO loungeVo = (LoungeVO) request.getAttribute("loungeVo");
   List<ReplyVO> replyList = (List<ReplyVO>)request.getAttribute("replyList");
   DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
   
   int userLike = 0;
   if(request.getAttribute("userLike") != null){
      userLike = Integer.parseInt(request.getAttribute("userLike").toString());
   }
%>
<script>
   $(function(){
      
      function replyTemplate(reply){
         
         $('#re_container').prepend(
           '<div class="list">'   
                 +'   <span class="nickname">'
                 +'      <a href="#">' + reply.nick + '</a>'
                 +'   </span>'
                 +'   <span class="time">' + reply.re_wdt + '</span>'
                 +'   <div class="commcont">' + reply.re_content + '</div>'
                 +' </div>'
         );
      };
      
      $('#re_form').on('submit', function(e){
         e.preventDefault();
         console.log("<%= gameVo.getG_no()%>");
         let re_content = $('#re_form').find('#textbox').val();
         let bd_no = "<%=loungeVo.getBd_no()%>";
         
         $.ajax({
            url : "<%=request.getContextPath()%>/lounge/reply.do",
            dataType : "json",
            method : "post",
            data : {
               "bd_no" : bd_no,
               "re_content" : re_content,
               "g_no" : <%= gameVo.getG_no()%>
            },
            success : function(res){
               console.log(res);
               replyTemplate(res.reply);
            },
            error : function(){
               
            }
         });
         $('#re_form').find('#textbox').val("");
      });
      
     // 좋아요 손가락 색상 변경 함수
      function changeLikeColor(){
         let l = $('#likeBtn');   // 좋아요 'a' 태그 요소 가져오기
         let flag = l.data('like');   // 가져온 'a' 태그의 data-like 속성값 확인
         if(flag){   // data-like 값으로 분개
            // 좋아요 눌려있을 때
            l.data('like', false);
            $("#likeBtn").css("color","#ce330e");
         }else{
            // 좋아요를 안눌려있을 때
            l.data('like', true);
            $("#likeBtn").css("color","#333");
         };
         
         return flag;
      }
      
      changeLikeColor();   // 페이지 최초 로딩시 좋아요 색상 변경하기 위해 호출
      
      // 좋아요
      $('#likeBtn').on('click', function(){
         if(<%=session.getAttribute("user_no") == null%>)   return; // 로그인을 했을 때만 이벤트 로직 수행
         let flag = changeLikeColor();
         
         $.ajax({
            url : "<%=request.getContextPath()%>/lounge/like.do",
            dataType : "json",
            type : "post",
            data : {
               bd_no : "<%=loungeVo.getBd_no()%>",
               likeFlag : flag,
               g_no : "<%= gameVo.getG_no()%>"
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
      $('#textBox').keyup(function (e) {
         let content = $(this).val();
          
          // 글자수 세기
          if (content.length == 0 || content == '') {
             $('#count').text('0');
          } else {
             $('#count').text(content.length);
          }
          
          // 글자수 제한
          if (content.length > 200) {
             // 200자 부터는 타이핑 되지 않도록
              $(this).val($(this).val().substring(0, 200));
              // 200자 넘으면 알림창 뜨도록
              alert('글자수는 200자까지 입력 가능합니다.');
          };
      });
   });
</script>
<div class="notice-wrapper">
   <div class="container">
      <div class="board-view">
         <div class="phead">
            <div class="title">
               <%=loungeVo.getBd_title()%>
            </div>
            <div class="right">
               <span class="nick"><%=loungeVo.getNick()%></span>
               <span class="date"><i class="bi bi-clock"></i> <%=loungeVo.getBd_wdt()%></span>
               <span class="like"><i class="bi bi-heart"></i> <%= loungeVo.getBd_like() %></span>
            </div>
         </div>
         <div class="pbody">
            <div class="ck-content">
               <p><%=loungeVo.getBd_content()%></p>
            </div>
         </div>
         <style>
         .board-view {
          padding: 0;
          background: #fff;
          border-radius: 0;
          -webkit-box-shadow: none;
          box-shadow: none;
        }
         .board-view .nick,
         .board-view .date,
         .board-view .like {
          font-size: 0.90rem;
          font-weight: 300;
          margin-left: 5px;
          color: #909090;
         }
         .board-view .nick {
          color: #333;
          font-weight: 700;
        }
         .board-view .btnArea .like:hover,
         .board-view .btnArea .like {
            background: transparent;
            border: 2px solid #e6e6e6;
          border-radius: 50%;
          width: 48px;
          height: 48px;
         }
         .board-view .btnArea .like a {
            display: block;
            padding: 3px 0 0;
            color: #333;
            font-size: 1.65rem;
            text-align: center;
         }
         </style>
         <div class="btnArea">
            <div class="like"><a href="#" id="likeBtn" data-like=<%=userLike == 1 ? true : false %>><i class="bi bi-heart-fill"></i></a></div>
            <div class="sns">
               <ul class="clearfix">
                  <li class="link"><a href="#" onclick="return false;"
                     data-clipboard-text="localhost/lounge/boardView.do?n_no=<%=loungeVo.getBd_no()%>"
                     class="btnUrlCopyToClipboard">주소복사</a></li>
               </ul>
            </div>
         </div>
         <div class="btmBtns">
            <ul class="clearfix">
               <li class="list">
               <a href="<%= request.getContextPath()%>/lounge/gameLounge.do?bd_no=<%= loungeVo.getBd_no()%>&g_no=<%= gameVo.getG_no()%>">목록</a>
               </li>
               <li class="list">
               <%if (session.getAttribute("user_no") != null && session.getAttribute("user_no").equals(loungeVo.getUser_no())) { %>
               <a href="<%= request.getContextPath()%>/lounge/write.do?g_no=<%= gameVo.getG_no()%>&bd_no=<%= loungeVo.getBd_no()%>">수정</a>
               <%} %>
               </li>
            </ul>
            <style>
            .bottom_txar_wrap {
             height: 170px;
             background-color: #e8eaee;
             border: 1px solid #dcdde1;
         }
            .bottom_txar_wrap .txar {
             float: left;
             padding: 20px;
             width: calc(100% - 20px);
             height: 90px;
             margin-top: 10px;
             margin-left: 10px;
             background-color: #fff;
             resize: none;
             overflow: hidden;
             overflow-y: auto;
         }
         .bottom_txar_btn {
             position: relative;
             float: left;
             margin-top: 11px;
             width: 100%;
             height: 42px;
             line-height: 42px;
             padding: 0 10px;
         }
         .glist_number {
             float: left;
             margin-right: 20px;
             font-size: 14px !important;
             color: #666666;
             margin-right: 10px;
         }
         .bottom_txar_btn span {
             float: left;
             margin-right: 0px;
             font-size: 12px;
             color: #666666;
         }
         .bottom_txar_btn span .btn-write {
             width: 100%;
             background: #d63338;
             color: #fff;
             padding: 7px 5px;
             border-radius: 0;
         }
            </style>
            <div class="bottom_txar_wrap" style="">
             <form id="re_form">
             <textarea id="textbox" name="comment" cols="30" rows="10" class="txar" placeholder="댓글을 입력하세요."></textarea>
             <div class="bottom_txar_btn">
                 <div class="float-end text-end">
                     <div class="glist_number">(<em id="count">0</em>/200)</div>
                     <span><button type="submit" class="btn btn-write" >댓글등록</button></span>
                 </div>
             </div>
            </form>   
         </div>
            <style>
            .comment {
               width: 100%;
               padding: 15px 0;
               border-top: 2px solid #333;
            }
            .comment a {
               text-decoration: none;
               color: #333;
            }
            .comment .list {
               padding:15px 0;
               border-bottom: 1px solid #eee;
            }
            .comment .list .nickname {
               font-size:1.05rem;
               font-weight: 700;
            }
            .comment .list .time {
               font-size:0.95rem;
               font-weight: normal;
               margin-left: 5px;
               letter-spacing: -0.05em;
            }
            .comment .list .commcont {
               margin: 5px 0 0;
               font-size: 0.85rem;
            }
            </style>
            <div class="comment" id="re_container">
            <%
               if(replyList != null) {
                  for(ReplyVO replyVo : replyList){
            %>
               <div class="list">   
                  <span class="nickname">
                     <a href="<%=request.getContextPath()%>/admin/userInfo.do?user_no=<%= replyVo.getUser_no()%>"> <%= replyVo.getNick() %> </a>
                  </span>
                  <span class="time"> <%= formatter.format(replyVo.getRe_wdt())%> </span>
                  <div class="commcont"><%= replyVo.getRe_content() %></div>
               </div>
            <%
                  }
               }
            %>
            </div>
            
         </div>
      </div>
   </div>
</div>
<%@ include file="_tail.jsp"%>