<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파라미터 값 전달</h2>
	<form action="param1" method="post">
		ID:<input type="text" name="id"><br>
		PW:<input type="password" name="pw"><br>
		NAME:<input type="text" name="name"><br>
		AGE:<input type="text" name="age"><br>
		관심분야:
		<input type="checkbox" name="inter" value="자바">자바
		<input type="checkbox" name="inter" value="JSP">JSP
		<input type="checkbox" name="inter" value="SPRING">SPRING
		<button type="submit">전송</button>
	</form>
</body>
</html>