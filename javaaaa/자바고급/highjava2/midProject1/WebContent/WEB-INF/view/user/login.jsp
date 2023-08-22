<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://moku.store/css/fonts.css">
<link rel="stylesheet" href="login.css?<?php echo time() ?>">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
</head>
<body>
<div id="wrapper" class="LoginLayout">
<div id="contents">
  	<div class="loginSec">
    		<div class="Login" id="Login">
            <a href="index.jsp" class="logo-link">RedApp</a>
      			<p class="loginMsg">USER ID 혹은 비밀번호를 잘못 입력하셨거나 등록되지 않은 USER ID 입니다.</p>
            <form id="loginForm" name="loginForm">
      			<fieldset>
        				<div class="id"><input type="text" class="input01" id="txtID" placeholder="USER ID"></div>
        				<p class="inputMsg userid">USER ID 를 입력해주세요.</p>
        				<div class="pass"><input type="password" class="input01" id="txtPWD" placeholder="비밀번호"></div>
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
$(document).ready(function() {
    $(document).on('keypress', '#txtID', function() {
        $('#Login .inputMsg.userid').hide();
    });
    $(document).on('keypress', '#txtPWD', function() {
        $('#Login .inputMsg.password').hide();
    });
	  $('#loginForm').submit(function(event) {
    		event.preventDefault();
    		var userid   = $('#txtID').val();
    		var password = $('#txtPWD').val();
    		$.ajax({
      			url: 'checkLogin.php',
      			type: 'post',
      			data: {
        				userid: userid,
        				password: password
      			},
      			success: function(response) {
        			  if (response == 'notid') {
          			    $(".userid").css({"display":"block"});
          			    $(".password").css({"display":"none"});
        			  } else if (response == 'notpass') {
          			    $(".userid").css({"display":"none"});
          			    $(".password").css({"display":"block"});
        			  } else if (response == 'is_ban') {
        					  alert('관리자에 의해 로그인이 차단되었습니다.');
        			  } else if (response == 'success') {
        					  window.location.href = './';
        				} else {
        					  alert('로그인 정보가 일치하지 않습니다.');
        				}
      			},
            error : function(request, status, error) {
                alert("code:" + request.status + "\n" + "error:" + error);
            }
    		});
		});
});
</script>
</body>
</html>