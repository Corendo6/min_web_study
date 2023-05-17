$(document).ready(function() {
	const gangnam = {
		title : "강남고등학교",
		address : "서울시 강남구 강남대로",
		grade : {
			gtitle : "2학년 1반",
			list : [ {
				name : "홍길동",
				kor : 100,
				eng : 100,
				math : 100
			}, {
				name : "테스트",
				kor : 90,
				eng : 90,
				math : 90
			}, {
				name : "자바",
				kor : 80,
				eng : 80,
				math : 80
			}, {
				name : "오라클",
				kor : 70,
				eng : 70,
				math : 70
			}, {
				name : "스크립트",
				kor : 60,
				eng : 60,
				math : 60
			} ]
		}
	};

	/* 
	json 객체인 gangnam 데이터를 테이블 형식으로 출력 
	title - h1
	address, gtitle - h3
	list - 테이블 형식
	 */
	let code = "<h1>" + gangnam.title + "</h1>" + "<h3>" + gangnam.address + "</h3>" + "<h3>"
			+ gangnam.grade.gtitle + "</h3>";
	code += "<table><tr><th>번호</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th><th>평균</th></tr>";
	gangnam.grade.list.forEach(function(value, index) {
		let tot = value.kor + value.eng + value.math;
		let avg = Math.round(tot / 3);
		code += "<tr>";
		code += "<td>" + (index + 1) + "</td>";
		code += "<td>" + value.name + "</td>";
		code += "<td>" + value.kor + "</td>";
		code += "<td>" + value.eng + "</td>";
		code += "<td>" + value.math + "</td>";
		code += "<td>" + tot + "</td>";
		code += "<td>" + avg + "</td>";
		code += "</tr>";
	});
	code += "</table>";
	$("body").append(code);
});