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
			<div id="listboard">

			<div id="listTop">
				<h2>공지사항</h2>
				<a id="writelink" href="">글쓰기</a>
			</div>
			<table>
				<tr>
					<th>제목</th>
					<th>닉네임</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>

				<c:forEach items="${notice }" var="n">
					<tr id="boardTr">
						<td id="titleAl">
							${n.b_title }
							<c:if test="${n.c_count > 0}">
								<small>${n.c_count }</small>
							</c:if>
						</td>
						<td>${n.l_nick }</td>
						<td>${n.b_date }</td>
						<td>${n.b_count }</td>
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