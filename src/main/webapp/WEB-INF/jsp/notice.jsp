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
	<form action="notice.do">
		<div id="listboard">
			<c:import url="RsideB.jsp" />
			<c:import url="LsideB.jsp" />
			<div id="listboard">
				<div id="listTop">
					<h2>공지사항</h2>
					<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
				</div>
				<table id="notice">
					<tr>
						<th>제목</th>
						<th id="name">닉네임</th>
						<th id="date">날짜</th>
						<th id="count">조회수</th>
					</tr>

					<c:forEach items="${notice }" var="l">
						<tr id="boardTr">
							<td id="titleAl"><a href="./detail.do?b_no=${l.b_no }">${l.b_title }</a>
								<c:if test="${l.c_count > 0}">
									<small>${l.c_count }</small>
								</c:if></td>
							<td>${l.l_nick }</td>
							<td>${l.b_date }</td>
							<td>${l.b_count }</td>
						</tr>
					</c:forEach>
				</table>
				<div id="page">
			<c:if test="${notice ne null}">
				<%@include file="page.jsp"%>
				<!-- 페이지 찍기 -->
				<div id="pagepre">
					<c:if test="${page gt 10 }">
						<div id="pre10" onclick="location.href='notice.do?page=${page - 10 }'">
							◀
						</div>
					</c:if>
					<c:if test="${page gt 1 }">
						<div id="pre" onclick="location.href='notice.do?page=${page - 1 }'">
							◁
						</div>
					</c:if>
				</div>
				<div id="pagenum">
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<c:if test="${i eq page }">
							<div id="curpage">
								${i }
							</div>
						</c:if>
						<c:if test="${i ne page }">
							<div id="ncurpage" onclick="location.href='notice.do?page=${i }'">
								${i }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div id="pagenex">
					<c:if test="${page lt totalPage }">
						<div id="nex" onclick="location.href='notice.do?page=${page + 1 }'">
							▷
						</div>
					</c:if>
					<c:if test="${page lt totalPage - 9 }">
						<div id="nex10" onclick="location.href='notice.do?page=${page + 10  }'">
							▶
						</div>
					</c:if>
				</div>
			</c:if>
		</div>
				<div id="listBottom">
					<input placeholder="검색하세요">
					<button>검색</button>
					<a id="writelink" href="write.do?b_cate1=${b_cate1 }">글쓰기</a>
				</div>
			</div>
		</div>

	</form>


	<c:import url="bottonmenu.jsp" />
</body>
</html>