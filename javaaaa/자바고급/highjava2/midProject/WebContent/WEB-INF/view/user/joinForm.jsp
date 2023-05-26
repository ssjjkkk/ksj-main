<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RedApp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://moku.store/css/fonts.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/register.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
</head>
<body>
<div id="wrapper">
<div class="register">
    <a href="index.jsp" class="logo-link">RedApp</a>
    <h5 class="register-title">회원가입</h5>
    <form action="<%=request.getContextPath()%>/user/insertUser.do" method="POST" id="registerForm" name="registerForm">
        <input type="hidden" name="token" value="">
        <div class="form-floating mb-3">
            <label for="floatingInput" class="subject">유저아이디</label>
            <span class="id_ok">사용 가능한 아이디입니다.</span>
            <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
            <input type="text" id="userid" name="userid" class="form-control userid_check" id="floatingInput" placeholder="유저아이디">
        </div>
        <div class="form-floating mb-3">
            <label for="floatingPassword" class="subject">닉네임</label>
            <input type="text" id="nick" name="nick" class="form-control" id="floatingPassword" placeholder="닉네임">
        </div>
        <div class="form-floating mb-3">
            <label for="floatingPassword" class="subject">비밀번호</label>
            <input type="password" id="password" name="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
        </div>
        <div class="form-floating mb-3">
            <label for="floatingPasswordre" class="subject">비밀번호 확인</label>
            <input type="password" id="password_re" name="password_re" class="form-control" id="floatingPasswordre" placeholder="비밀번호 확인">
        </div>
        <div class="btn-register">
            <button type="submit" onclick="joinform_check();">회원가입</button>
        </div>
    </form>
</div>
<div class="footer">
  <p class="copyright">ⓒ RedApp Corporation All Rights Reserved.</p>
</div>
</div>
<script>
$(document).ready(function() {
	$(".userid_check").on("keyup", function(){
		var userid   = $('#userid').val();
    
		$.ajax({
			url: '<%= request.getContextPath()%>/user/idCheck.do',
			type: 'post',
			data: { 
				userid : userid
			},
			success: function(response) {
			  if (response == 'success') {
            $('.id_ok').css("display","block"); 
            $('.id_already').css("display", "none");
				} else {
            $('.id_already').css("display","block");
            $('.id_ok').css("display", "none");
				}
			},
      error : function(request) {
          alert("code:" + request.status);
      }
		});
	});
});
//joinform_check 함수로 유효성 검사
function joinform_check() {
  //변수에 담아주기
  var userid = document.getElementById("userid");
  var password = document.getElementById("password");
  var passwordre = document.getElementById("passwordre");

  if (userid.value == "") {
    alert("아이디를 입력하세요.");
    userid.focus();
    return false;
  }

  if(idck==0){
    alert("아이디 중복체크를 해주세요");
    return false;
  }
  if (password.value == "") {
    alert("비밀번호를 입력하세요.");
    password.focus();
    return false;
  }

  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

  if (!pwdCheck.test(password.value)) {
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
    userid.focus();
    return false;
  }

  if (passwordre.value !== password.value) {
    alert("비밀번호가 일치하지 않습니다.");
    passwordre.focus();
    return false;
  }
  document.join_form.submit(); 
}
</script>
</body>
</html>