<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 운영 게시판</title>
</head>
<link href="./css/board.css" rel="stylesheet" />
<body>
	<div id="listboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>운영게시판</h2>
			<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
		</div>
		<table id="admCommList">
			<tr>
				<th id="comment">댓글수</th>
				<th>제목</th>
				<th id="name">작성자</th>
				<th id="date">날짜</th>
			</tr>
			<c:forEach items="${list }" var="i">
				<tr>
					<td id="comment">${i.c_count }</td>
					<td id="titleAl"><a href="detail.do?b_no=${i.b_no }"
						id="title">${i.b_title }</a></td>
					<td id="name">${i.l_nick }</td>
					<td id="date">${i.b_date }</td>
				</tr>
			</c:forEach>
			<c:forEach items="${resultSearch }" var="r">
				<tr>
					<td id="comment">${r.c_count }</td>
					<td id="titleAl"><a href="detail.do?b_no=${r.b_no }"
						id="title">${r.b_title }</a></td>
					<td id="name">${r.l_nick }</td>
					<td id="date">${r.b_date }</td>
				</tr>
			</c:forEach>
		</table>
		<div id="listBottom">
			<form action="admCommSearch.do" method="GET">
				<div id="search">
					<input name="searchCont" placeholder="검색어 입력">
					<input type="hidden" name="b_cate1" value="${b_cate1 }">
					<input type="hidden" name="url" value="${pageContext.request.requestURI}">
					<button type="submit">
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
			</form>
			<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
		</div>
		<%@ include file="bottonmenu.jsp"%>
	</div>
</body>
</html>