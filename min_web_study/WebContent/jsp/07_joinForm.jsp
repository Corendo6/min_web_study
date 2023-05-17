<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>MYCGV</title>
</head>

<body>
	<!-- content -->
	<div class="content">
		<section class="join">
			<h1 class="title">회원가입</h1>
			<form name="joinForm" action="07_joinCheck.jsp" method="post">
				<ul>
					<li><label>아이디</label> <input type="text" name="id"
						placeholder="8자 이상 영문으로 입력해주세요" class="input1" id="id">
						<button type="button" class="btn_style2">중복체크</button></li>
					<li><label>비밀번호</label> <input type="password" name="pass" class="input1" id="pass">
					</li>
					<li><label>비밀번호 확인</label> <input type="password" name="cpass" class="input1" id="cpass">
						<span id ="cmsg"></span>
					</li>
					<li><label>성명</label> <input type="text" name="name" class="input1" id="name">
					</li>
					<li><label>성별</label> <input type="radio" name="gender"
						value="male">남자 <input type="radio" name="gender"
						value="female">여자</li>
					<li><label>이메일</label> <input type="text" name="email1" id="email1">
						@ <input type="text" name="email2" id="email2">
						<select id="email3">
							<option value="default">선택</option>
							<option value="self">직접입력</option>
							<option value="gmail.com">Gmail</option>
							<option value="naver.com">Naver</option>
							<option value="daum.net">Daum</option>
							<option value="korea.com">Korea</option>
					</select></li>
					<li><label>주소</label> <input type="text" name="addr1" class="input1" id="addr1">
						<button type="button" class="btn_style2" id="btnSearchAddr">주소찾기</button></li>
					<li><label>상세주소</label> <input type="text" name="addr2" class="input1" id="addr2">
					</li>
					<li><label>휴대폰</label> <input type="radio" name="phone"
						value="SKT">SKT <input type="radio" name="phone"
						value="LGU">LGU+ <input type="radio" name="phone"
						value="KT">KT <select name="phone1" id="phone1">
							<option value="default">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
					</select> - <input type="text" name="phone2" id="phone2"> - <input type="text"
						name="phone3" id="phone3"></li>
					<li><label>취미</label> <input type="checkbox" name="hobby"
						value="영화보기">영화보기 <input type="checkbox" name="hobby"
						value="등산하기">등산하기 <input type="checkbox" name="hobby"
						value="게임하기">게임하기 <input type="checkbox" name="hobby"
						value="잠자기">잠자기</li>
					<li><label>자기소개</label> <textarea name="intro" cols="50"
							rows="5" placeholder="200자 이하로 작성해주세요"></textarea></li>
					<li>
						<button type="submit" class="btn_style" id="btnJoin">가입하기</button>
						<button type="reset" class="btn_style" id="btnJoinReset">취소하기</button>
					</li>
				</ul>
			</form>
		</section>
	</div>
</body>

</html>