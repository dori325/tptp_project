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
<%@ include file="LsideB.jsp" %>
<%@ include file="RsideB.jsp" %>
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
			<tr>
				<td id="comment">11</td>
				<td id="titleAl"><a href="" id="title">댓글 관리하자</a></td>
				<td id="name">admin</td>
				<td id="date">15:47</td>
			</tr>
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
	<button><img alt="검색" src="./images/search.png"></button>
	</div>
		<a id="writelink" href="">글쓰기</a>
	</div>
</div>
</form>
</body>
</html>