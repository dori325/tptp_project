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
</head>
<body>
	<div id="listboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>통합검색결과..</h2>
		</div>

		<div>
			<table id="TS_Board">
				<tr id="boardTr">
					<th id="count">추천수</th>
					<th id="sort">분류1</th>
					<th id="sort">분류2</th>
					<th id="title">제목</th>
					<th rowspan="2" id="comment">작성자</th>
					<th rowspan="2" id="date">날짜</th>
				</tr>
				<tr>
					<th colspan="4">내용</th>
				</tr>
				<c:forEach items="${ts_list }" var="ts">
					<tr id="boardTr">
						<td id="count">${ts.b_like }</td>
						<td id="sort">${ts.b_cate1 }</td>
						<td id="sort">${ts.b_cate2 }</td>
						<td id="title" style="text-align: left;"><a
							href="detail.do?b_no=${ts.b_no }" id="title">${ts.b_title }</a></td>
						<td rowspan="2" id="comment">${ts.l_nick }</td>
						<td rowspan="2" id="date">${ts.b_date }</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: left;">
						    <c:choose>
								<c:when test="${fn:length(ts.b_content) gt 51}">
									<c:out value="${fn:substring(ts.b_content, 0, 50)}">...</c:out>
								</c:when>
								<c:otherwise>
									<c:out value="${ts.b_content}"></c:out>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
			

			<!-- 페이징 -->
			<div id="page">
				<%@include file="page.jsp"%>
				<!-- 페이지 찍기 -->
				<c:if test="${page gt 10 }">
					<button onclick="location.href='totalSearch.do?page=${page - 10 }'">이전</button>
				</c:if>
				<c:if test="${page gt 1 }">
					<button onclick="location.href='totalSearch.do?page=${page - 1 }'">
						◀</button>
				</c:if>
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
				<c:if test="${page lt totalPage }">
					<button onclick="location.href='totalSearch.do?page=${page + 1 }'">
						▶</button>
				</c:if>
				<c:if test="${page lt totalPage - 9 }">
					<button onclick="location.href='totalSearch.do?page=${page + 10 }'">다음</button>
				</c:if>
			</div>

		</div>
		<%@ include file="bottonmenu.jsp"%>
	</div>

</body>
</html>