<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/main.css">
<style type="text/css">
#page {
	width: 100%;
	padding-top: 5px;
	height: 28px;
	text-align: center;
}
</style>
</head>
<link href="./css/board.css" rel="stylesheet" />
<body>
	<c:import url="topmenu.jsp" />
		<div id="listboard">
		<c:import url="RsideB.jsp" />
		<c:import url="LsideB.jsp" />

			<div id="listTop">
			<h2>
					브랜드2 게시판
			</h2>
				<button id="pensort" onclick="location.href='brand2.do'">전체</button>
				<button id="pensort" onclick="location.href='brand2.do?b_cate2=연필'">연필</button>
				<button id="pensort" onclick="location.href='brand2.do?b_cate2=샤프'">샤프</button>
				<button id="pensort" onclick="location.href='brand2.do?b_cate2=볼펜'">볼펜</button>
				<button id="pensort" onclick="location.href='brand2.do?b_cate2=만년필'">만년필</button>
				<button id="pensort" onclick="location.href='brand2.do?b_cate2=형광펜'">형광펜</button>
				<button id="pensort" onclick="location.href='brand2.do?b_cate2=기타'">기타</button>
				<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
			</div>
	<form action="brand2.do">
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
						<a href="./detail.do?b_no=${l.b_no }">${l.b_title }</a>
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
	</form>
	<div id="page">
	<%@include file="page.jsp" %>
	<%-- 참고 하세요 : page : ${page } / count : ${count } / totalPage : ${totalPage } / 
		startPage : ${startPage } / endPage : ${endPage } --%>
		<!-- 페이지 찍기 -->
		<c:if test="${page gt 10 }">
			<button onclick="location.href='brand2.do?page=${page - 10 }'">이전</button>
		</c:if>
		<c:if test="${page gt 1 }">
			<button onclick="location.href='brand2.do?page=${page - 1 }'"> ◀ </button>
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" var="i">


			<c:if test="${i eq page }">
				<button onclick="location.href='brand2.do?page=${i }'">
					<b style="color: blue;">${i }</b>
				</button>
			</c:if>
			<c:if test="${i ne page }">
				<button onclick="location.href='brand2.do?page=${i }'">
					${i }
				</button>
			</c:if>
			
		</c:forEach>
		<c:if test="${page lt totalPage }">
			<button onclick="location.href='brand2.do?page=${page + 1 }'"> ▶ </button>
		</c:if>
		<c:if test="${page lt totalPage - 9 }">
			<button onclick="location.href='brand2.do?page=${page + 10 }'">다음</button>
		</c:if>
	</div>
			<div id="listBottom">
				<select>
					<option>선택</option>
					<option>전체</option>
					<option>제목</option>
					<option>작성자</option>
				</select>
				<input placeholder="검색하세요">
				<button>검색</button>
				
					<a id="writelink" href="write.do?b_cate1=${b_cate1 }" >글쓰기</a>
					
			</div>
		</div>
		<c:import url="bottonmenu.jsp" />


</body>
</html>