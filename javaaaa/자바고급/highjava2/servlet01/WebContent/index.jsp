<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<form action="/servlet01/ResponseTest01.do">
		아이디 : <input type="text" name="id"></input>
		비밀번호 : <input type="password" name="pwd">
		<br></br>
		<input type="submit" value="Redirect 로그인"></input>	
	</form>

	<form action="/servlet01/ResponseTest02.do">
		아이디 : <input type="text" name="id"></input>
		비밀번호 : <input type="password" name="pwd">
		<br></br>
		<input type="submit" value="Forward 로그인"></input>	
	</form>

</body>
</html>