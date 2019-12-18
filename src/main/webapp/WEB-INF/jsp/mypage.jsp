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
<div id="welcomeList">
<%@ include file="RsideB.jsp" %>
<%@ include file="LsideB.jsp" %>
<div id="list">
	<h2>마이페이지</h2>
		<table>
			<tr>
				<th>아이디</th>
				<td>변수</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><form action="mypage.do">변수 <button id="re" >닉네임 변경하기</button></form></td>			
			</tr>
			<tr>
				<th>게시글 수</th>
				<td>변수</td>
			</tr>
			<tr>
				<th>댓글 수</th>
				<td>변수</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><button onclick="location.href='repw.do'" id="re" >비밀번호 변경하기</button></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>