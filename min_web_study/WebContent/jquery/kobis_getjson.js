$(document).ready(function() {
	function createHTML(kselect, date) {
		// 1. json data $.getJSON(url,function(json데이터를 담고있는 변수){});
		let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/" + kselect + ".json?key=f5eef3421c602c6cb7ea224104795888&targetDt=" + date;

		$.getJSON(url, function(kobis) {
			// 2 output code 생성
			try {
				let boxOffice = kobis.boxOfficeResult;
				let code = "<div id='d2'>"; 
				code += "<h1>" + boxOffice.boxofficeType + "</h1>" + "<h3>" + boxOffice.showRange + "</h3>";
				code += "<table>" +
						"<tr>" +
						"<th>순위</th>" +
						"<th>제목</th>" +
						"<th>개봉일</th>" +
						"<th>관객 수</th>" +
						"<th>상영 횟수</th>" +
						"<th>누적 관객 수</th>" +
						"</tr>";
				
				let listName = null;
				if (kselect == "searchDailyBoxOfficeList") {
					listName = boxOffice.dailyBoxOfficeList;
				}
				else {
					listName = boxOffice.weeklyBoxOfficeList;
				}
	
				listName.forEach(function(value, index) {
					code += "<tr>";
					code += "<td>" + value.rank + "</td>";	
					code += "<td>" + value.movieNm + "</td>";
					code += "<td>" + value.openDt + "</td>";
					code += "<td>" + Number(value.audiCnt).toLocaleString() + "</td>";
					code += "<td>" + Number(value.showCnt).toLocaleString() + "</td>";
					code += "<td>" + Number(value.audiAcc).toLocaleString() + "</td>";
					code += "</tr>";
				});
				code += "</table>" +
						"</div>";
	
				// 3. body 위치에 append	
				// 이전 출력화면 삭제
				$("div#d2").remove();
				// $("body").append(code);
				// $().before(); //p1전에
				$("#p1").css("background", "tomato");
				$("#d1").after(code); //d1 후에
			} catch (e) {
				alert("날짜확인해줘");
			}
		});
	}

	$("#btn").click(function() {
		let date = $("#date").val();
		if (date != "" && $("#kselect").val() == "daily") {
			createHTML("searchDailyBoxOfficeList", date);
		} else if (date != "" && $("#kselect").val() == "weekly") {
			createHTML("searchWeeklyBoxOfficeList", date);
		} else {
			alert("날짜 입력 안했음");
			$("#date").focus();
		}
	});
});