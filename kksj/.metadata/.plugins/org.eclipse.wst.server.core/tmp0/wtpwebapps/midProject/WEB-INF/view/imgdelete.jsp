<?php
include_once('./config.php');

$targetPath = $dir.$userid.".png";

if(!is_file($targetPath)) {
    echo 'notimage';
} else {
    unlink($targetPath);
    echo 'success';
}
?>