<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link href="./css/sideL.css" rel="stylesheet"/>
<body>
<form action="LsideB.do">
	<div id="loginBar">
		<div id="login"> <!-- 테이블로 만들기?? -->
			로그인
			<input type="text" id="ID" placeholder=" 아이디">
			<input type="password" id="PW" placeholder=" 비밀번호">
			<button onclick="location.href=''">로그인</button><br>
			<a href="join.do">회원가입 </a>
			<a href="lostLogin.do">아이디/비밀번호 찾기</a>
		</div>
	</div>
</form>
</body>
</html>