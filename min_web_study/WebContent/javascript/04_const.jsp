<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS Const:Object</title>
<script>
	/* Array 선언 */
	const x_arr = [ "java", "oracle" ];
	const y_arr = [ "java", "oracle" ];
	
	/* json(JavaScript Object Notation) */
	// json 타입: {name:value, name:value ...} - REST
	const json1 = { "subject1":"java", "subject2":"oracle" }; 
	const scorejson2 = { name:"홍길동", kor:100, eng:90, math:100, tot:290.0, avg:95 }; 
	/* javascript의 배열은 대괄호[], const z_arr = { "java", "oracle" }; caught SyntaxError: Unexpected string */
	
	/* json + array */
	const scoreList = {hong:[{name:"홍길동"}, 10, 10, 10], test:["테스트", 20, 20, 20]};

	/* const x_arr = [ "java", "oracle", "html" ]; caught SyntaxError: Identifier 'x_arr' has already been declared */

	document.write("Array <br><hr>");
	document.write('x_arr=' + x_arr + '<br>');
	document.write('x_arr[0]=' + x_arr[0] + '<br>');
	document.write('y_arr=' + y_arr + '<br>');
	document.write('y_arr[1]=' + y_arr[1] + '<br><br>');

	document.write("JSON <br><hr>");
	document.write('json1=' + json1 + '<br>');
	document.write('scorejson2=' + scorejson2 + '<br>');
	document.write('scorejson2.name=' + scorejson2.name + '<br>');
	document.write('scorejson2.kor=' + scorejson2.kor + '<br>');
	document.write('scorejson2.avg=' + scorejson2.avg + '<br><br>');
	
	document.write("JSON + Array<br><hr>");
	document.write('scoreList.hong[0].name=' + scoreList.hong[0].name + '<br>');
	document.write('scoreList.hong[1]=' + scoreList.hong[1] + '<br>');
	document.write('scoreList.hong[2]=' + scoreList.hong[2] + '<br>');
	document.write('scoreList.hong[3]=' + scoreList.hong[3] + '<br>');
	document.write('scoreList.test[0]=' + scoreList.test[0] + '<br>');
	document.write('scoreList.test[1]=' + scoreList.test[1] + '<br>');
	document.write('scoreList.test[2]=' + scoreList.test[2] + '<br>');
	document.write('scoreList.test[3]=' + scoreList.test[3] + '<br>');
</script>
</head>
<body>

</body>
</html>