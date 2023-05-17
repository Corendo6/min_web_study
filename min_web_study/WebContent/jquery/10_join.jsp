<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://localhost:9000/min_web_study/jquery/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnJoin").click(function() {
			if($("#name").val() == "") {
				alert("이름");
				$("#name").focus();
				return false;
			} else if ($("input[name='gender']").checked.length == 0) {
				alert("성별");
				return false;
			} else if ($("input[name='hobby']").checked.length == 0) {
				alert("취미");
				return false;
			} else {
				joinForm.submit();
			}
			
		});

		$("#btnReset").click(function() {
			$("#name").val("").focus();
			$("input[name='gender']").val("");
			$("input[name='hobby']").val("");
		});
	});
</script>
</head>
<body>
   <form name="joinForm" action="#" method="get">
        <ul>
            <li>
                <label>성명</label>
                <input type="text" name="name" id="name">
            </li>
            <li>
                <label>성별</label>
                <input type="radio" name="gender" value="male">남자
                <input type="radio" name="gender" value="female">여자
            </li>
            <li>
                <label>취미</label>
                <input type="checkbox" name="hobby" value="게임">게임
                <input type="checkbox" name="hobby" value="노래">노래
                <input type="checkbox" name="hobby" value="등산">등산
                <input type="checkbox" name="hobby" value="영화">영화
            </li>
			<li>
				<button type="button" id="btnJoin">Join</button>
				<button type="button" id="btnReset">Reset</button>
			</li>
        </ul>
    </form>
</body>
</html>