<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>
<link href="./css/board.css" rel="stylesheet" />
<link href="./css/page.css" rel="stylesheet" />
<style>
#sch1{
.text-red {
	color: red;
}
.highlight {
	background-color: yellow;
	color: red;
}
</style>
<script type="text/javascript" src="./js/jquery-1.8.0.min.js"  charset="utf-8"></script>
<script type="text/javascript" src="./js/jquery.highlight-4.js"></script>
<script>
$(document).ready(function(){
	var content = ${'b_content'};	
	var strKey = $('content').val();; // 하이라이트를 적용할 스트링
		 if(strKey != ''){
			$('.line').highlight(strKey); //line class에 해당하는 요소들에서 strKey 값들을 하이라이트 처리
		 }
	});
</script>
</head>
<body>

	<div id="listboard">

		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>통합검색결과..</h2>
		</div>
		<div id="TS_Board">
		<input type="hidden" name="b_content" value="${b_content }">
			<table>
				<tr>
					<th id="count">추천</th>
					<th id="sort">분류1</th>
					<th id="sort">분류2</th>
					<th id="title">제목</th>
					<th rowspan="2" id="name">작성자</th>
					<th rowspan="2" id="date">날짜</th>
				</tr>
				<tr>
					<th colspan="4">내용</th>
				</tr>
				<c:forEach items="${ts_list }" var="ts">
					<c:if test="${ts_list eq null}">
						<tr id="boardTr">
							<td colspan="6">검색결과값이 없습니다.</td>
						</tr>
					</c:if>
					<tr>
						<td id="count">${ts.b_like }</td>
						<td id="sort">${ts.b_cate1 }</td>
						<td id="sott">${ts.b_cate2 }</td>
						<td id="title" class="sch1" style="text-align: left;"><a
							href="detail.do?b_no=${ts.b_no }" id="title">${ts.b_title }</a></td>
						<td rowspan="2" id="name">${ts.l_nick }</td>
						<td rowspan="2" id="date">${ts.b_date }</td>
					</tr>
					<tr>
						<td class="line" colspan="4" style="text-align: left;">
							<!--<c:set var="content" value="${fn:replace(b_content, content, '차차차')}" />-->
							<c:choose>
								<c:when test="${fn:length(ts.b_content) gt 61}">
									 ${fn:substring(ts.b_content, 0, 60)}...
								</c:when>
								<c:otherwise>
									${ts.b_content}
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<c:if test="${ts_list eq null}">
						<tr id="boardTr">
							<td colspan="6">검색결과값이 없습니다.</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>

			<!-- 페이징 -->
			<div id="page">
				<c:if test="${count ne null}">
					<%@include file="page.jsp"%>
					<!-- 페이지 찍기 -->
					<div id="pagepre">
						<c:if test="${page gt 10 }">
							<button
								onclick="location.href='totalSearch.do?page=${page - 10 }'">이전</button>
						</c:if>
						<c:if test="${page gt 1 }">
							<button
								onclick="location.href='totalSearch.do?page=${page - 1 }'">
								◀</button>
						</c:if>
					</div>
					<div id="pagenum">
						<c:forEach begin="${startPage }" end="${endPage }" var="i">

							<c:if test="${i eq page }">
								<button onclick="location.href='totalSearch.do?page=${i }'">
									<b style="color: blue;">${i }</b>
								</button>
							</c:if>
							<c:if test="${i ne page }">
								<button onclick="location.href='totalSearch.do?page=${i }'">
									${i }</button>
							</c:if>
						</c:forEach>
					</div>
					<div id="pagenex">
						<c:if test="${page lt totalPage }">
							<button
								onclick="location.href='totalSearch.do?page=${page + 1 }'">
								▶</button>
						</c:if>
						<c:if test="${page lt totalPage - 9 }">
							<button
								onclick="location.href='totalSearch.do?page=${page + 10 }'">다음</button>
						</c:if>
					</div>

				</c:if>
			</div>

		</div>
		<%@ include file="bottonmenu.jsp"%>
	</div>

</body>
</html>