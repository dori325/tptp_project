<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새소식게시판</title>
<style>
#newsboard a {
   text-decoration: none;
   color: black;   
}
#newsboard a:link {
   text-decoration: none;
   color: black;
}
#newsboard a:visited {
   text-decoration: none;
   color: black;
}
</style>
<script type="text/javascript">
	function select() {
		var b_title = document.getElementById("b_title").value;
		var b_content = document.getElementById("b_content").value;
		var page = '${page}';
		location.href = "userList.do?b_title=" + b_title + "&page=" + page
				+ "&b_content=" + b_content;
	}

	function check() {
		//alert("눌렸습니다.");
		if (document.frm.searchCont.value == "") {
			alert("검색어를 넣어주세요.");
			document.frm.name.focus();
			return false;
		}
	}
</script>
</head>
<link href="./css/board.css" rel="stylesheet" />
<link href="./css/page.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower|Nanum+Gothic+Coding&display=swap&subset=korean"
	rel="stylesheet">
<body>
	<div id="listboard">
		<%@ include file="topmenu.jsp"%>
		<%@ include file="AllBar.jsp"%>
		<div id="listTop">
			<h2>펜 새소식</h2>
			<button id="pensort" onclick="location.href='news.do'">전체</button>
			<button id="pensort" onclick="location.href='news.do?b_cate2=연필'">연필</button>
			<button id="pensort" onclick="location.href='news.do?b_cate2=샤프'">샤프</button>
			<button id="pensort" onclick="location.href='news.do?b_cate2=볼펜'">볼펜</button>
			<button id="pensort" onclick="location.href='news.do?b_cate2=만년필'">만년필</button>
			<button id="pensort" onclick="location.href='news.do?b_cate2=형광펜'">형광펜</button>
			<c:if test="${sessionScope.id ne null }">
				<a id="writelink" href="write.do?b_cate1=nw">글쓰기</a>
			</c:if>
		</div>
		<table id="newsboard">
			<tr id="boardTr">
				<th id="comment">추천</th>
				<th>분류</th>
				<th>제목</th>
				<th id="name">작성자</th>
				<th id="date">날짜</th>
				<th id="count">조회수</th>
			</tr>			
			<c:choose>
				<c:when test="${news_list ne null }">
					<c:forEach items="${news_list }" var="n">
						<tr id="boardTr">
							<td id="comment">${n.b_like }</td>
							<td id="sort">${n.b_cate2}</td>
							<td id="titleAl"><a href="./detail.do?b_no=${n.b_no }&b_cate1=${n.b_cate1}">${n.b_title }</a></td>
							<td id="name">${n.l_nick }</td>
							<td id="date">${n.b_date }</td>
							<td id="count">${n.b_count }</td>
						</tr>
					</c:forEach>
				</c:when>

				<c:when test="${news_search ne null }">
					<c:forEach items="${news_search }" var="ns">
						<tr id="boardTr">
							<td id="comment">${ns.b_like }</td>
							<td id="sort">${ns.b_cate2}</td>
							<td id="titleAl"><a href="./detail.do?b_no=${ns.b_no }&b_cate1=${n.b_cate2}">${ns.b_title }</a></td>
							<td id="name">${ns.l_nick }</td>
							<td id="date">${ns.b_date }</td>
							<td id="count">${ns.b_count }</td>
						</tr>

					</c:forEach>
				</c:when>
				<c:when test="${(news_list eq null) or (news_search eq null) }">
					<tr id="boardTr">
						<td colspan="7">출력할 게시물이 없습니다.</td>
					</tr>
				</c:when>
			</c:choose>

		</table>

		<!-- 페이징 -->
		<div id="page">
			<c:if test="${news_list ne null}">
				<%@include file="page.jsp"%>
				<!-- 페이지 찍기 -->
				<div id="pagepre">
					<c:if test="${page gt 10 }">
						<c:choose>
							<c:when test="${b_cate2 eq null }">
								<div id="pre10" onclick="location.href='news.do?page=${page - 10 }'">◀</div>
							</c:when>
							<c:otherwise>
								<div id="pre10" onclick="location.href='news.do?page=${page - 10 }&b_cate2=${b_cate2 }'">◀</div>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${page gt 1 }">
						<c:choose>
							<c:when test="${b_cate2 eq null }">
								<div id="pre" onclick="location.href='news.do?page=${page - 1 }'">◁</div>
							</c:when>
							<c:otherwise>
								<div id="pre" onclick="location.href='news.do?page=${page - 1 }&b_cate2=${b_cate2 }'">◁</div>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
				<div id="pagenum">
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<c:if test="${i eq page }">
							<div id="curpage">${i }</div>
						</c:if>
						<c:if test="${i ne page }">
							<c:choose>
								<c:when test="${b_cate2 eq null }">
									<div id="ncurpage" onclick="location.href='news.do?page=${i }'">${i }</div>
								</c:when>
								<c:otherwise>
									<div id="ncurpage" onclick="location.href='news.do?page=${i }&b_cate2=${b_cate2 }'">${i }</div>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</div>
				<div id="pagenex">
					<c:if test="${page lt totalPage }">
						<c:choose>
							<c:when test="${b_cate2 eq null }">
								<div id="nex"
									onclick="location.href='news.do?page=${page + 1 }'">▷</div>
							</c:when>
							<c:otherwise>
								<div id="nex"
									onclick="location.href='news.do?page=${page + 1 }&b_cate2=${b_cate2 }'">▷</div>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${page lt totalPage - 9 }">
						<c:choose>
							<c:when test="${b_cate2 eq null }">
								<div id="nex10"
									onclick="location.href='news.do?page=${page + 10  }'">▶</div>
							</c:when>
							<c:otherwise>
								<div id="nex10"
									onclick="location.href='news.do?page=${page + 10  }&b_cate2=${b_cate2 }'">▶</div>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</c:if>
		</div>

		<form action="news.do" method="post">
			<div id="listBottom">
				<select name="searchID" id="id" onchange="select()">
					<option value="b_title">제목</option>
					<option value="b_content">내용</option>
				</select>
				<div id="search">
					<input name="searchCont" placeholder="검색어 입력"
						onchange="return check();">
					<button onchange="select()">
						<img alt="검색" src="./img/search.png">
					</button>
				</div>
				<c:if test="${sessionScope.id ne null }">
					<a id="writelink" href="write.do?b_cate1='nw">글쓰기</a>
				</c:if>
			</div>
		</form>

		<%@ include file="bottonmenu.jsp"%>
	</div>

</body>
</html>
