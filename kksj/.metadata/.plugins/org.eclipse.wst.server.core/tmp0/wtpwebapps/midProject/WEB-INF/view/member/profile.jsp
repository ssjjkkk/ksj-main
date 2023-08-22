<%@page import="kr.or.dw.member.vo.GBookVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.lounge.vo.LoungeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.dw.ranking.vo.GameVO"%>
<%@page import="kr.or.dw.util.BuildSqlMapClient"%>
<%@page import="kr.or.dw.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/fonts.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/gnb.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/profile.css">
<script src="<%= request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath()%>/js/all.min.js"></script>
<script>
// 자바스크립트 & 제이쿼리에서 사용하는 데이터 정보 함수
// var is_member = '<?php echo isset($is_member)?$is_member:''; ?>';
// var is_admin  = '<?php echo isset($is_admin)?$is_admin:''; ?>';
<%
   String picSrc = "/profilePath/default/defaultProfile.png"; 

   MemberVO memberVo = (MemberVO)request.getAttribute("memberVo");
   if(memberVo.getProfile() != null) {
      picSrc = "/profilePath/" + memberVo.getProfile();
   }
   String userId = memberVo.getId();
   String userNick = memberVo.getNick();
   String userPass = memberVo.getPass();
   String gb_del = memberVo.getGb_del();
   String profile_txt = memberVo.getProfile_txt();
   int u_no = memberVo.getUser_no();
   
   int memberBoardCount = (int)request.getAttribute("memberBoardCount");
   int memberReplyCount = (int)request.getAttribute("memberReplyCount");
   
   List<GameVO> memGameList = (List<GameVO>)request.getAttribute("memGameList");
   
   List<GBookVO> gbList = (List<GBookVO>)request.getAttribute("gbList");
   DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
%>
<%
   if(memberVo.getProfile() == null) {
%>
$(function () {
   $('#deleteBtn').attr('style', 'display: none;');
})
<%}%>

$(function(){
   
   function imgFilePreview(e) {
      let reader = new FileReader();
      
      reader.onload = function (e) {
         $('#profile_picture').attr('src', e.target.result);
      };
      
      reader.readAsDataURL(e.target.files[0]);
      
      $('#uploadBtn').toggle();     
   };
   
        
    $('#image').on('change', imgFilePreview);
   
    $("#uploadBtn").click(function() {
          event.preventDefault();
        var formData = new FormData($('#uploadForm')[0]);
        
          $.ajax({
               url: '<%= request.getContextPath()%>/file/ProfilePicture.do?user_no=<%=u_no%>',
               processData: false,
               contentType: false,
               data: formData,
               dataType : 'json',
               type: 'POST',
               success: function(response) {
                  
               },
               error : function(request) {
               
            }
          });
          alert('프로필 사진이 저장 되었습니다.');
          $('#uploadBtn').toggle();
          $('#deleteBtn').attr('style', 'display: inline;');
      });
    
    
    $("#deleteBtn").click(function() {
          event.preventDefault();
        var formData = new FormData($('#uploadForm')[0]);
          $.ajax({
               url: '<%= request.getContextPath()%>/file/deletePicture.do?user_no=<%=u_no%>',
               processData: false,
               contentType: false,
               data: formData,
               type: 'POST',
               success: function(response) {
                   
               },
            error : function(request) {
                
            }
          });
        $('#image').val('');
       $('#profile_picture').attr('src', '/profilePath/default/defaultProfile.png');
       $("#deleteBtn").attr('style', 'display: none;');
       alert('프로필 사진이 삭제 되었습니다.');
      });
    
    
    function gBTemplate(gB){
        
        $('#gb_container').prepend(
          '<div class="list">'   
                +'   <span class="nickname">'
                +'      <a href="#">' + gB.nick + '</a>'
                +'   </span>'
                +'   <span class="time">' + gB.b_wdt + '</span>'
                +'   <div class="commcont">' + gB.b_content + '</div>'
                +' </div>'
        );
     };
     
     $('#gb_form').on('submit', function(e){
        e.preventDefault();
        let b_content = $('#gb_form').find('#gbbox').val();
        
        $.ajax({
           url : "<%=request.getContextPath()%>/member/gb.do",
           dataType : "json",
           method : "post",
           data : {
              "b_content" : b_content
           },
           success : function(res){
              console.log(res);
              gBTemplate(res.gB);
           },
           error : function(){
              
           }
        });
        $('#gb_form').find('#gbbox').val("");
     });
    
    
    
    
    
    
});

</script>
</head>
<body>
<%@ include file="../gnb.jsp"%>
<div class="profile-header">
    <div class="container" style="height: 100%">
        <div class="profile-info-wrap">
            <div class="profile-info">
                <!-- 프로필 사진 부분 -->
                <div class="profile-image-area">
                   
                    <form id="uploadForm" method="post" enctype="multipart/form-data">
                       <div class="style-profile" style="width: 120px; height: 120px;">
                          <input type="hidden" name="userid" value="<%= userId %>">
                              <div class="my-profile">
                                 <label class="label-profile" for="image">
                                     <img id="profile_picture" src="<%= picSrc%>" alt="user profile picture">
                                   <%if(user_no.equals(u_no)|| auth_cd != null) {%>
                                   <input type="file" name="image" id="image" accept="image/png, image/jpeg, image/gif, image/jpg" hidden>
                                   <input type="button" id="uploadBtn" value="업로드하기" name="btn" style="display: none;">
                                   <input type="button" id="deleteBtn" value="삭제하기" name="btn" style="display: inline;">
                                   <%}%>
                                 </label>      
                              </div>
                       </div>
                    </form>
                    
                </div>
                <!-- 회원 정보 부분 -->
                <div class="profile-name">
                    <strong class="profile-nickname"><%= userNick %></strong>
                    <div class="profile-userid">@<%= userId %></div>
                    <%if(profile_txt == null) {%>
                    <div class="profile-introduce">한줄 자기소개 작성해보세요</div>
                    <%} else {%>
                    <div class="profile-introduce"><%= profile_txt%></div>
                    <%} %>
                </div>
            </div>
            <!-- 프로필 버튼 부분 -->
            <div class="profile-btn">
                <button>임시버튼</button>
            </div>
        </div>
    </div>
</div>
<div class="profile-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="side">
<%--                     <%if(user_no.equals(u_no)|| auth_cd != null) {%> --%>
<!--                     <a href="#" class="btn btn-activity"><i class="bi bi-journal-check"></i>나의 활동</a> -->
<%--                     <%} else {%> --%>
<!--                     <a href="#" class="btn btn-activity"><i class="bi bi-journal-check"></i>유저 활동</a> -->
<%--                     <%} %> --%>
                    <a href="#" class="btn btn-activity"><i class="bi bi-clipboard-check"></i>가입 커뮤니티</a>
                    <a href="#" class="btn btn-activity"><i class="bi bi-calendar-check"></i>방명록</a>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="user-activity-wrap">
                    <div class="user-activity d-flex">
                        <div class="icon">
                            <i class="bi bi-people"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter">0</span> </h3>
                            <p>구독자</p>
                        </div>
                    </div>
                    <div class="user-activity d-flex">
                        <div class="icon">
                            <i class="bi bi-card-text"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter"><%=memberBoardCount %></span> </h3>
                            <p>작성한 글</p>
                        </div>
                    </div>
                    <div class="user-activity d-flex">
                        <div class="icon">
                            <i class="bi bi-chat-left-dots"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter"><%=memberReplyCount %></span> </h3>
                            <p>작성한 댓글</p>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <form action="<%= request.getContextPath()%>/member/modProfile.do" method="post">
                       <%if(profile_txt == null) {%>
                       <input type="text" value="한줄 자기소개 작성해보세요" name="profile_txt">
                       <input type="hidden" value="<%= u_no %>" name="user_no">
                       <%} else {%>
                       <input type="text" value="<%= profile_txt%>" name="profile_txt">
                       <input type="hidden" value="<%= u_no %>" name="user_no">
                       <%} %>
                       <%if(user_no.equals(u_no)|| auth_cd != null) {%>
                       <button type="submit">저장하기</button>
                       <%} %>
                    </form>
                    <style>
.app-game-list {
    margin: 15px 0;
}
.app-game-list:after {
    display: table;
    clear: both;
    content: " ";
}
.app-game-list h4 {
    font: 1.35rem 'Nanum Gothic';
    font-weight: 700;
    margin-bottom: 15px;
}
.app-game-list .more {
    position: absolute;
    top: 15px;
    right: 15px;
    font: 0.85rem 'Nanum Gothic';
    color: #8b8b8b;
}
.app-list {
   margin: 0;
   padding: 0;
   list-style: none;
    display: block;
    width: 100%;
}
.app-list li {
    float: left;
    cursor: pointer;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -ms-flex-align: center;
    align-items: center;
    width: 33.33%;
    margin: 5px 0;
}
@media(max-width: 991px) {
.app-list li {
    width: 100%;
}
}
.app-list li .app-icon {
    position: relative;
}
.app-list li .app-icon:after {
    content: "";
    z-index: 1;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border: 1px solid rgba(0,0,0,.06);
    border-radius: 12px;
    overflow: hidden;
}
.app-list li .app-icon img {
    vertical-align: top;
    width: 55px;
    height: 55px;
    border-radius: 12px;
}
.app-list li .app-title {
    -ms-flex: 1 1;
    flex: 1 1;
    overflow: hidden;
    margin-left: 14px;
    margin-right: 10px;
}
.app-list li .app-title .subject {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    font-weight: 500;
    font-size: 15px;
    line-height: 19px;
    color: #000;
}
.app-list li .app-title .dev {
    margin-top: 3px;
    color: #999;
    display: inline-block;
    width: 100%;
    font-size: 13px;
    line-height: 15px;
    max-height: 15px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
}
                    </style>
                     <div class="app-game-list" >
                        <h4>가입 커뮤니티</h4>
                        <ul class="app-list">
                         <%
                            for(GameVO game : memGameList){
                         %> 
                            <li>
                                <div class="app-icon" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= game.getG_no()%>'"><img src="/imgPath/<%= game.getG_no()%>-icon.png"></div>
                                <div class="app-title" onclick="location.href='<%= request.getContextPath()%>/lounge/gameLounge.do?g_no=<%= game.getG_no()%>'"><span class="subject"><%=game.getG_name()%> </span><span class="dev"><%=game.getG_com() %></span></div>
                            </li>
                         <%
                             }
                         %> 
                        </ul>
                    </div>
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
                   <form id="gb_form">
                   <textarea id="gbbox" name="gbook" cols="30" rows="10" class="txar" placeholder="댓글을 입력하세요."></textarea>
                   <div class="bottom_txar_btn">
                       <div class="float-end text-end">
                           <div class="glist_number">(<em id="count">0</em>/200)</div>
                           <span><button type="submit" class="btn btn-write" >방명록등록</button></span>
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
                    <div class="comment" id="gb_container">
                 <% 
                         for(GBookVO gBVo : gbList){
                   %> 
                      <div class="list">   
                         <span class="nickname">
                            <a href="<%=request.getContextPath()%>/admin/userInfo.do?user_no=<%= memberVo.getUser_no()%>"><%= gBVo.getNick() %></a> 
                         </span> 
                         <span class="time"> <%= formatter.format(gBVo.getB_wdt())%></span> 
                         <div class="commcont"><%= gBVo.getB_content() %> </div> 
                      </div>
                   <% 
                         }
                   %> 
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>