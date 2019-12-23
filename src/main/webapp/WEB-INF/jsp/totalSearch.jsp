<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>
<link href="./css/board.css" rel="stylesheet" />
</head>

<body>
	<div id="listboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>통합검색결과..</h2>
		</div>
		
		<div>
		
		<table id="TS_Board">
			<tr id="boardTr">
				<th id="count">추천수</th>
				<th id="sort">분류1</th>
				<th id="sort">분류2</th>
				<th id="title">제목</th>
				<th rowspan="2" id="comment">작성자</th>
				<th rowspan="2" id="date">날짜</th>
			</tr>
			<tr>
				<th colspan="4" >내용</th>				
			</tr>
			<c:forEach items="${ts_list }" var="ts">
				<tr id="boardTr">
					<td id="count">${ts.b_like }</td>
					<td id="sort">${ts.b_cate1 }</td>
					<td id="sort">${ts.b_cate2 }</td>
					<td id="title" style="width: 200px; text-align: left;"><a
						href="detail.do?b_no=${ts.login_name }" id="title">${ts.b_title }</a></td>
					<td rowspan="2" id="comment">${ts.l_nick }</td>
					<td rowspan="2" id="date">${ts.b_date }</td>
				</tr>
				<tr>
					<td colspan="4">${ts.b_content }</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 
		<form action="totalSearch.do">
			<div id="listBottom">
				<table style="width: 850px; margin: 0px auto;">
					<tr>
						<td><select class="select" id="selectBoardCd" onchange="">
								<option value="">선택하세요</option>
								<option value="">제목</option>
								<option value="">내용</option>
								<option value="">작성자</option>
						</select> <input placeholder="검색하세요">
							<button onclick="">검색</button></td>
					</tr>
				</table>
			</div>
		</form>
		-->
		</div>
		<%@ include file="bottonmenu.jsp"%>
	</div>

</body>
</html>