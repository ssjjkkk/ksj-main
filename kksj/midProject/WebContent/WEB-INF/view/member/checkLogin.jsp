<?php
include_once('../config.php');

if (isset($_POST['userid']) && isset($_POST['password'])) {

  	$userid   = $_POST['userid'];
  	$password = $_POST['password'];

  $q = "SELECT * FROM get_member WHERE userid = '$userid'";
  $result = $mysqli->query($q);
  $row = $result->fetch_array(MYSQLI_ASSOC);

	  if ($row['is_ban'] == '1' && password_verify($password, $row['password'])) {
		    echo 'is_ban';
	  } else if (password_verify($password, $row['password'])) {
    		$_SESSION['userid'] = $userid;
        $hashedPassword = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $sql = " update get_member set password = '{$hashedPassword}' where userid = '{$userid}'";
        $result = mysqli_query($mysqli, $sql);
    		echo 'success';
	  } else { 
    		echo 'failure';
	  }
}
?>