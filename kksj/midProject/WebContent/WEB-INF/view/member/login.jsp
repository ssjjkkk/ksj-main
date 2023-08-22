<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fonts.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/js/all.min.js"></script>
</head>
<body>
<%@ include file="../gnb.jsp"%>
<div id="wrapper" class="LoginLayout">
<div id="contents">
     <div class="loginSec">
          <div class="Login" id="Login">
               <p class="loginMsg">USER ID 혹은 비밀번호를 잘못 입력하셨거나 등록되지 않은 USER ID 입니다.</p>
            <form id="loginForm" name="loginForm" action="<%=request.getContextPath()%>/member/memberLogin.do">
               <fieldset>
                    <div class="id"><input type="text" class="input01" id="id" placeholder="USER ID" name="id"></div>
                    <p class="inputMsg userid">USER ID 를 입력해주세요.</p>
                    <div class="pass"><input type="password" class="input01" id="pass" placeholder="비밀번호" name="pass"></div>
                    <p class="inputMsg password">비밀번호를 입력해주세요.</p>
                    <div class="btLogin"><button type="submit" class="button01">로그인</button></div>
               </fieldset>
            </form>
          </div>
          <p class="loginMenu">
               <a href="register.jsp" class="join">회원가입</a>
               <a href="" class="schId">ID찾기</a>
               <a href="" class="schPass">비밀번호 찾기</a>
          </p>
     </div>
</div>
<div class="footer">
  <p class="copyright">Copyright ⓒ 2023 <strong>RedApp.</strong> All rights reserved.</p>
</div>
</div>

<script>
// $(document).ready(function() {
// 	  $('#loginForm').submit(function(event) {
//     		event.preventDefault();
//     		var userid   = $('#txtID').val();
//     		var password = $('#txtPWD').val();
//     		$.ajax({
<%--       			url: '<%= request.getContextPath()%>/main.do', --%>
//       			type: 'post',
//       			data: {
//         				userid: userid,
//         				password: password
//       			},
//       			success: function(response) {
//         			  if (response == 'is_ban') {
//         					  alert('관리자에 의해 로그인이 차단되었습니다.');
//         			  } else if (response == 'success') {
<%--         					  window.location.href = '<%= request.getContextPath()%>/main.do'; --%>
//         				} else {
//         					  alert('로그인 정보가 일치하지 않습니다.');
//         				}
//       			},
//             error : function(request, status, error) {
//                 alert("code:" + request.status + "\n" + "error:" + error);
//             }
//     		});
// 		});
// });
</script>
</body>
</html>