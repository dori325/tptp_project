<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리 게시판</title>
</head>
<link href="./css/board.css" rel="stylesheet" />
<body>
	<form action="userList.do">
		<div id="listboard">
			<%@ include file="LsideB.jsp"%>
			<%@ include file="RsideB.jsp"%>
			<div id="listTop">
				<h2>사용자 관리 게시판</h2>
				<a id="writelink">글쓰기</a>
			</div>
			<table id="userList">
				<tr>
					<th>번호</th>
					<th id="name">아이디</th>
					<th id="titleAl">닉네임</th>
					<th id="date">가입날짜</th>
					<th id="comment">e-mail</th>
					<th id="name">Auth</th>
					<th id="comment">count</th>
				</tr>
				<tr>
					<td id="name">1</td>
					<td id="name">expert819</td>
					<td id="titleAl">자바맨</td>
					<td id="date">2019-12-18 10:00</td>
					<td id="titleAl"><a href="" id="title">e-mail</a></td>
					<td id="name">3</td>
					<td id="comment">5번</td>
				</tr>
				<tr>
					<td id="name">2</td>
					<td id="name">seopun819</td>
					<td id="titleAl">여이땅</td>
					<td id="date">2019-12-1 09:00</td>
					<td id="titleAl"><a href="" id="title">e-mail</a></td>
					<td id="name">3</td>
					<td id="comment">2번</td>
				</tr>
			</table>
			<div id="listBottom">
				<select>
					<option>선택</option>
					<option>닉네임</option>
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
	</form>
</body>
</html>