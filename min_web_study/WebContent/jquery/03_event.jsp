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
		/* 
		$(선택자).이벤트핸들러메소드();
		$(선택자).on("이벤트핸들러메소드", 함수정의); 
		$(선택자).on({
			이벤트핸들러메소드1 : 함수정의,
			이벤트핸들러메소드2 : 함수정의,
			...
		});
		 */

		$("#btn1").click(function() {
			alert("button1 클릭");
		});

		$("#btn2").on("click", function() {
			alert("button2 클릭");
		});

		$("#btn3").on({
			click : function() {
				alert("Hello, jQuery!");
			},
			mouseenter : function() {
				$(this).css("background", "tomato");
			},
			mouseleave : function() {
				$(this).css("background", "green");
			}
		});
	});
</script>
</head>
<body>

</body>
<h1>events</h1>
<button type="button" id="btn1">button1</button>
<button type="button" id="btn2">button2</button>
<button type="button" id="btn3">button3</button>
</html>