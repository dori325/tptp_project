<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link href="./css/commInsert.css" rel="stylesheet"/>
<body>
<div id="insert">
<form action="commInsert.do">
	<table id="commP">
		<tr>
			<td><input id="c_content" type="text" placeholder="댓글 입력"/></td>
			<td><button type="submit">댓글 쓰기</button></td>
		</tr>
	</table>
</form>
	<hr>
<form action="commShow.do">
	<table id="commL">
	<c:forEach items="${list }" var="c">
		<tr>
			<th id="nick">${c.l_nick }</th>
			<th id="ip">${c.l_ip }</th>
			<th id="date">${c.c_date }</th>
			<th id="commLike"><button onclick="스크립트()"></button></th>
			<th id="comm">${c.c_like }</th>
		</tr>
		<tr>
			<td id="commContent">${c.c_content }</td>
		</tr>
	</c:forEach>
	</table>
</form>
</div>
</body>
</html>