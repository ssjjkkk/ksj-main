<?php
include_once('../config.php');

if (!$member['userid'])
    alert('잘못된 경로 입니다.');

unset($_SESSION['userid']);

if ($_GET['url'])
    $url = $_GET['url'];
else
    $url = RA_URL;
?>
<meta http-equiv='refresh' content='0;url=<?php echo $url; ?>'>