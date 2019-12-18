<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="./css/board.css" />
</head>

<body>
<div id="listboard">
<%@ include file="LsideB.jsp" %>
<%@ include file="RsideB.jsp" %>

		<table style="width: 850px; margin: 0px auto;">
			<tr>
				<td>
					<form action="totalSearch.do">
						<div id="totalSearch">
							<input placeholder="검색하세요">
							<button>
								<img alt="검색" src="./img/search.png" />
							</button>
						</div>
					</form>
				<td>
			</tr>
		</table>

		<table style="width: 850px; margin: 0px auto;">
			<tr id="boardTr">
				<th width="275"><a href="#" style="text-decoration: none;">[공지사항]</a></th>
				<th width="275"><a href="#" style="text-decoration: none;">[이달의추천]</a></th>
				<th width="275"><a href="./news.do"
					style="text-decoration: none;">[이달의새소식]</a></th>
			</tr>
			<tr id="boardTr">
				<td>
				<c:forEach items="${list }" var="k">
					<table id="main" style="width: 275px;">
						<tr>
							<td align="left" style="font-size: 15px;">${k.b_title }</td>
						</tr>
					</table>
				</c:forEach>
				</td>
				<td>
				<c:forEach items="${list }" var="h">
					<table id="main" style="width: 275px;">
						<tr>
							<td align="left" style="font-size: 15px;">${h.b_title }</td>
						</tr>
					</table>
				</c:forEach></td>
				<td>
				<c:forEach items="${list }" var="m">
					<table id="main" style="width: 275px;">
						<tr id="boardTr">
							<td align="left" style="font-size: 15px;"><img
								src="./img/pop_icon2.jpg">${m.b_title }</td>
						</tr>
					</table>
				</c:forEach></td>
			</tr>
		</table>
	</div>

</body>
<%@include file="footer.jsp"%>
</html>
