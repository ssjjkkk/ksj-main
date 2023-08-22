/**
 * 공통 js 파일
 */

// 팝업창 띄우기
// 새로운 Window 창을 Open 할 경우 사용되는 함수 (arg : 주소, 창 타이틀, 넓이, 길이)
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
							+ "height=" + WinHeight + ",top="+ wintop + ",left="
							+ winleft + ",resizable=yes,status=yes");
	win.focus();
};

// 팝업창 닫기
function CloseWindow(){
	self.opener = self;
//	if(window.opener) window.opener.location.reload(true);
	window.close();
};

// 이미지 미리보기
// 파라미터 : 미리보기 할 이미지 파일, 미리보기를 띄울 타겟
// 리턴값 : 
// 작성자 : 김진용
// 작성일 : 23-06-19
function preViewPicture(inputImage, target){
	let fileFormat = inputImage.value.substr(inputImage.value.lastIndexOf('.')+1).toUpperCase();
	
	// 취소누를때
	if(fileFormat == ""){
		document.getElementById('inputFileName').value = "";

		target.css({
			'background-image' : 'url()',
			'background-position' : 'center',
			'background-size' : 'cover',
			'background-repeat' : 'no-repeat'
		});

		return;
	}
	
	// 이미지 확장자 jpg 확인
	if(fileFormat != "JPG" && fileFormat != ""){
		alert("이미지는 jpg 형식만 가능합니다.");
		document.getElementById('inputFile').value = "";
		inputImage.value = "";
		return;
	};
	// 이미지 파일 용량 체크
	if(inputImage.files[0].size > 1024 * 1024 * 1){
		alert("사진 용량은 1MB 이하만 가능합니다.");
		inputImage.value = "";
		return;
	};
	
	// 파일명 inputTag에 삽입
	document.getElementById('inputFileName').value = inputImage.files[0].name;
	
	// 미리보기
	if(inputImage.files){
		let reader = new FileReader();
		
		reader.onload = function(e){
			target.css({
				'background-image' : 'url(' + e.target.result + ')',
				'background-position' : 'center',
				'background-size' : 'cover',
				'background-repeat' : 'no-repeat'
			});
		};
		
		reader.readAsDataURL(inputImage.files[0]);
	};
};










