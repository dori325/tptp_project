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
	<form action="brand2.do">
		<div id="listboard">
		<c:import url="RsideB.jsp" />
		<c:import url="LsideB.jsp" />

			<div id="listTop">
			<h2>브랜드2게시판</h2>
				<button id="pensort" onclick="location.href='QnAlist.do?page=${pencil}'">연필</button>
				<button id="pensort" onclick="location.href='QnAlist.do?page=${mechanical}'">샤프</button>
				<button id="pensort" onclick="location.href='QnAlist.do?page=${ballpen}'">볼펜</button>
				<button id="pensort" onclick="location.href='QnAlist.do?page=${Fountain}'">만년필</button>
				<button id="pensort" onclick="location.href='QnAlist.do?page=${etc}'">기타</button>
				<a id="writelink" href="">글쓰기</a>
			</div>
			<table>
				<tr>
					<th>추천</th>
					<th>분류</th>
					<th>제목</th>
					<th>닉네임</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>

				<c:forEach items="${brand2 }" var="l">
					<tr id="boardTr">
						<td>${l.b_like }</td>
						<td>${l.b_cate2 }</td>
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
		<c:import url="bottonmenu.jsp" />


	</form>
</body>
</html>