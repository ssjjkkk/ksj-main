<?php
include_once('./config.php');

@mkdir($dir, DIR_PERMISSION);
@chmod($dir, DIR_PERMISSION);

$targetPath = $dir.$member['userid'].".png";

$destPath = is_file($targetPath);
$sourcePath = $_FILES['image']['tmp_name'];
$size = @getimagesize($sourcePath);
if (!$sourcePath){ 
    echo 'notfile';
}else if(is_file($targetPath)) {
    echo 'registered';
} else if ($size[0] > '120' || $size[1] > '120') {
    echo 'notsize';
} else if (!$destPath) {
    move_uploaded_file($sourcePath, $targetPath);
    echo 'success';
}
?>