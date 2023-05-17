<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS - event</title>
<script>
	function validationCheck() {
		let id = document.getElementById("id");
		let pass = document.getElementById("pass");

		if (id.value == "") {
			alert("아이디넣어");
			id.focus();
		} else if (pass.value == "") {
			alert("패스워드넣어");
			pass.focus();
		} else {
			alert("너가최고야");
		}
	}
</script>
</head>
<body>
	<h1>Login Form</h1>
	<ul>
		<li><label>아이디</label> <input type="text" name="id" id="id">
		</li>
		<li><label>패스워드</label> <input type="password" name="pass"
			id="pass"></li>
		<li>
			<button type="button" onclick="validationCheck()">로그인</button>
			<button type="reset">다시쓰기</button>
		</li>
	</ul>
</body>
</html>