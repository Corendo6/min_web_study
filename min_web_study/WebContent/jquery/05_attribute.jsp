<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="http://localhost:9000/min_web_study/jquery/jquery-3.6.4.min.js"></script>
<style type="text/css">
	span {
		padding: 10px;
		background: tomato;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("span").click(function() {
			let id = $(this).attr("id");
			if (id == "event")
				$("img").attr("src", "../images/h3_event.gif")
			if (id == "logo")
				$("img").attr("src", "../images/googlelogo_color_272x92dp.png");
			if (id == "trash")
				$("img").attr("src", "../images/trash.jpg");
		});
	});
</script>
</head>
<body>
	<span id="event">이벤트</span>
	<span id="logo">로고</span>
	<span id="trash">휴지통</span>
	<hr>
	<img src="../images/h3_event.gif">
</body>
</html>