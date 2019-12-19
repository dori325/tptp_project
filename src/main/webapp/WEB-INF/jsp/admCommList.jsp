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
			<th id="nick">이름</th>
			<th id="ip">IP</th>
			<th id="date">날짜</th>
			<th id="commLike"><button onclick="location.href='#'"></button></th>
			<th id="comm">333</th>
		</tr>
		<tr>
			<td id="commContent">
			<pre>내용이 이렇게 많을 경우에도 생각을 해봐야겠지요?여기서 수정하는 것도 생각을 해야합니다.
추천을 누른 경우에는 현재 하트 색상으로 변하게 합니다. 그거는 더 생각을..</pre></td>
		</tr>
	</table>
</div>
</form>
</body>
</html>