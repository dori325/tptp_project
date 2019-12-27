<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새소식게시판</title>
<script type="text/javascript">
	function select() {
		var b_title = document.getElementById("b_title").value;
		var b_content = document.getElementById("b_content").value;
		var page = '${page}';
		location.href = "userList.do?b_title=" + b_title + "&page=" + page
				+ "&b_content=" + b_content;
	}
	
	function check(){
		alert("눌렸습니다.");
		if(document.frm.searchCont.value==""){
			alert("검색어를 넣어주세요.");
			document.frm.name.focus();
			return false;
		}
	}
</script>
</head>
<link href="./css/board.css" rel="stylesheet" />
<link href="./css/page.css" rel="stylesheet" />
<body>
	<div id="listboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>새소식게시판</h2>
			<button onclick="location.href='news.do'">전체</button>
		</div>
		<table id="newsboard">
			<tr>
				<th id="comment">추천</th>
				<th id="sort">분류1</th>
				<th id="sort">분류2</th>
				<th id="title">제목</th>
				<th id="name">작성자</th>
				<th id="date">날짜</th>
			</tr>
			<c:choose>
				<c:when test="${news_list ne null}">
					<c:forEach items="${news_list }" var="n">
						<tr id="boardTr">
							<td id="comment">${n.b_like }</td>
							<td id="sort"><c:if test="${n.b_cate1 eq 'nw'}">new</c:if></td>
							<td id="sort">${n.b_cate2}</td>
							<td id="title" style="text-align: left;"><a href="./detail.do?b_no=${n.b_no }" >${n.b_title }</a></td>
							<td id="name">${n.l_nick }</td>
							<td id="date">${n.b_date }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr id="boardTr">
						<td colspan="6">출력할 게시물이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>

		<!-- 페이징 -->
		<div id="page">
	    <%@include file="page.jsp" %>
		<!-- 페이지 찍기 -->
		<c:if test="${page gt 10 }">
			<button onclick="location.href='news.do?page=${page - 10 }'">이전</button>
		</c:if>
		<c:if test="${page gt 1 }">
			<button onclick="location.href='news.do?page=${page - 1 }'"> ◀ </button>
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<c:if test="${i eq page }">
				<button onclick="location.href='news.do?page=${i }'">
					<b style="color: blue;">${i }</b>
				</button>
			</c:if>
			<c:if test="${i ne page }">
				<button onclick="location.href='news.do?page=${i }'">
					${i }
				</button>
			</c:if>			
		</c:forEach>
		<c:if test="${page lt totalPage }">
			<button onclick="location.href='news.do?page=${page + 1 }'"> ▶ </button>
		</c:if>
		<c:if test="${page lt totalPage - 9 }">
			<button onclick="location.href='news.do?page=${page + 10 }'">다음</button>
		</c:if>
	</div>
	
		<form action="news.do" method="post">
			<div id="listBottom">
				<select name="searchID" id="id" onchange="select()" >
					<option value="b_title">제목</option>
					<option value="b_content">내용</option>
				</select>
				<div id="search">
					<input name="searchCont" placeholder="검색어 입력" onchange="return check();">
					<button onchange="select()">
						<!--<button onclick="location.href='news.do?searchCont=' ">-->
						<!-- <button onclick='"location.href="+news.do?b_title="+searchCont+"&b_content="+searchCont; "'>-->
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
				<a id="writelink" href="write.do?b_cate1=nw" >글쓰기</a>
			</div>
		</form>

		<%@ include file="bottonmenu.jsp"%>
	</div>

</body>
</html>
