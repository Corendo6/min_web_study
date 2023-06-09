$(document).ready(function() {

	/**
	 * list 버튼 이벤트
	 */
	// 전체 삭제 버튼 이벤트
	$('button[name="listDeleteAll"]').on("click", function() {

		let list = $("input[name='list']");

		if (list[0] != null) {
			if (confirm("모든 게시글을 삭제하시겠습니까?")) {
	
				list.prop("checked", true);
				boardManage.submit();
	
			};
		} else {
			alert("게시글이 존재하지 않습니다.");
			
			return false;
		}
	});

	// 삭제 버튼 이벤트
	$('button[name="listDelete"]').on("click", function() {
		let checked = $("input[name='list']:checked").get();

		if (checked.length == 0) {
			alert("선택된 게시글이 없습니다.");

			return false;
		} else {
			if (confirm("정말로 삭제하시겠습니까?")) {
				boardManage.submit();

			}
		}
	});

	// 수정 버튼 이벤트
	$('button[name="listUpdate"]').on("click", function() {
		let checked = $("input[name='list']:checked").get();

		if (checked.length == 0) {
			alert("선택된 게시글이 없습니다.");

			return false;
		} else {
			if (checked.length > 1) {
				alert("게시글을 하나만 선택하세요.");
				$("input[name='list']").prop("checked", false);

				return false;
			} else {
				location.href = "notice_update.do?no=" + $(checked).val();
			}
		}
	});

	// 작성 버튼 이벤트
	$('button[name="listWrite"]').on("click", function() {

		location.href = "notice_write.do";
	});
	
	// 검색 버튼 이벤트
	$("#btn-search").on("click", function() {
		searchScript();
	})

	$('input[name="keyword"]').on("keydown",function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			searchScript();			
		} 
	})

	// 목록 버튼 이벤트
	$('button[name="getList"]').on("click", function() {

		location.href = "notice_list.do";
	})

	/**
	 * write 버튼 이벤트
	 */
	// 작성 버튼 이벤트
	$('button[name="write"]').on("click", function() {
		if ($("input[name='title']").val() != "") {
			writeForm.submit();

		} else if ($("input[name='title']").val() == "") {
			alert("제목을 입력해주세요.");
			$("input[name='title']").focus();

			return false;
		}
		/*
		} else if ($("textarea[name='content']").val() == ""){
			alert("내용을 입력해주세요.");
			$("textarea[name='content']").focus();
			
			return false;
		}
		*/
	});

	// 취소 버튼 이벤트
	$('button[name="cancel"]').on("click", function() {
		const URLSearch = new URLSearchParams(location.search);
		if (window.location.href.indexOf("update") > -1) {
			location.href = "notice_content.do?stat=up&no=" + URLSearch.get('no');
		} else {
			location.href = "notice_list.do";
		}
	});
	
	// 파일 버튼 이벤트
	$('button[name="file"]').on("click", function() {
		$('#upload-hidden').click();
	});
	
	// file
	$('#upload-hidden').on('change', function() {
		let file = 	$("#upload-hidden")[0].files[0];
		let fileName = file.name;
		let fileType = file.type;
		let hidden = document.getElementById("upload-hidden");
		let name = document.getElementById("upload-name");

		if (fileType.startsWith("image/")) { 
			$('#upload-name').val(file.name);

			let output = "<button type='button' id='btn-style' name='filedel'>취소</button>";
			$('#fileDelbtn').html(output);
			$("#filebox").css("margin-right", "78px");
				// 파일 취소 버튼 이벤트
			$('#filebox button[name="filedel"]').on("click", function() {
				hidden.value = null;
				name.value = "";
				$('button[name="filedel"]').remove();
				$("#filebox").css("margin-right", "164px");
			});
			
		} else {
			alert("이미지만 선택 가능합니다.");
			$('#upload-hidden').val(null);
			$('#upload-name').val("");
		}
	});

	/**
	 * content 버튼 이벤트
	 */
	// 수정 버튼 이벤트
	$('button[name="update"]').on("click", function() {
		let no = $("input[name='post_id']").val();
		location.href = "notice_update.do?stat=up&no=" + no;
	})

	// 삭제 버튼 이벤트
	$('button[name="delete"]').on("click", function() {

		if (confirm("정말로 삭제하시겠습니까?")) {
			noticeDelete.submit();
		}
	})

	// 댓글 작성 이벤트
	$('button[name="cmtWrite"]').on("click", function () {
		let url = window.location.href;

		if ($("#form-control").val() != "") {
			$.ajax({
				url: "comment_write_proc.do",
				data: $("#comment-write").serialize(),
				dataType: "text",
				async: true,
				Cache: false,
				type: "POST",
				success: function (result) {
					if (result == "SUCCESS") {
						alert("댓글이 등록되었습니다.");
						window.location.replace(url);
					} else {
						alert("댓글 등록이 실패하였습니다.");
					}
				},
				error: function (xhr, status, error) { }
			});

		} else
			alert("댓글 내용을 입력하세요.");
	})
	
	// 댓글 삭제 이벤트
/*	$('.cmtDelete').on("click", function() {
		if (confirm('댓글을 삭제하시겠습니까?')) {
			commentDelete.submit();
		} else {
			return false;
		}
	})
*/
	
	// 신고버튼
/*
		const reportBtn = document.querySelectorAll(".report");
		const modal = document.getElementById("modal-background");
		const modalCloseBtn = document.getElementById("modal-close");
		const modalReportBtn = document.getElementById("modal-report");
	
		function modalOff() {
			modal.style.display = "none";
		}
		reportBtn.forEach(e => {
			e.addEventListener("click", e => {
				modal.style.display = "flex";
			});
		});

		modalCloseBtn.addEventListener("click", e => {
			modalOff();
		});
		modalReportBtn.addEventListener("click", e => {
			modalOff();
		});
	
		modal.addEventListener("click", e => {
			const eventTarget = e.target;
			if (eventTarget.classList.contains("test")) {
				modalOff()
			};
		});
	
		window.addEventListener("keyup", e => {
			if (modal.style.display === "flex" && e.key === "Escape") {
				modalOff()
			};
		});
*/

});

// 댓글 삭제 이벤트
function commentDelete(commentId) {
	if (confirm('댓글을 삭제하시겠습니까?')) {
		let url = window.location.href;
	
		$.ajax({
			url : "comment_delete.do",
			data : {
					no : commentId,
			},
			dataType : "text",
			type : "POST",
			success : function(result) {
				if (result == "SUCCESS") {
					alert("댓글이 삭제되었습니다.");
				} else {
					alert("댓글 삭제가 실패하였습니다.");
				}
				window.location.replace(url);
			},
			error : function(error) {
				alert("지금은 시도할 수 없습니다.\n상태가 지속될 경우 관리자에게 문의하세요.");
			}
			
		});
	} else {
		return false;
	}
}

// 검색 이벤트
function searchScript() {
	if($('input[name="keyword"]').val() == "") {
		alert("검색어를 입력하세요");
		
		return false;
	} else {

		boardSearch.submit();
	}
}

// alert 중복 방지를 위한 스크립트
function getResult(result) {
	if (result == 'insuccess') {
		alert("게시글이 성공적으로 등록되었습니다.");
	}

	if (result == 'upsuccess') {
	alert("수정되었습니다.");
	}

	if (result == 'fail') {
		alert("작업에 실패했습니다.\n잠시후에 다시 시도해주세요.");
	}

	history.replaceState({},null,null);
}

function getResultCmt(result) {
	if (result == 'success') {
		alert("댓글이 등록되었습니다.");
	}

	if (result == 'fail') {
		alert("작업에 실패했습니다.\n잠시후에 다시 시도해주세요.");
	}

	history.replaceState({},null,null);
}

// 세션에 따른 페이지 구성
function test(login) {
	console.log(login);
	if (login.includes("MemberVo") || login == "") {
		
		var str = "";

		str += "		<p>Notice</p>";
		str += "		<div id='bsearch-box'>";
		str += "			  <form name='boardSearch' action='notice_Search.do' method='get'>";
		str += "				<label>";
		str += "					<input type='text' name='keyword' placeholder='검색어를 입력해주세요.'>";
		str += "					<button type='button' id='btn-search'>";
		str += "						<img src='http://localhost:9000/uniquegames/images/btn_boardSearch_press.png'>";
		str += "					</button>";
		str += "				</label>";
		str += "			 </form>";
		str += "			<ul>";
		str += "				<li><button type='button' id='btn-style' name='getList'>목록</button></li>";
		str += "			</ul>";
		str += "		</div>";
		str += "		<div id='clearFix'></div>";

	} else if (login.includes("CompanyVo")) {
		str += "		<p>Notice</p>";
		str += "		<div>";
		str += "			  <form name='boardSearch' action='notice_Search.do' method='get'>";
		str += "				<label>";
		str += "					<input type='text' name='keyword' placeholder='검색어를 입력해주세요.'>";
		str += "					<button type='button' id='btn-search'>";
		str += "						<img src='http://localhost:9000/uniquegames/images/btn_boardSearch_press.png'>";
		str += "					</button>";
		str += "				</label>";
		str += "			 </form>";
		str += "			<ul>";
		str += "				<li><button type='button' id='btn-style' name='listWrite'>작성</button></li>";
		str += "				<li><button type='button' id='btn-style' name='listUpdate'>수정</button></li>";
		str += "				<li><button type='button' id='btn-style' name='listDelete'>삭제</button></li>";
		str += "				<li><button type='button' id='btn-style' name='listDeleteAll'>전체삭제</button></li>";
		str += "			</ul>";
		str += "		</div>";

	}

	$("#board-top-menu").html(str);
}