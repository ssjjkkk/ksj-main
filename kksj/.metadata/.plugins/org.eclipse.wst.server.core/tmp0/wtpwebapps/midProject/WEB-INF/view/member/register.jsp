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
<link rel="stylesheet" href="../css/register.css?<?php echo time() ?>">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
</head>
<body>
<%@ include file="../gnb.jsp"%>
<section class="vh-100 register" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">회원가입</p>

                <form class="mx-1 mx-md-4" method="POST" id="registerForm" name="registerForm" action="<%= request.getContextPath()%>/member/insertMember.do">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="userid" name="userid" placeholder="아이디">
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="nick" name="nick" placeholder="닉네임">
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" id="password" name="password" placeholder="비밀번호">
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" id="passwordre" name="passwordre" placeholder="비밀번호 확인">
                    </div>
                  </div>

                  <div class="form-check d-flex justify-content-center mb-5">
                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c">
                    <label class="form-check-label" for="form2Example3">
                      I agree all statements in <a href="#!">Terms of service</a>
                    </label>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="submit">회원가입</button>
                  </div>

                </form>

              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                <img src="/imgPath/draw1.png"
                  class="img-fluid" alt="Sample image">

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script>
$(function(){
   
   // 닉네임 중복 체크
   nick_check = false;
   $('#nick').on('change', function () {
	   nick = $('#nick').val();
      $.ajax({
         url : '<%= request.getContextPath()%>/member/nickCheck.do',
         method : 'post',
         data : {'nick' : nick},
         dataType : 'json',
         success : function(res) {
            if(res == 'success'){
               alert('사용할 수 있는 닉네임 입니다.');
               id_check = true;
            }else {
               alert(res);
               $('#nick').focus();
               id_check = false;
            }
         },
         error : function(req) {
            alert('상태 : ' + req.status);
         }
      });
   });
   
   // id 체크
   id_check = false;
   $('#userid').on('change', function () {
      userid = $('#userid').val();
      $.ajax({
         url : '<%= request.getContextPath()%>/member/idCheck.do',
         method : 'post',
         data : {'userid' : userid},
         dataType : 'json',
         success : function(res) {
            if(res == 'success'){
               alert('사용할 수 있는 id 입니다.');
               id_check = true;
            }else {
               alert(res);
               $('#userid').focus();
               id_check = false;
            }
         },
         error : function(req) {
            alert('상태 : ' + req.status);
         }
      });
   });
   
   
   // 회원가입 정보 서브밋, 체크
   $('#registerForm').on('submit', function(e){
      
      userid = $('#userid').val();
      password = $('#password').val();
      password_re = $('#passwordre').val();
            
      if (id_check == false){
         alert("닉네임 중복확인 체크를 해주세요.");
         $('input[name=userid]').focus();
         e.preventDefault();
         return;
      };
      
      if (userid == "") {
          alert("아이디를 입력하세요.");
          $('#userid').focus();
          e.preventDefault();
          return;
      };
      
      if (password == "") {
          alert("비밀번호를 입력하세요.");
          $('#password').focus();
          e.preventDefault();
          return;
      }
      
      //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
      pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
      
      if (!pwdCheck.test(password)) {
          alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
          $('#password').focus();
          e.preventDefault();
          return;
      }
      
      if (password_re !== password) {
          alert("비밀번호가 일치하지 않습니다.");
          $('#passwordre').focus();
          e.preventDefault();
          return;
      }
      
   });
      
   
})
</script>
</body>
</html>