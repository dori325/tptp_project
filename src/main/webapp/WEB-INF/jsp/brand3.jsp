<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이펜저펜</title>
<link rel="stylesheet" href="./css/main.css">
</head>
<link href="./css/board.css" rel="stylesheet" />
<link href="./css/page.css" rel="stylesheet" />
<body>
	<c:import url="topmenu.jsp" />
	<div id="listboard">
		<c:import url="RsideB.jsp" />
		<c:import url="LsideB.jsp" />

		<div id="listTop">
			<h2>모닝글로리</h2>
			<button id="pensort" onclick="location.href='brand3.do'">전체</button>
			<button id="pensort" onclick="location.href='brand3.do?b_cate2=연필'">연필</button>
			<button id="pensort" onclick="location.href='brand3.do?b_cate2=샤프'">샤프</button>
			<button id="pensort" onclick="location.href='brand3.do?b_cate2=볼펜'">볼펜</button>
			<button id="pensort" onclick="location.href='brand3.do?b_cate2=만년필'">만년필</button>
			<button id="pensort" onclick="location.href='brand3.do?b_cate2=형광펜'">형광펜</button>
			<button id="pensort" onclick="location.href='brand3.do?b_cate2=기타'">기타</button>
			<c:if test="${sessionScope.id ne null }">
				<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
			</c:if>
		</div>
		<form action="brand3.do">
			<table id="brand">
				<tr>
					<th id="comment">추천</th>
					<th>분류</th>
					<th>제목</th>
					<th id="name">닉네임</th>
					<th id="date">날짜</th>
					<th id="count">조회수</th>
				</tr>
				<c:choose>
					<c:when test="${brand3 ne null}">
						<c:forEach items="${brand3 }" var="l">
							<tr id="boardTr">
								<td>${l.b_like }</td>
								<td id="sort">${l.b_cate2 }</td>
								<td id="titleAl"><a href="./detail.do?b_no=${l.b_no }">${l.b_title }</a>
									<c:if test="${l.c_count > 0}">
										<small>${l.c_count }</small>
									</c:if></td>
								<td>${l.l_nick }</td>
								<td>${l.b_date }</td>
								<td>${l.b_count }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:if test="${resultSearch eq null }">
							<tr id="boardTr">
								<td colspan="6">출력할 게시물이 없습니다.</td>
							</tr>
						</c:if>
					</c:otherwise>
				</c:choose>
				<c:forEach items="${resultSearch }" var="r">
					<tr id="boardTr">
						<td id="comment">${r.c_count }</td>
						<td id="sort">${r.b_cate2 }</td>
						<td id="titleAl"><a href="detail.do?b_no=${r.b_no }"
							id="title">${r.b_title } <input type="hidden" name="b_no"
								value="${r.b_no }"></a></td>
						<td id="name">${r.l_nick }</td>
						<td id="date">${r.b_date }</td>
						<td id="count">${r.b_count }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div id="page">
			<c:if test="${brand3 ne null}">
				<%@include file="page.jsp"%>
				<!-- 페이지 찍기 -->
				<div id="pagepre">
					<c:if test="${page gt 10 }">
						<div id="pre10"
							onclick="location.href='brand3.do?page=${page - 10 }'">◀</div>
					</c:if>
					<c:if test="${page gt 1 }">
						<div id="pre"
							onclick="location.href='brand3.do?page=${page - 1 }'">◁</div>
					</c:if>
				</div>
				<div id="pagenum">
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<c:if test="${i eq page }">
							<div id="curpage">${i }</div>
						</c:if>
						<c:if test="${i ne page }">
							<div id="ncurpage" onclick="location.href='brand3.do?page=${i }'">
								${i }</div>
						</c:if>
					</c:forEach>
				</div>
				<div id="pagenex">
					<c:if test="${page lt totalPage }">
						<div id="nex"
							onclick="location.href='brand3.do?page=${page + 1 }'">▷</div>
					</c:if>
					<c:if test="${page lt totalPage - 9 }">
						<div id="nex10"
							onclick="location.href='brand3.do?page=${page + 10  }'">▶</div>
					</c:if>
				</div>
			</c:if>
		</div>
		<div id="listBottom">
			<form action="ohSearch.do" method="GET">
				<div id="search">
					<input name="searchCont" placeholder="검색어 입력"> <input
						type="hidden" name="b_cate1" value="${b_cate1 }"> <input
						type="hidden" name="url" value="${pageContext.request.requestURI}">
					<button type="submit">
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
			</form>
			<c:if test="${sessionScope.id ne null }">
				<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
			</c:if>
		</div>
	</div>
	<c:import url="bottonmenu.jsp" />
</body>
</html>