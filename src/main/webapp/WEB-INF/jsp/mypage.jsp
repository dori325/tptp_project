<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="./css/welcome.css" rel="stylesheet"/>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<div id="welcomeList">
<%@ include file="AllBar.jsp" %>
<div id="list">
	<h2>마이페이지</h2>
		<table>
		<c:if test="${sessionScope.id ne null }">
			<tr>
				<th>아이디</th>
				<td>${mylist.l_id }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${mylist.l_nick }<input><button id="re">중복확인</button><button id="re">변경하기</button></td>
			</tr>
			<tr>
				<th>게시글 수</th>
				<td>${mylist.l_id }</td>
			</tr>
			<tr>
				<th>댓글 수</th>
				<td>${mylist.l_id }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input placeholder="기존 비밀번호를 입력해주세요">
				<button onclick="location.href='repw.do'" id="re">비밀번호 변경하기</button></td>
			</tr>
		</c:if>
		</table>
	</div>
</div>
</body>
</html>