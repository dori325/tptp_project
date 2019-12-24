<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
<link href="./css/board.css" rel="stylesheet" />
</head>
<body>
<div id="listboard">
<%@ include file="topmenu.jsp" %>
<%@ include file="AllBar.jsp" %>
		<div id="listTop">
		<h2>질문게시판</h2>
			<button id="sort" onclick="location.href='QnAlist.do'">전체</button>
			<button id="sort" onclick="location.href='QnAlist.do?b_cate2=연필'">연필</button>
			<button id="sort" onclick="location.href='QnAlist.do?b_cate2=샤프'">샤프</button>
			<button id="sort" onclick="location.href='QnAlist.do?b_cate2=볼펜'">볼펜</button>
			<button id="sort" onclick="location.href='QnAlist.do?b_cate2=만년필'">만년필</button>
			<button id="sort" onclick="location.href='QnAlist.do?b_cate2=형광펜'">형광펜</button>
			<button id="sort" onclick="location.href='QnAlist.do?b_cate2=기타'">기타</button>
			<a id="writelink" href="write.do?b_cate1=q">글쓰기</a>
		</div>
		<table id="QnAlist">
			<tr id="boardTr">
				<th id="comment">댓글수</th>
				<th>분류</th>
				<th>제목</th>
				<th id="name">작성자</th>
				<th id="date">작성일</th>
				<th id="count">조회수</th>
			</tr>
			<c:forEach items="${Qlist }" var="i">
			<tr id="boardTr">
				<td id="comment">${i.c_count }</td>
				<td id="sort">${i.b_cate2 }</td>
				<td id="titleAl"><a href="detail.do?b_no=${i.b_no }"
					id="title">${i.b_title }</a></td>
				<td id="name">${i.l_nick }</td>
				<td id="date">${i.b_date }</td>
				<td id="count">${i.b_count }</td>
			</tr>
			</c:forEach>
			<c:if test="${Qlist eq null && resultSearch eq null}">
			<tr id="boardTr">
				<td colspan="6">결과값이 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach items="${resultSearch }" var="r">
			<tr id="boardTr">
				<td id="comment">${r.c_count }</td>
				<td id="sort">${r.b_cate2 }</td>
				<td id="titleAl"><a href="detail.do?b_no=${r.b_no }"
					id="title">${r.b_title }</a></td>
				<td id="name">${r.l_nick }</td>
				<td id="date">${r.b_date }</td>
				<td id="count">${r.b_count }</td>
			</tr>
			</c:forEach>
		</table>
		
		<div id="listBottom">
			<form action="qnaSearch.do" method="GET">
				<div id="search">
					<input name="searchCont" placeholder="검색어 입력">
					<input type="hidden" name="b_cate1" value="${b_cate1 }">
					<input type="hidden" name="url" value="${pageContext.request.requestURI}">
					<button type="submit">
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
			</form>
			<a id="writelink" href="write.do?b_cate1=q">글쓰기</a>
		</div>
<%@ include file="bottonmenu.jsp" %>
	</div>
</body>
</html>