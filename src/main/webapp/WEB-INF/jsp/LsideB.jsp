<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/sideL.css" rel="stylesheet"/>
</head>
<body>
<!-- <form action="LsideB.do"> -->
	<div id="loginBar">
		<div id="login"> <!-- 테이블로 만들기?? -->
			<p style="font-size: medium;">로그인</p>
			<input type="text" id="ID" placeholder=" 아이디">
			<input type="password" id="PW" placeholder=" 비밀번호">
			<button onclick="location.href=''">로그인</button><br>
			<a href="join.do">회원가입 </a><br>
			<a href="lostLogin.do">아이디/비밀번호 찾기</a><br>
			<a href="mypage.do">마이페이지</a>
			<p>새 댓글 수 : <a href="#">0</a></p>
		</div>
	</div>
<!-- </form> -->
</body>
</html>