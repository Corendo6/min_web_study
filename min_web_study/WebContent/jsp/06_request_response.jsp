<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Login form</h1>
	<form name="LoginForm" action="06_loginCheck.jsp" method="post">
		<ul>
			<li>
				<label>아이디</label>
				<input type="text" name="id">
			</li>
			<li>
				<label>패스워드</label>
				<input type="text" name="pass">
			</li>
			<li>
				<button type="submit">로그인</button>
			</li>
		</ul>
	</form>
</body>
</html>