<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/sideL.css" rel="stylesheet" />
</head>
<body>
	<div id="loginBar">
		<div id="login">
			<form action="login.do" method="POST">
				<c:if test="${sessionScope.id eq null }">
				<p style="font-size: medium;">로그인</p>
				<input type="text" id="ID" name="ID" placeholder=" 아이디"> 
				<input type="password" id="PW" name="PW" placeholder=" 비밀번호">
				<input type="hidden" name="url" value="${pageContext.request.requestURI}">
				<button>로그인</button>
				<br> 
				<a href="join.do">회원가입 </a> <br> 
				<a href="lostLogin.do">아이디/비밀번호 찾기</a> <br>
				</c:if>
				
				<c:if test="${sessionScope.id ne null }">
					<p><a>${sessionScope.nick }</a>님<br> 반갑습니다. </p>
				<input type="hidden" name="url" value="${pageContext.request.requestURI}">
					<button>로그아웃</button>
					<br>
					<a href="mypage.do">마이페이지</a>
<%-- 					<p>작성한 게시글 수 : <a>${loginmap.countB }</a></p> --%>
<%-- 					<p>작성한 댓글 수 : <a>${loginmap.countC }</a></p> --%>
				</c:if>
			</form>
		</div>
	</div>
</body>
</html>