<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새소식게시판</title>

<link href="./css/board.css" rel="stylesheet" />
</head>

<body>
<div id="listboard">
<%@ include file="LsideB.jsp" %>
<%@ include file="RsideB.jsp" %>
		<h2>새소식게시판</h2>
		
		<table id="newsboard">
			<tr>
				<th id="comment">추천수</th>
				<th>제목</th>
				<th id="name">작성자</th>
				<th id="sort">카테1</th>
				<th id="sort">카테2</th>
				<th id="date">날짜</th>
			</tr>
			<c:forEach items="${list }" var="n">
				<tr id="boardTr">
					<td id="comment">${n.b_like }</td>
					<td id="title" style="width: 200px; text-align: left;"><a href="detail.do?b_no=${i.login_name }"
					id="title">${n.b_title }</a></td>
					<td id="name">${n.l_nick }</td>
					<td id="sort">${n.b_cate1 }</td>
					<td id="sort">${n.b_cate2 }</td>
					<td id="date">${n.b_date }</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이징 -->
		<br>

		<div id="listBottom">
			<table style="width: 850px; margin: 0px auto;">
				<tr id="boardTr">
					<td>
						<form action="news.do">
							<div id="search">
								<select>
									<option>제목</option>
									<option>내용</option>
									<option>작성자</option>
								</select> <input id="input" placeholder="검색하세요">
								<button>검색</button>
								<a id="writelink" href="write.do">글쓰기</a>
							</div>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<hr>

	</div>
	<br>
	<br>


</body>
</html>
