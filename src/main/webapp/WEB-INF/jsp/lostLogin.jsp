<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<link href="./css/welcome.css" rel="stylesheet"/>
<body>
<form action="findLogin.do">
<div id="welcomeList">
<%@ include file="LsideB.jsp" %>
<%@ include file="RsideB.jsp" %>
<div id="list">
<h2>아이디/비밀번호 찾기</h2>
	<table id="findID">
		<tr>
			<th>e-mail</th>
			<td><input type="text" placeholder="이메일을 입력하세요">@<input type="text" id="e-ad">
				<select>
					<option>선택하세요</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
				</select>
			</td>
		</tr>
	</table>
	<button id="resultButt">아이디 찾기</button>
	
	<table id="findPW">
		<tr>
			<th>아이디</th>
			<td><input type="text" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td><input type="text" placeholder="이메일을 입력하세요">@<input type="text" id="e-ad">
				<select>
					<option>선택하세요</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
				</select>
			</td>
		</tr>
	</table>
	<button id="resultButt">임시 비밀번호 발송</button>
	<div id="afterId">
			<p id="p">***님의 아이디는 '***fjfi' 입니다.</p>
	</div>
</div>
</div>
</form>
</body>
</html>