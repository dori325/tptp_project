<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 운영 게시판</title>
</head>
<link href="./css/board.css" rel="stylesheet"/>
<body>
<form action="admCommList.do">
<div id="listboard">
<%@ include file="topmenu.jsp" %>
	<div id="listTop">
	<h2>운영게시판</h2>
		<a id="writelink">글쓰기</a>
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
				<td id="titleAl"><a href="" id="title">${i.b_title }</a></td>	
				<td id="name">${i.l_nick }</td>
				<td id="date">${i.b_date }</td>
			</tr>
			</c:forEach>
		</table>
<div id="listBottom" >
	<select>
		<option>선택</option>
		<option>전체</option>
		<option>제목</option>
		<option>작성자</option>
	</select>
	<div id="search">
	<input placeholder="검색어 입력">
	<button><img alt="검색" src="./img/search.png"></button>
	</div>
		<a id="writelink" href="">글쓰기</a>
	</div>
<%@ include file="bottonmenu.jsp" %>
</div>
</form>
</body>
</html>