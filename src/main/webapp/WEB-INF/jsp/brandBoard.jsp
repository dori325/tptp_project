<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드</title>
</head>
<link href="./css/board.css" rel="stylesheet"/>
<form action="brandBoard.do">
<%-- <c:import url="topmenu.jsp"/> --%>
<h1>동아 브랜드</h1>
<h2><a href="./index.do">공지사항</a> | <a href="./detail.do">디테일</a> | <a href="./write.do">글쓰기</a> </h2>
<div id="writebutton">
	<button style="width: 100px; height: 40px;">글쓰기</button>
</div>
<div id="listboard">
	<div id="board_top">
		<table>
			<tr>
				<td style="background: highlight;"><a>샤프</a></td>
				<td><a style="background: highlight;">볼펜</a></td>
				<td><a>형광펜</a></td>
				<td><a>만년필</a></td>
				<td style="width: 100px; float: right;"><a>글쓰기</a></td>
			</tr>
		</table>
	</div>
<table border="1">
	<tr>
		<th style="width: 50px;">추천</th>
		<th style="width: 60px;">분류</th>
		<th>제목</th>
		<th style="width: 120px;">닉네임</th>
		<th style="width: 80px;">날짜</th>
		<th style="width: 65px;">조회수</th>
	</tr>

	<c:forEach items="${list }" var="l">
		<tr>
			<td id="like">${l.b_like }</td>
			<td>${l.b_cate2 }</td>
			<td style="text-align: left;">
				${l.b_title }
				<c:if test="${l.c_count > 0}">
					<small>${l.c_count }</small>
				</c:if>
			</td>
			<td>${l.l_nick }</td>
			<td>${l.b_date }</td>
			<td id="count">${l.b_count }</td>
		</tr>
	</c:forEach>

</table>
	
	<div id="page">
	<%-- 참고 하세요 : page : ${page } / count : ${count } / totalPage : ${totalPage } / 
		startPage : ${startPage } / endPage : ${endPage } --%>
		<!-- 페이지 찍기 -->

			<button>이전</button>
			<button> ◀ </button>

				<button>1</button>
				<button>2</button>

			<button> ▶ </button>
			<button>다음</button>
	</div>
	<div style="float: right;">
		<input type="text" name="text" value="" placeholder="게시판 검색">
		<input type="button" name="search" value="검색">
	</div>
<%-- 	<c:import url="bottonmenu.jsp"/> --%>
</div>

</form>
</body>
</html>