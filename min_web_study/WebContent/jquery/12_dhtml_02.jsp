<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://localhost:9000/min_web_study/jquery/jquery-3.6.4.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						const employee = {
							list : [ {
								name : "홍길동",
								addr : '서울',
								age : 20
							}, {
								name : "테스트",
								addr : '부산',
								age : 21
							}, {
								name : "김니다",
								addr : '대구',
								age : 22
							} ]
						};
						let code = "<table><tr><th>번호</th><th>이름</th><th>주소</th><th>나이</th></tr>";
						/* for (index in employee.list) {
							let no = parseInt(index) + 1;
							code += "<tr>";
							code += "<td>" + no + "</td>";
							code += "<td>" + employee.list[index].name + "</td>";
							code += "<td>" + employee.list[index].addr + "</td>";
							code += "<td>" + employee.list[index].age + "</td>";
							code += "</tr>";
						}; */
						employee.list.forEach(function(value, index) {
							code += "<tr>";
							code += "<td>" + (index + 1) + "</td>";
							code += "<td>" + value.name + "</td>";
							code += "<td>" + value.addr + "</td>";
							code += "<td>" + value.age + "</td>";
							code += "</tr>";
						});
						code += "</table>";
						$("body").append(code);
					});
</script>
<style>
table, th, td {
	border: 1px solid blue;
}
</style>
</head>
<body>
</body>
</html>