<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String id = request.getParameter("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unique Games</title>
	<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/mainunigames.css">
	<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/board.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script><!-- 마이크로소프트 jQuery-->
	<script src="http://localhost:9000/uniquegames/js/board.js"></script>

</head>

<body>
	<header>
		<iframe src="../main/header.html" scrolling="no" width="100%" height="228px" frameborder=0></iframe>
	</header>
	<section id="top-bg">
		<div id="base-layer">
			<div id="top-bg-textarea">
				<p id="top-title">Notice</p>
				<p id="top-subtitle">#공지사항</p>
			</div>
		</div>
	</section>
	<div id="content">
		<div id="board-write">
			<div id="board-top-menu">
				<p>Notice</p>
				<div>
					<ul>
						<li><button type="button" id="btn-style" name="write">저장</button></li>
						<li><button type="button" id="btn-style" name="cancel">취소</button></li>
					</ul>
				</div>
				<div id="clearFix"></div>
			</div>
			<form name="writeForm" action="boardWriteForm.jsp" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="btitle" id="default-write" value="받은 id값 = <%= id %>"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="bcontent" cols="30" rows="5"
								id="default-write">받은 id값 이용해서 db연동 해야 함</textarea></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<footer>
		<iframe src="../main/footer.html" scrolling="no" width="100%"
			height="646px" frameborder=0></iframe>
	</footer>
</body>

</html>