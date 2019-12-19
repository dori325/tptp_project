<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/main.css">
</head>
<link href="./css/board.css" rel="stylesheet" />
<body>
	<c:import url="topmenu.jsp" />
	<form action="notice.do">
		<div id="listboard">
	<c:import url="RsideB.jsp" />
	<c:import url="LsideB.jsp" />
			<div id="listboard">
			<h2>공지사항</h2>

			<div id="listTop">
				<a id="writelink" href="">글쓰기</a>
			</div>
			<table>
				<tr>
					<th>제목</th>
					<th>닉네임</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>

				<c:forEach items="${notice }" var="l">
					<tr id="boardTr">
						<td id="titleAl">
							${l.b_title }
							<c:if test="${l.c_count > 0}">
								<small>${l.c_count }</small>
							</c:if>
						</td>
						<td>${l.l_nick }</td>
						<td>${l.b_date }</td>
						<td>${l.b_count }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="listBottom">
				<select>
					<option>선택</option>
					<option>전체</option>
					<option>제목</option>
					<option>작성자</option>
				</select>
				<input placeholder="검색하세요">
				<button>검색</button>
				<a id="writelink" href="">글쓰기</a>
			</div>
			</div>
		</div>
		<c:import url="bottonmenu.jsp" />
	</form>
</body>
</html>