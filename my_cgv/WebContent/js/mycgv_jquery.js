$(document).ready(function() {
	/***************************************************************************
	 * 로그인 폼 체크
	 **************************************************************************/
	$('#btnLogin').click(function() {
		$('p').remove();
		if ($('#id').val() == "") {
			$("li:first-child>input").after("<p>아이디를 입력해주세요.");
			$('#id').focus();
		} else if ($("#pass").val() == "") {
			$("li:nth-child(2)>input").after("<p>패스워드를 입력해주세요.");
			$('#pass').focus();
		} else {
			loginForm.submit();
		}
	});	
	/***************************************************************************
	 * 로그인 폼 다시쓰기 버튼 이벤트
	 **************************************************************************/
	$('#btnLoginReset').click(function() {
		$('p').remove();
		$('#id').val("").focus();
		$('#pass').val("");
	});
	// $('#btnLogin').on("click", function() {});
	/***************************************************************************
	 * 회원가입 폼 체크
	 **************************************************************************/
	$('#btnJoin').click(function() {
		if ($('#id').val() == "") {
			alert('아이디를 입력해주세요.');
			$('#id').focus();
			return false;
		} else if ($('#pass').val() == "") {
			alert('패스워드를 입력해주세요.');
			$("#pass").focus();
			return false;
		} else if ($("#cpass").val() == "") {
			alert("비밀번호 확인이 같지 않습니다.");
			$("#cpass").focus();
			return false;
		} else if ($("#name").val() == "") {
			alert("성명을 입력해주세요.");
			$("#name").focus();
			return false;
		} else if (checkCount('gender') == 0) {
			alert("성별을 선택해주세요.");
			$("[name='gender']").focus();
			return false;
		} else if ($("#email1").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#email1").focus();
			return false;
		} else if ($("#email2").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#email2").focus();
			return false;
		} else if ($("#addr1").val() == "") {
			alert("주소를 입력해주세요.");
			$("#btnSearchAddr").focus();
			return false;
		} else if ($("#addr2").val() == "") {
			alert("상세주소를 입력해주세요.");
			$("#addr2").focus();
			return false;
		} else if (checkCount('phone') == 0) {
			alert("통신사를 선택해주세요.");
			$("[name='phone']:first-child").focus();
			return false;
		} else if ($("#phone1").val() == "default") {
			alert("번호를 선택해주세요.");
			$("#phone1").focus();
			return false;
		} else if ($("#phone2").val() == "") {
			alert("번호를 입력해주세요.");
			$("#phone2").focus();
			return false;
		} else if ($("#phone3").val() == "") {
			alert("번호를 입력해주세요.");
			$("#phone3").focus();
			return false;
		} else if ($("input[name='hobby']:checked").length == 0) {
			alert("취미를 선택해주세요.");
			$("[name='hobby']").focus();
			return false;
		} else {
			joinForm.submit();
		} 	
	});
	
	function checkCount(tagName) {
		const tagList = $("[name='"+ tagName +"']");
		let count = 0;
		for (e of tagList) {
			if(e.checked)
				count++;
		}
		return count;
	};
	/***************************************************************************
	 * 회원가입 폼 체크 - 비밀번호 확인
	 **************************************************************************/
	$("#cpass").on("blur", function() {
		if ($("#pass").val() != "" && $("#cpass").val() != "") {
			if ($("#pass").val() == $("#cpass").val()) {
				$("#cmsg").text("비밀번호가 일치합니다.").css("color", "blue").css("font-size", "11px").css("display", "block");
			} else {
				$("#cmsg").text("비밀번호가 일치하지 않습니다.").css("color", "red").css("font-size", "11px").css("display", "block");
			}
		}
	});
	/***************************************************************************
	 * 회원가입 폼 체크 - 이메일
	 **************************************************************************/
	$("#email3").on("change", function() {
		if ($("#email3").val() == "default") {
		} else if ($("#email3").val() == "self") {
			$("#email2").focus();
		} else {
			$("#email2").val($("#email3").val());
		}
	});
	/***************************************************************************
	 * 회원가입 폼 체크 - 주소 찾기: daum API
	 **************************************************************************/
	$("#btnSearchAddr").click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				$("#addr1").val("(" + data.zonecode + ") " + data.roadAddress);
				// let addr = '';
				//        	
				// if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				// addr = data.roadAddress;
				// } else { // 사용자가 지번 주소를 선택했을 경우(J)
				// addr = data.jibunAddress;
				// }
				// document.getElementById("addr1").value = addr;
			}
		}).open();
		
		$("#addr2").focus();
	});
	/***************************************************************************
	 * 게시판 제목 체크
	 **************************************************************************/
	$("#btnBoard").click(function() {
		if ($("#btitle").val() == "" || $("#ntitle").val() == "") {
			alert("제목은 필수");
			$("input[name*='title']").focus();
		} else
			writeForm.submit();		
	});
});