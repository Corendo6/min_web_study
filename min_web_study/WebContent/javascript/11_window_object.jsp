<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS - window 객체</title>
<script>
	/* 1. window.alert(메세지) */
	// window.alert('window.alert test');

	/* 2. window.confirm(메시지) */
	/* let result = window.confirm("window.confirm test");
	if (result) {
		document.write("진행")		
	} else {
		document.write("중단");
	} */
	
	/* 3. window.prompt(메시지 입력) - 데이터 입력받아 처리 */
	let name = window.prompt('이름을 입력해주세요 (예: 엄준식)');
	document.write('<h1>' + name + '</h1>');
</script>
</head>
<body>

</body>
</html>