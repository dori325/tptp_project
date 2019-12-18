<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
</head>
<link href="./css/board.css" rel="stylesheet" />
<body>
	<div id="listboard">
<%@ include file="RsideB.jsp" %>
<%@ include file="LsideB.jsp" %>
		<div id="listTop">
		<h2>질문게시판</h2>
			<button onclick="location.href='QnAlist.do?page=${pencil}'">연필</button>
			<button onclick="location.href='QnAlist.do?page=${mechanical}'">샤프</button>
			<button onclick="location.href='QnAlist.do?page=${ballpen}'">볼펜</button>
			<button onclick="location.href='QnAlist.do?page=${Fountain}'">만년필</button>
			<button onclick="location.href='QnAlist.do?page=${etc}'">기타</button>
			<a id="writelink" href="">글쓰기</a>
		</div>
		<table id="QnAlist">
			<tr>
				<th id="comment">답변수</th>
				<th id="sort">분류</th>
				<th>제목</th>
				<th id="name">작성자</th>
				<th id="date">날짜</th>
				<th id="count">조회수</th>
			</tr>
			<c:forEach items="${list }" var="i">
			<tr id="boardTr">
				<td id="comment">${i.comment_count }</td>
				<td id="sort">${i.board_sort }분류</td>
				<td id="titleAl"><a href="detail.do?b_no=${i.login_name }"
					id="title">${i.board_title }</a></td>
				<td id="name">${i.login_name }</td>
				<td id="date">${i.board_date }</td>
				<td id="count">${i.board_count }</td>
			</tr>
			</c:forEach>
		</table>
		<div id="listBottom">
			<select>
				<option>선택</option>
				<option>전체</option>
				<option>제목</option>
				<option>작성자</option>
			</select>
			<div id="search">
				<input placeholder="검색어 입력">
				<button>
					<img alt="검색" src="./img/search.png">
				</button>
			</div>
			<a id="writelink" href="">글쓰기</a>
		</div>
	</div>
</body>
</html>