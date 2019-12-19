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
			<table id="admCommList">
				<tr>
					<th id="no">번호</th>
					<th id="name">아이디</th>
					<th id="titleAl">닉네임</th>
					<th id="date">가입날짜</th>
					<th id="comment">e-mail</th>
					<th id="name">Auth</th>
					<th id="comment">count</th>
				</tr>
				<c:forEach items="${u_list }" var="u">
					<tr>
						<td id="no">${u.l_count }</td>
						<td id="name">${u.l_id }<td id="name">${u.l_nick }</td>
					<td id="date">${u.l_date}</td>
					<td id="titleAl"><a href="" id="title">${u.l_email }e-mail</a></td>
					<td id="name">${u.l_auth }</td>
					<td id="comment">${u.l_count}</td>
				</tr>
				</c:forEach>
			</table>
			<div id="listBottom">
				<select>
					<option>선택</option>
					<option>아이디</option>
					<option>닉네임</option>
					<option>권한</option>
				</select>
				<div id="search">
					<input placeholder="검색어 입력">
					<button>
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
				
			</div>
		</div>
	</form>
</body>
</html>