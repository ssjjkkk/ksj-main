<?php

session_start();

// 기본 시간대 설정
date_default_timezone_set("Asia/Seoul");

define('DB_CHARSET', 'utf8');
header("Content-type: text/html; charset=utf-8");

/********************
    상수 선언
********************/

// 이 상수가 정의되지 않으면 각각의 개별 페이지는 별도로 실행될 수 없음
define('_MOKU_', true);

$ra['path'] = $_SERVER['DOCUMENT_ROOT'];

define('RA_TITLE',      ' - RedApp');

define('RA_URL',        'https://moku.store/redapp');
define('RA_CSS_URL',    RA_URL.'/css');
define('RA_JS_URL',     RA_URL.'/js');
define('RA_IMG_URL',    RA_URL.'/img');

define('RA_PATH',       $ra['path'].'/redapp');
define('RA_CSS_PATH',   RA_PATH.'/css');
define('RA_JS_PATH',    RA_PATH.'/js');
define('RA_IMG_PATH',   RA_PATH.'/img');

if($_SERVER['REQUEST_URI'] == RA_PATH.'/') {
  header('Location: '.RA_URL.'/index.jsp');
}

$dir = RA_IMG_PATH."/member/";
$dir_url = RA_IMG_URL."/member/";

define('DIR_PERMISSION',  0755); // 디렉토리 생성시 퍼미션
define('ESCAPE_FUNCTION', 'sql_escape_string');

/********************
    데이터베이스
    공유 금지
********************/

$mk['host'] = 'localhost';
$mk['user'] = 'moku_db';
$mk['pw'] = 'cjfgjs12!';
$mk['db_name'] = 'moku_db';

$mysqli = new mysqli($mk['host'], $mk['user'], $mk['pw'], $mk['db_name']);
mysqli_set_charset($mysqli, DB_CHARSET);

 if (isset($_SESSION['userid'])) {
    $sql = "SELECT * FROM get_member WHERE userid = '".$_SESSION['userid']."'";
    $result = $mysqli->query($sql);
    $member = $result->fetch_array(MYSQLI_ASSOC);
}

if($member['userid'])
    $is_member = '1';

if($member['is_admin'] == '1') {
    $is_admin = '1';
}

/********************
    펀션 함수
********************/

function alert($msg='', $url='', $error=true, $post=false)
{

    echo '<!DOCTYPE html><html lang="ko"><head><meta charset="utf-8"><title>안내페이지</title><body>';
    echo '<script>';
    echo 'alert("'.$msg.'");';
    if ($url) {
    echo 'document.location.replace("'.$url.'");';
    } else {
    echo 'history.back();';
    }
    echo '</script>';
    echo '</body></html>';
    exit;
}

function display_datetime($datetime = '')
{
    if (empty($datetime)) {
        return false;
    }

    $diff = time() - strtotime($datetime);

    $s = 60; //1분 = 60초
    $h = $s * 60; //1시간 = 60분
    $d = $h * 24; //1일 = 24시간
    $y = $d * 10; //1년 = 1일 * 10일

    if ($diff < $s) {
        $result = $diff . '초전';
    } elseif ($h > $diff && $diff >= $s) {
        $result = round($diff/$s) . '분전';
    } elseif ($d > $diff && $diff >= $h) {
        $result = round($diff/$h) . '시간전';
    } elseif ($y > $diff && $diff >= $d) {
        $result = round($diff/$d) . '일전';
    } else {
    	$result = date('Y.m.d.', strtotime($datetime));
    }

    return $result;
}

function get_name($userid)
{
    $mk['host'] = 'localhost';
    $mk['user'] = 'moku_db';
    $mk['pw'] = 'cjfgjs12!';
    $mk['db_name'] = 'moku_db';
    
    $mysqli = new mysqli($mk['host'], $mk['user'], $mk['pw'], $mk['db_name']);
    mysqli_set_charset($mysqli, DB_CHARSET);

    $sql = " select * from get_member where userid = TRIM('$userid') ";
    $result = $mysqli->query($sql);
    $row = $result->fetch_array(MYSQLI_ASSOC);

    $result = $row['nick'];

    return $result;
}

function numberSymbol($number)
{
	  if ($number >= 1000 && $number < 9999) {
      $result = number_format($number / 1000, 2) . 'K';
	  } else if ($number >= 10000 && $number < 99999) {
      $result = number_format($number / 1000, 1) . 'K';
	  } else if ($number >= 100000 && $number < 999999) {
      $result = number_format($number / 1000, 0) . 'K';
	  } else if ($number >= 1000000 && $number < 9999999) {
      $result = number_format($number / 1000, 2) . 'M';
	  } else if ($number >= 10000000 && $number < 99999999) {
      $result = number_format($number / 1000, 1) . 'M';
	  } else if ($number >= 100000000) {
      $result = number_format($number / 1000, 0) . 'M';
    } else {
      $result = $number;
    }
	  return $result;
}

function insert_point($userid, $point, $content='')
{
    global $config;
    global $g5;
    global $is_admin;

    // 포인트가 없다면 업데이트 할 필요 없음
    if ($point == 0) { return 0; }

    // 회원아이디가 없다면 업데이트 할 필요 없음
    if ($userid == '') { return 0; }
    $mb = sql_fetch(" select userid from member where mb_id = '$userid' ");
    if (!$mb['userid']) { return 0; }

    // 회원포인트
    $mb_point = get_point_sum($userid);

    $po_expired = 0;
    if($point < 0) {
        $po_expired = 1;
        $po_expire_date = G5_TIME_YMD;
    }
    $po_mb_point = $mb_point + $point;

    $sql = " insert into point
                set userid = '$userid',
                    datetime = '".TIME_YMDHIS."',
                    content = '".addslashes($content)."',
                    point = '$point' ";
    $mysqli->query($sql);

    // 포인트를 사용한 경우 포인트 내역에 사용금액 기록
    if($point < 0) {
        insert_use_point($userid, $point);
    }

    // 포인트 UPDATE
    $sql = " update member set point = '$po_mb_point' where userid = '$userid' ";
    $mysqli->query($sql);

    return 1;
}
// multi-dimensional array에 사용자지정 함수적용
function array_map_deep($fn, $array)
{
    if(is_array($array)) {
        foreach($array as $key => $value) {
            if(is_array($value)) {
                $array[$key] = array_map_deep($fn, $value);
            } else {
                $array[$key] = call_user_func($fn, $value);
            }
        }
    } else {
        $array = call_user_func($fn, $array);
    }

    return $array;
}

// SQL Injection 대응 문자열 필터링
function sql_escape_string($str)
{
    if(defined('G5_ESCAPE_PATTERN') && defined('G5_ESCAPE_REPLACE')) {
        $pattern = G5_ESCAPE_PATTERN;
        $replace = G5_ESCAPE_REPLACE;

        if($pattern)
            $str = preg_replace($pattern, $replace, $str);
    }

    $str = call_user_func('addslashes', $str);

    return $str;
}
// 메타태그를 이용한 URL 이동
// header("location:URL") 을 대체
function goto_url($url)
{
    $url = str_replace("&amp;", "&", $url);
    //echo "<script> location.replace('$url'); </script>";

    if (!headers_sent())
        header('Location: '.$url);
    else {
        echo '<script>';
        echo 'location.replace("'.$url.'");';
        echo '</script>';
        echo '<noscript>';
        echo '<meta http-equiv="refresh" content="0;url='.$url.'" />';
        echo '</noscript>';
    }
    exit;
}
// 한페이지에 보여줄 행, 현재페이지, 총페이지수, URL
function get_paging($write_pages, $cur_page, $total_page, $url, $add="")
{
    //$url = preg_replace('#&amp;page=[0-9]*(&amp;page=)$#', '$1', $url);
    $url = preg_replace('#(&amp;)?page=[0-9]*#', '', $url);
	$url .= substr($url, -1) === '?' ? 'page=' : '&amp;page=';

    $str = '';
    if ($cur_page > 1) {
        $str .= '<a href="'.$url.'1'.$add.'" class="dir first"></a>'.PHP_EOL;
    }

    $start_page = ( ( (int)( ($cur_page - 1 ) / $write_pages ) ) * $write_pages ) + 1;
    $end_page = $start_page + $write_pages - 1;

    if ($end_page >= $total_page) $end_page = $total_page;

    if ($start_page > 1) $str .= '<a href="'.$url.($start_page-1).$add.'" class="dir prev"></a>'.PHP_EOL;

    $str .= "<ul class=\"clearfix\">";

    if ($total_page > 1) {
        for ($k=$start_page;$k<=$end_page;$k++) {
            if ($cur_page != $k)
                $str .= '<li><a href="'.$url.$k.$add.'">'.$k.'</a></li>'.PHP_EOL;
            else
                $str .= '<li class="on"><a href="'.$url.$k.$add.'">'.$k.'</a></li>'.PHP_EOL;
        }
    }
    
    $str .= "</ul>";

    if ($total_page > $end_page) $str .= '<a href="'.$url.($end_page+1).$add.'" class="dir next"></a>'.PHP_EOL;

    if ($cur_page < $total_page) {
        $str .= '<a href="'.$url.$total_page.$add.'" class="dir last"></a>'.PHP_EOL;
    }

    if ($str)
        return "{$str}";
    else
        return "";
}

function make_thumb($file, $thumb, $t_width,$t_height)
{
    $source_image = imagecreatefromstring(file_get_contents($file)); //파일읽기
    $width = imagesx($source_image);
    $height = imagesy($source_image);

    $virtual_image = imagecreatetruecolor($t_width, $t_height); //가상 이미지 만들기

    imagecopyresampled($virtual_image, $source_image, 0, 0, 0, 0, $t_width, $t_height, $width, $height); //사이즈 변경하여 복사

    if(imagepng($virtual_image, $thumb)) // png파일로 썸네일 생성
    {
        return "";
    }
    else {
        return "";
    }
}
//==========================================================================================================================
// extract($_GET); 명령으로 인해 page.php?_POST[var1]=data1&_POST[var2]=data2 와 같은 코드가 _POST 변수로 사용되는 것을 막음
// 081029 : letsgolee 님께서 도움 주셨습니다.
//--------------------------------------------------------------------------------------------------------------------------
$ext_arr = array ('PHP_SELF', '_ENV', '_GET', '_POST', '_FILES', '_SERVER', '_COOKIE', '_SESSION', '_REQUEST',
                  'HTTP_ENV_VARS', 'HTTP_GET_VARS', 'HTTP_POST_VARS', 'HTTP_POST_FILES', 'HTTP_SERVER_VARS',
                  'HTTP_COOKIE_VARS', 'HTTP_SESSION_VARS', 'GLOBALS');
$ext_cnt = count($ext_arr);
for ($i=0; $i<$ext_cnt; $i++) {
    // POST, GET 으로 선언된 전역변수가 있다면 unset() 시킴
    if (isset($_GET[$ext_arr[$i]]))  unset($_GET[$ext_arr[$i]]);
    if (isset($_POST[$ext_arr[$i]])) unset($_POST[$ext_arr[$i]]);
}
//==============================================================================
// SQL Injection 등으로 부터 보호를 위해 sql_escape_string() 적용
//------------------------------------------------------------------------------
// magic_quotes_gpc 에 의한 backslashes 제거
if (7.0 > (float)phpversion()) {
    if (function_exists('get_magic_quotes_gpc') && get_magic_quotes_gpc()) {
        $_POST    = array_map_deep('stripslashes',  $_POST);
        $_GET     = array_map_deep('stripslashes',  $_GET);
        $_COOKIE  = array_map_deep('stripslashes',  $_COOKIE);
        $_REQUEST = array_map_deep('stripslashes',  $_REQUEST);
    }
}

// sql_escape_string 적용
$_POST    = array_map_deep(ESCAPE_FUNCTION,  $_POST);
$_GET     = array_map_deep(ESCAPE_FUNCTION,  $_GET);
$_COOKIE  = array_map_deep(ESCAPE_FUNCTION,  $_COOKIE);
$_REQUEST = array_map_deep(ESCAPE_FUNCTION,  $_REQUEST);
//==============================================================================


// PHP 4.1.0 부터 지원됨
// php.ini 의 register_globals=off 일 경우
@extract($_GET);
@extract($_POST);
@extract($_SERVER);