<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://localhost:9000/min_web_study/jquery/jquery-3.6.4.min.js"></script>
<style type="text/css">
div {
	text-align: center;
}

div#flip {
	width: 500px;
	height: 30px;
	background: #f2f2f2;
	border: 1px solid gray;
}

div#content {
	width: 500px;
	height: 250px;
	background: gray;
	display: none;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#flip").click(function() {
			$("#content").slideToggle(2000, function() {
				test();
			});
		});
	});
	
	function test() {
		alert("test 호출");
	}
</script>
</head>
<body>
	<h1>SlideUp/Down</h1>
	<div id="flip">눌러</div>
	<div id="content">내용</div>
</body>
</html>