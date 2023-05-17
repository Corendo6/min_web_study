/*******************************************************************************
 * 로그인 폼 체크
 ******************************************************************************/
function loginCheck() {
	let id = document.getElementById('id');
	let pass = document.getElementById('pass');
	if (id.value == "") {
		window.alert("아이디 입력해라");
		id.focus();
		return false;
	} else if (pass.value == "") {
		window.alert("비번 입력해");
		pass.focus();
		return false;
	} else {
		loginForm.submit();
	}
}

/*******************************************************************************
 * 로그인 폼 다시쓰기 버튼 이벤트
 ******************************************************************************/
function loginReset() {
	document.getElementById('id').value = "";
	document.getElementById('pass').value = "";
	document.getElementById('id').focus();
}

/*******************************************************************************
 * 회원가입 폼 체크
 ******************************************************************************/
function joinCheck() {
	let id = document.getElementById('id');
	let pass = document.getElementById('pass');
	let cpass = document.getElementById('cpass');
	let name = document.getElementById('name');
	let email1 = document.getElementById('email1');
	let email2 = document.getElementById('email2');
	let email3 = document.getElementById('email3');
	let addr1 = document.getElementById('addr1');
	let addr2 = document.getElementById('addr2');
	let phone1 = document.getElementById('phone1');
	let phone2 = document.getElementById('phone2');
	let phone3 = document.getElementById('phone3');

	if (id.value == "") {
		alert("아이디");
		id.focus();
		return false;
	} else if (pass.value == "") {
		alert("비번");
		pass.focus();
		return false;
	} else if (cpass.value == "") {
		alert("비번확인");
		cpass.focus();
		return false;
	} else if (name.value == "") {
		alert("이름");
		name.focus();
		return false;
	} else if (checkCount('gender') == 0) {
		alert("성별");
		return false;
	} else if (email1.value == "" || email2.value == "") {
		alert("이메일");
		if (email1.value == "")
			email1.focus();
		else
			email3.focus();
		return false;
	} else if (addr1.value == "") {
		alert("주소");
		addr1.focus();
		return false;
	} else if (addr2.value == "") {
		alert("상세주소");
		addr2.focus();
		return false;
	} else if (checkCount('phone') == 0) {
		alert("통신사");
		return false;
	} else if (phone1.value == 'default') {
		alert("전번");
		phone1.focus();
		return false;
	} else if (phone2.value == '') {
		alert("전번");
		phone2.focus();
		return false;
	} else if (phone3.value == '') {
		alert("전번");
		phone3.focus();
		return false;
	} else if (checkCount('hobby') == 0) {
		alert("취미");
		document.getElementsByName('hobby')[0].focus();
		return false;
	} else
		joinForm.submit();
}

function checkCount(tagName) {
	 const tagList = document.getElementsByName(tagName);
	 let count = 0;
	 for(e of tagList) {
	 if(e.checked)
	 count++;
	 }
	 return count;
}

/*******************************************************************************
 * 회원가입 폼 체크 - 비밀번호 확인
 ******************************************************************************/
function passCheck() {
	// pass, cpass 유효성 체크 먼저 수행
	let pass = document.getElementById('pass');
	let cpass = document.getElementById('cpass');
	let cmsg = document.getElementById("cmsg");
	if (pass.value != "" && pass.value != "") {
		if (pass.value != cpass.value) {
			// alert("일치하지않음");
			cmsg.innerHTML = "비밀번호가 동일하지 않습니다.";
			cmsg.style.color = "red";
			cmsg.style.display = "block";
		} else {
			// alert("일치");
			cmsg.innerHTML = "비밀번호가 동일합니다.";
			cmsg.style.color = "blue";
			cmsg.style.display = "block";
		}
	}
}

/*******************************************************************************
 * 회원가입 폼 체크 - 이메일
 ******************************************************************************/
function emailCheck() {
	let email2 = document.getElementById("email2");
	let email3 = document.getElementById("email3");
/*
 * <option value="gmail.com">gmail.com</option> <option
 * value="naver.com">naver.com</option> <option value="daum.net">daum.net</option>
 * <option value="korea.com">korea.com</option>
 */
	if (email3.value != "default") {
		if (email3.value == "self") {
			email2.value = "";
			email2.focus();
		} else {
			email2.value = email3.value;
		}
	}
}

function changeEmail3() {
	let email2 = document.getElementById("email2");
	let email3 = document.getElementById("email3");
	
	email3.value = "self";
	for (option of email3.options) {
		if (email2.value == option.value) {
			email3.value = email2.value;
		}
	}
}

/*******************************************************************************
 * 회원가입 폼 체크 - 주소 찾기: daum API
 ******************************************************************************/
function searchAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        	document.getElementById("addr1").value
        	= "(" + data.zonecode + ") " + data.roadAddress;
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
    
    document.getElementById("addr2").focus();
}

/*******************************************************************************
 * 게시판 제목 체크
 ******************************************************************************/
function boardFormCheck() {
	let btitle = document.getElementById("btitle");
	let ntitle = document.getElementById("ntitle");

	if (btitle.value == "" || ntitle.value == "") {
		alert("제목은 필수");
		btitle.focus();
	} else
		writeForm.submit();
}