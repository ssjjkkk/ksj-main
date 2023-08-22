<?php
include_once('./config.php');

$sql = "SELECT * FROM get_member WHERE userid = '".$userid."'";
$result = $mysqli->query($sql);
$row = $result->fetch_array(MYSQLI_ASSOC);

if(!$userid)
    alert('유저 아이디 값이 없습니다.');
else if(!$row['userid'])
    alert('해당 유저는 존재하지 않습니다.');

$profilePath = is_file($dir.$row['userid'].".png");
$profileUrl = $dir_url.$row['userid'].".png?t".time();

if ($profilePath) {
    $img_path = $profileUrl;
} else {
    $img_path = './img/profile_icon.jpeg';
}

if($row['userid'] == $member['userid']) {
    $profile_img   = '<label class="label-profile" for="image"><img id="preview" src="'.$img_path.'" width="120" height="120"></label>';
    $btn_profile   = '<a href="#" class="btn btn-profile"><i class="bi bi-pencil-square"></i>정보수정</a>';
    if ($profilePath) {
        $profile_btn   = '<label class="image-edit" for="deleteBtn"><i class="bi bi-x"></i></label>';
    } else {
        $profile_btn   = '<label class="image-edit" for="uploadBtn"><i class="bi bi-check"></i></label>';
    }
} else {
    $profile_img   = '<img id="preview" src="'.$img_path.'" width="120" height="120">';
    $subscribe_btn = '<button type="button" class="btn btn-profile"><i class="profile_icon_statistics__2Alrx"></i>구독하기</button>';
}
?>
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
<link rel="stylesheet" href="gnb.css?<?php echo time() ?>">
<link rel="stylesheet" href="profile.css?<?php echo time() ?>">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
<script>
// 자바스크립트 & 제이쿼리에서 사용하는 데이터 정보 함수
var is_member = '<?php echo isset($is_member)?$is_member:''; ?>';
var is_admin  = '<?php echo isset($is_admin)?$is_admin:''; ?>';
</script>
</head>
<body>
<!-- 글로벌 네비게이션 바 부분 -->
<header class="gnb">
    <div class="container">
        <div class="logo"><a href="index.jsp"><img src="img/gnb_logo_v2.png"></a></div>
        <div class="gnb-search">
            <div class="SearchForm" data-style-type="LIGHT">
                <form class="Form" action="" data-has-keyword="false">
                <input class="searchInput" type="text" placeholder="회원 아이디 검색" value="">
                <button type="submit" class="btnSearch">검색하기</button>
                </form>
            </div>
        </div>
        <div class="member-info">
            <?php
                if ($is_member) {
            ?>
            <a class="btn btn-basic" href="logout.jsp">로그아웃</a>
            <?php } else { ?>
            <a class="btn btn-basic" href="login.jsp">로그인</a>
            <?php } ?>
        </div>
    </div>
</header>
<div class="profile-header">
    <div class="container" style="height: 100%">
        <div class="profile-info-wrap">
            <div class="profile-info">
                <!-- 프로필 사진 부분 -->
                <div class="profile-image-area">
                    <form id="uploadForm" enctype="multipart/form-data">
                    <input type="file" name="image" id="image" accept="image/png, image/jpeg, image/gif" hidden>
                    <input type="hidden" name="userid" value="<?php echo $userid ?>">
                    <input type="button" id="uploadBtn" hidden>
                    <input type="button" id="deleteBtn" hidden>
                    <div class="style-profile" style="width: 120px; height: 120px;">
                        <div class="my-profile"><?php echo $profile_img ?></div>
                        <?php echo $profile_btn ?>
                    </div>
                    </form>
                </div>
                <!-- 회원 정보 부분 -->
                <div class="profile-name">
                    <strong class="profile-nickname"><?php echo $row['username'] ?></strong>
                    <div class="profile-userid">@<?php echo $row['userid'] ?></div>
                    <div class="profile-introduce">한줄 자기소개 작성해보세요</div>
                </div>
            </div>
            <!-- 프로필 버튼 부분 -->
            <div class="profile-btn">
                <?php echo $subscribe_btn ?>
            </div>
        </div>
    </div>
</div>
<script>
<?php
/*
  프로필 사진 제이쿼리 부분 입니다.
  수정 할줄 모르면 손대지마시오.
*/
?>
$(function(){
    $("input[id='image']").change(function(event){
        var file = event.target.files[0];
        var reader = new FileReader(); 
        reader.onload = function(e) {
            $("#preview").attr("src", e.target.result);
        }
        reader.readAsDataURL(file);
    });
    $("#uploadBtn").click(function() {
    		event.preventDefault();
        var formData = new FormData($('#uploadForm')[0]);
    		$.ajax({
      			url: '<?php echo RA_URL; ?>/imgupload.php',
      			type: 'POST',
      			data: formData,
            processData: false,
            contentType: false,
      			success: function(response) {
        			  if (response == 'notfile') {
        			      alert('이미지를 등록해 주세요.');
        			  } else if (response == 'registered') {
        			      alert('이미 등록된 프로필 사진이 있습니다.');
        			  } else if (response == 'notsize') {
        			      alert('프로필 사진 크기는 120x120 만 업로드 가능합니다.');
        			  } else if (response == 'success') {
                    location.reload();
        				}
      			},
            error : function(request, status, error) {
                alert("code:" + request.status + "\n" + "error:" + error);
            }
    		});
		});
    $("#deleteBtn").click(function() {
    		event.preventDefault();
        var formData = new FormData($('#uploadForm')[0]);
    		$.ajax({
      			url: '<?php echo RA_URL; ?>/imgdelete.php',
      			type: 'POST',
      			data: formData,
            processData: false,
            contentType: false,
      			success: function(response) {
        			  if (response == 'notimage') {
        			      alert('등록된 프로필 사진이 없습니다.');
        			  } else if (response == 'success') {
                    location.reload();
        				}
      			},
            error : function(request, status, error) {
                alert("code:" + request.status + "\n" + "error:" + error);
            }
    		});
		});
});
</script>
<div class="profile-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="side">
                    <?php echo $btn_profile ?>
                    <a href="#" class="btn btn-activity"><i class="bi bi-journal-check"></i>나의 활동</a>
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
                            <h3><span class="counter">0</span> </h3>
                            <p>작성한 글</p>
                        </div>
                    </div>
                    <div class="user-activity d-flex">
                        <div class="icon">
                            <i class="bi bi-chat-left-dots"></i>
                        </div>
                        <div class="count_content">
                            <h3><span class="counter">0</span> </h3>
                            <p>작성한 댓글</p>
                        </div>
                    </div>
                </div>
                <div class="content">
                    
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>