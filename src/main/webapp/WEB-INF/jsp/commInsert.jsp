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
<form action="commInsert.do" method="POST">
	<table id="commP">
		<tr>
			<td><input name="ccontent" type="text" placeholder="댓글 입력"/></td>
			<td><button type="submit">댓글 쓰기</button>
			<input type="hidden" name="b_no" value="${detail.b_no }">
			<input type="hidden" name="url" value="${pageContext.request.requestURI}">
			</td>
		</tr>
	</table>
</form>
	<hr>
<!-- <form action="commShow.do" method="post"> -->
	<table id="commL">
	<c:forEach items="${detail }" var="c">
		<tr>
			<th id="nick">${c.l_nick }</th>
			<th id="ip"><%-- ${c.l_ip } --%></th>
			<th id="date">${c.c_date }</th>
			<th id="commLike"><button type="submit"></button></th>
			<th id="comm">${c.c_like }</th>
		</tr>
		<tr>
			<td colspan="3" id="commContent">${c.c_content }
			<c:if test="${sessionScope.nick == c.l_nick || sessionScope.auth > 3}">
				<button>수정</button>
				<form action="commDelete.do">
				<button>삭제</button>
				<input type="hidden" name="b_no" value="${c.b_no }">
				<input type="hidden" name="url" value="${pageContext.request.requestURI}">
				</form>
			</c:if>
			</td>
			<td>
			<input type="hidden" name="commModi">
			<input type="hidden" name="b_no" value="${c.b_no }">
			<input type="hidden" name="url" value="${pageContext.request.requestURI}">
			</td>
		</tr>
	</c:forEach>
	</table>
<!-- </form> -->
</div>
</body>
</html>