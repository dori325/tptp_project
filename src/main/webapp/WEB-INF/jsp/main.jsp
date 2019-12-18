<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="./css/board.css" />
<!-- <link rel="stylesheet" href="./css/main.css" />-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
left {
	width: 400px;
	height: 5%;
	border-bottom: 1px solid #2C9AB7;
}
</style>
</head>


<body>
<%@ include file="./Login.jsp"%>

	<div id="listboard">
		<table style="width: 850px; margin: 0px auto;">
			<tr>
				<td>
					<form action="search.do">
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
				<th width="280"><a href="#" style="text-decoration: none;">[공지사항]</a></th>
				<th width="280"><a href="#" style="text-decoration: none;">[이달의추천]</a></th>
				<th width="280"><a href="./news.do"
					style="text-decoration: none;">[이달의새소식]</a></th>
			</tr>
			<tr id="boardTr">
				<td><c:forEach items="${list }" var="k">
						<table id="main" style="width: 275px;">
							<tr>
								<td align="left" style="font-size: 15px;"><img
									src="./img/hot_icon2.jpg">${k.b_title }</td>
							</tr>
						</table>
					</c:forEach></td>
				<td><c:forEach items="${list }" var="h">
						<table id="main" style="width: 275px;">
							<tr>
								<td align="left" style="font-size: 15px;">${h.b_title }</td>
							</tr>
						</table>
					</c:forEach></td>
				<td><c:forEach items="${list }" var="m">
						<table id="main" style="width: 275px;">
							<tr id="boardTr">
								<td align="left" style="font-size: 15px;"><img
									src="./img/pop_icon2.jpg">${m.b_title }</td>
							</tr>
						</table>
					</c:forEach></td>
			</tr>
			<tr id="boardTr">
				<td></td>
				<td></td>
				<td></td>
			</tr>

		</table>


		<div>
			<table style="width: 850px; margin: 0px auto;">
				<tr>
					<img src="./img/main3.jpg">
				</tr>
			</table>
		</div>

	</div>


</body>

</html>