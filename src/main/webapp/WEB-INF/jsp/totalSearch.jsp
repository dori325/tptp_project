<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/board.css" rel="stylesheet" />
</head>

<body>
	<div id="listboard">
		<%@ include file="LsideB.jsp"%>
		<%@ include file="RsideB.jsp"%>
		<div id="listTop">
			<h2>통합검색결과..</h2>
		</div>
		<table id="totalboard">
			<tr>
				<th id="comment">추천수</th>
				<th>제목</th>
				<th id="name">작성자</th>
				<th id="sort">카테1</th>
				<th id="sort">카테2</th>
				<th>내용</th>
				<th id="date">날짜</th>
			</tr>
			<c:forEach items="${list }" var="n">
				<tr id="boardTr">
					<td id="comment">${n.b_like }</td>
					<td id="title" style="width: 200px; text-align: left;"><a
						href="detail.do?b_no=${i.login_name }" id="title">${n.b_title }</a></td>
					<td id="name">${n.l_nick }</td>
					<td id="sort">${n.b_cate1 }</td>
					<td id="sort">${n.b_cate2 }</td>
					<td id="sort">${n.b_content }</td>
					
					<td id="date">${n.b_date }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
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


	</div>
	<br>

</body>
</html>