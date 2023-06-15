<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Unique Games</title>
<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/mainunigames.css">
<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/board.css">
<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/am-pagination.css">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="http://localhost:9000/uniquegames/js/board.js"></script>
<script src="http://localhost:9000/uniquegames/js/am-pagination.js"></script>
<c:set var="loginMember" value='<%= session.getAttribute("loginMember") %>'/>
<script>
	$(document).ready(function(){	
		getPagination();
		test('${loginMember}');
		
		$('button[name="getList"]').on("click", function() {

			location.href = "notice_list.do";
		})
 	});
	
	function getPagination() {
		var pager = jQuery('#ampaginationsm').pagination({
			
		    maxSize: '${pageCount}',	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${page}',		// initial page		
		    pageSize: '${pageSize}',			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'lg'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/uniquegames/notice_list.do?page="+e.page);         
	    });
	}

</script> 
<c:if test="${result != null}">
	<script type="text/javascript">
		let result = '<c:out value="${result}"/>';
		writeSuccess(result);
	</script>
</c:if>
</head>

<body>
	<header>
		<jsp:include page="../main/header.jsp"></jsp:include>
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
		<div id="board-list">
			<div id="board-top-menu">

			</div>
			<c:choose>
				<c:when test='${fn:contains(loginMember, "CompanyVo")}'>
					<form name="boardManage" action="board_manage.do" method="post">
						<table id="admin-btable">
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="noticeVo" items="${list}">
										<tr>
											<td><input type="checkbox" name="list"
												value="${noticeVo.post_id}"></td>
											<td>${noticeVo.rno}</td>
											<td><a href="notice_content.do?no=${noticeVo.post_id}">${noticeVo.title}</a></td>
											<td>${noticeVo.company_id}</td>
											<td>${noticeVo.date_output}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${empty list}">
									<tr>
										<td colspan="5" style="padding: 50px 0">등록된 게시글이 없습니다.</td>
									</tr>
								</c:when>
							</c:choose>
							<tr>
								<td colspan="5"><div id="ampaginationsm"></div></td>
							</tr>
						</table>
					</form>
				</c:when>
				<c:otherwise>
					<table id="user-btable">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="noticeVo" items="${list}">
										<tr>
											<td>${noticeVo.rno}</td>
											<td><a href="notice_content.do?no=${noticeVo.post_id}">${noticeVo.title}</a></td>
											<td>${noticeVo.company_id}</td>
											<td>${noticeVo.date_output}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${empty list}">
									<tr>
										<td colspan="4" style="padding: 50px 0">등록된 게시글이 없습니다.</td>
									</tr>
								</c:when>
							</c:choose>
							<tr>
								<td colspan="5"><div id="ampaginationsm"></div></td>
							</tr>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>

</html>