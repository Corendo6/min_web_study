<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://localhost:9000/min_web_study/jquery/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			if ($("#id").val() != "" && $("#pass").val() != "") {
				loginForm.submit();
			} else if ($("#id").val() == "") {
				alert("아이디안굿");
				$("#id").focus();
				return false;
			} else {
				alert("비번안굿");
				$("#pass").focus();
				return false;
			}
		});
		$("#btnReset").click(function() {
			$("#id").val("").focus();
			$("#pass").val("");
		});
	});
</script>
</head>
<body>
	<h1>Login Form</h1>
	<form name="loginForm" action="#" method="get">
		<ul>
			<li>
				<label>아이디</label>
				<input type="text" name="id" id="id">
			</li>
			<li>
				<label>패스워드</label>
				<input type="text" name="pass" id="pass">
			</li>
			<li>
				<button type="button" id="btnLogin">Login</button>
				<button type="button" id="btnReset">Reset</button>
			</li>
		</ul>
	</form>
</body>
</html>