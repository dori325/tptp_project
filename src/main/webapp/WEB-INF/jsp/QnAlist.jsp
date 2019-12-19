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
			<button onclick="location.href='QnAlist.do?page=${sharp}'">샤프</button>
			<button onclick="location.href='QnAlist.do?page=${ballpen}'">볼펜</button>
			<button onclick="location.href='QnAlist.do?page=${fountain}'">만년필</button>
			<button onclick="location.href='QnAlist.do?page=${etc}'">기타</button>
			<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
		</div>
		<table id="QnAlist">
			<c:forEach items="${list }" var="i">
			<tr id="boardTr">
				<td id="comment">${i.c_count }</td>
				<td id="sort">${i.b_sort }분류</td>
				<td id="titleAl"><a href="detail.do?b_no=${i.b_no }"
					id="title">${i.b_title }</a></td>
				<td id="name">${i.l_nick }</td>
				<td id="date">${i.b_date }</td>
				<td id="count">${i.b_count }</td>
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
				<button onclick="location.href='QnAlist.do?b_content='">
					<img alt="검색" src="./img/search.png">
				</button>
			</div>
			<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
		</div>
	</div>
</body>
</html>