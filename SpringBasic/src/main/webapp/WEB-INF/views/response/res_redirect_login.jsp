<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>res_redirect_login</title>
</head>
<body>
	<form action="login" method="post">
		ID:<input type="text" name="id"><br>
		PW:<input type="password" name="pw"><br>
		<span>${msg}</span>
		<button type="submit">로그인</button>
	</form>
</body>
</html>