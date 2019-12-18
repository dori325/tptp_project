<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href="./css/welcome.css" rel="stylesheet">
<script type="text/javascript">
function reqw() {
	alert('비밀번호가 변경되었습니다.')
}
</script>
</head>
<body>
<div id="welcomeList">
<%@ include file="RsideB.jsp" %>
<%@ include file="LsideB.jsp" %>
<form action="repw.do"></form>
	<div id="list">
	<h2>비밀번호 변경</h2>
		<table>
			<tr>
				<th>기존 비밀번호</th>
				<td><input type="password">
					<small>비밀번호가 올바르지 않습니다.</small>
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호</th>
				<td><input type="password"></td>
			</tr>
			<tr>
				<th>새로운 비밀번호 확인</th>
				<td><input type="password">
					<small>비밀번호가 일치하지 않습니다.</small>
				</td>
			</tr>
		</table>
		<button id="resultButt" onclick="reqw()">변경하기</button>
	</div>
</div>
</body>
</html>