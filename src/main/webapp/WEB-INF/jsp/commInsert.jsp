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
<form action="commInsert.do">
<div id="insert">
	<table id="commP">
		<tr>
			<td><input type="text" placeholder="댓글 입력"/></td>
			<td><button>댓글 쓰기</button></td>
		</tr>
	</table>
	<hr>
	<table id="commL">
		<tr>
			<th id="nick">${l_nick }</th>
			<th id="ip">${l_ip }</th>
			<th id="date">${c_date }</th>
			<th id="commLike"><button onclick="location.href='#'"></button></th>
			<th id="comm">${c_like }</th>
		</tr>
		<tr>
			<td id="commContent">${c_content }</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>