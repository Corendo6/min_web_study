<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://localhost:9000/min_web_study/jquery/jquery-3.6.4.min.js"></script>
<style>
.drow {
	margin-bottom: 10px;
}

p, .drow>div {
	width: 300px;
	padding: 0px;
	margin: 0px;
}

p {
	background: tomato;
	padding: 3px 0;
}

.drow>div {
	background: mediumseagreen;
	height: 80px;
	display: none;
}

p:hoveR {
	text-decoration: underline;
}
</style>
<script>
	$(document).ready(function() {
		$("p").click(function() {
			let pid = $(this).attr("id");
			$("#d_" + pid).slideToggle();
		});
	});
</script>
</head>
<body>
	<h1>Toggle Tset = 댓글처리</h1>
	<div class="drow">
		<p id="p1">댓글 - 제목 #1</p>
		<div id="d_p1">내용 #1</div>
	</div>
	<div class="drow">
		<p id="p2">댓글 - 제목 #2</p>
		<div id="d_p2">내용 #2</div>
	</div>
	<div class="drow">
		<p>댓글 - 제목 #3</p>
		<div>내용 #3</div>
	</div>
	<div class="drow">
		<p>댓글 - 제목 #4</p>
		<div>내용 #4</div>
	</div>
	<div class="drow">
		<p>댓글 - 제목 #5</p>
		<div>내용 #5</div>
	</div>
</body>
</html>