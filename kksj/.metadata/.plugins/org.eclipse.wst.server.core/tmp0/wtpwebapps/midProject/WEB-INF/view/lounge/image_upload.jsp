<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<?php
include_once('../config.php');

$uploadedFile = $_FILES['upload'];

if ($uploadedFile['error'] === UPLOAD_ERR_OK) {
    $tempPath = $uploadedFile['tmp_name'];
    $fileName = $uploadedFile['name'];
    $uploadPath = RA_IMG_PATH.'/upload/' . $fileName;

    move_uploaded_file($tempPath, $uploadPath);

    // 파일 권한 설정 (예: 0644)
    chmod($uploadPath, 0644);
  
    // 업로드된 이미지의 URL 반환
    $response = [
        'url' => RA_IMG_URL.'/upload/' . $fileName
    ];

    header('Content-Type: application/json');
    echo json_encode($response);
    exit;
}

// 오류 발생 시 기본 오류 응답 반환
$response = [
    'error' => [
        'message' => '이미지 업로드에 실패했습니다.'
    ]
];

header('Content-Type: application/json');
echo json_encode($response);
exit;
?>