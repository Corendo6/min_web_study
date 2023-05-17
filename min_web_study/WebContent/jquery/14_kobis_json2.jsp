<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://localhost:9000/min_web_study/jquery/jquery-3.6.4.min.js"></script>
<script src="kobis_getjson.js"></script>
<style>
	table, th, td {
		border: 1px solid gray;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<h1>영화 박스오피스</h1>
	<div id="d1">
		<label>박스오피스 선택</label>
		<Select id="kselect">
			<option value="daily">일별</option>
			<option value="weekly">주말</option>
		</Select>
		<input type="text" name="date" placeholder="날짜입력 예)20220701" id="date">
		<button type="button" id="btn">선택</button>
	</div>
	<p id="p1">박스오피스 실행결과는 위에 넣어주세요.</p>
</body>
</html>