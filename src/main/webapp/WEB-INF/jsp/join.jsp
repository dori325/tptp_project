<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link href="./css/welcome.css" rel="stylesheet"/>
<body>
<!-- <form action="welcome.do"> -->
<div id="welcomeList">
<%@ include file="LsideB.jsp" %>
<%@ include file="RsideB.jsp" %>
<div id="list">
	<h2>회원 가입</h2>
		<table>
			<tr>
				<th>*아이디</th>
				<td><input placeholder="아이디을 입력하세요"><button>중복확인</button>
					<small>변경 불가</small>
				</td>
			</tr>
			<tr>
				<th>*닉네임</th>
				<td><input placeholder="닉네임을 입력하세요"><button>중복확인</button>
					<small>변경 가능</small>
				</td>
			</tr>
			<tr>
				<th>*비밀번호 입력</th>
				<td><input placeholder="비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<th>*비밀번호 확인</th>
				<td><input placeholder="동일한 비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<th>*e-mail</th>
				<td><input>@<input id="e-ad">
					<select>
						<option>선택하세요</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
					</select><br>
					<small>아이디와 비밀번호 찾기 시 필요합니다.</small>
				</td>
			</tr>
		</table>
		<button type="submit" id="resultButt">가입하기</button>
	</div>	
</div>
<!-- </form> -->
</body>
</html>